package com.epss.service;


import com.epss.model.AcademicPlan;

import java.util.List;
import java.util.Map;

public interface AcademicService {

    public Map<Integer, List<AcademicPlan>> getPlanForDepartment(int id);
}
