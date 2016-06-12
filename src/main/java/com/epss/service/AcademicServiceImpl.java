package com.epss.service;

import com.epss.dao.AcademicPlanDao;
import com.epss.dao.SemesterResultDao;
import com.epss.dto.AcademicPlanDto;
import com.epss.dto.RecordBookEntry;
import com.epss.model.AcademicPlan;
import com.epss.model.SemesterResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service("academicService")
@Transactional
public class AcademicServiceImpl implements AcademicService {

    @Autowired
    private AcademicPlanDao academicPlanDao;

    @Autowired
    private DisciplineService disciplineService;

    @Autowired
    private SemesterResultDao semesterResultDao;

    @Autowired
    private LectorService lectorService;

    @Autowired
    private UserService userService;

    @Override
    public Map<Integer, List<AcademicPlanDto>> getPlanForDepartment(int id) {
        HashMap<Integer, List<AcademicPlanDto>> result = new HashMap<Integer, List<AcademicPlanDto>>();
        for (int i = 0; i < 12; i++) {
            List<AcademicPlan> academicPlan = academicPlanDao.getPlanForDepartmentInSemester(id, i+1);
            List<AcademicPlanDto> academicPlanDtos= new LinkedList<>();
            for (AcademicPlan plan:academicPlan){
                academicPlanDtos.add(new AcademicPlanDto(plan, disciplineService.getDisciplinesWithIds(plan.getDisciplineId()).get(0).getName()));
            }
            result.put(i+1, academicPlanDtos);
        }
        return result;
    }

    @Override
    public Map<Integer, List<RecordBookEntry>> getRecordBookForStudent(int id) {
        List<SemesterResult> semesterResults=semesterResultDao.getSemesterResultForStudent(id);
        Map<Integer, AcademicPlan> entries= getAcademicPlanEntries(semesterResults);
        Map<Integer, List<RecordBookEntry>> result= new HashMap<Integer, List<RecordBookEntry>>();
        for(SemesterResult semesterResult:semesterResults){
            List<RecordBookEntry> recordBookEntries= new LinkedList<>();
            AcademicPlan plan=entries.get(semesterResult.getDiscipline());
            int semester=plan.getSemester();
            int discId=plan.getDisciplineId();
            String lector=userService.findById(lectorService.getLectorById(semesterResult.getLectorId()).getUserId()).getLastName();
            String discipline= disciplineService.getDisciplinesWithIds(discId).get(0).getName();
            String evaluation=plan.getEvaluation();
            RecordBookEntry record= new RecordBookEntry(semesterResult, lector, discipline, evaluation);
            recordBookEntries=result.get(semester);
            if(recordBookEntries==null){
                recordBookEntries=new LinkedList<>();
            }
            recordBookEntries.add(record);
            result.put(semester, recordBookEntries);
        }
        return result;
    }

    private Map<Integer, AcademicPlan> getAcademicPlanEntries(List<SemesterResult> semesterResults){
        Map<Integer, AcademicPlan> result= new HashMap<>();
        List<Integer> ids= new LinkedList<>();
        for(SemesterResult semesterResult:semesterResults){
            ids.add(semesterResult.getDiscipline());
        }
        List<AcademicPlan> academicPlanList=academicPlanDao.getPlanEntriesWithIds(ids);
        for(AcademicPlan academicPlan:academicPlanList){
            result.put(academicPlan.getId(), academicPlan);
        }
        return result;
    }
}
