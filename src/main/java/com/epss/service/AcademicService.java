package com.epss.service;


import com.epss.dto.AcademicPlanDto;
import com.epss.dto.RecordBookEntry;
import com.epss.model.AcademicPlan;

import java.util.List;
import java.util.Map;

public interface AcademicService {

    public Map<Integer, List<AcademicPlanDto>> getPlanForDepartment(int id);

    public Map<Integer, List<RecordBookEntry>> getRecordBookForStudent(int id);
}
