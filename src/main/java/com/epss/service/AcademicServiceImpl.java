package com.epss.service;

import com.epss.dao.AcademicPlanDao;
import com.epss.model.AcademicPlan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("academicService")
@Transactional
public class AcademicServiceImpl implements AcademicService {

    @Autowired
    private AcademicPlanDao academicPlanDao;

    @Override
    public Map<Integer, List<AcademicPlan>> getPlanForDepartment(int id) {
        HashMap<Integer, List<AcademicPlan>> result = new HashMap<Integer, List<AcademicPlan>>();
        for (int i = 0; i < 12; i++) {
            List<AcademicPlan> academicPlan = academicPlanDao.getPlanForDepartmentInSemester(id, i+1);
            result.put(i+1, academicPlan);
        }
        return result;
    }
}
