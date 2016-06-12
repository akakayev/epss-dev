package com.epss.service;

import com.epss.dao.AcademicPlanDao;
import com.epss.dto.AcademicPlanDto;
import com.epss.model.AcademicPlan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service("academicService")
@Transactional
public class AcademicServiceImpl implements AcademicService {

    @Autowired
    private AcademicPlanDao academicPlanDao;

    @Override
    public Map<Integer, List<AcademicPlanDto>> getPlanForDepartment(int id) {
        HashMap<Integer, List<AcademicPlanDto>> result = new HashMap<Integer, List<AcademicPlanDto>>();
        for (int i = 0; i < 12; i++) {
            List<AcademicPlan> academicPlan = academicPlanDao.getPlanForDepartmentInSemester(id, i+1);
            List<AcademicPlanDto> academicPlanDtos= new LinkedList<>();
            for (AcademicPlan plan:academicPlan){
                academicPlanDtos.add(new AcademicPlanDto(plan, ""));
            }
            result.put(i+1, academicPlanDtos);
        }
        return result;
    }
}
