package com.epss.dao;


import com.epss.model.AcademicPlan;

import java.util.List;

public interface AcademicPlanDao {

    public List<AcademicPlan> getPlanForDepartment(int id);

    public List<AcademicPlan> getPlanForDepartmentInSemester(int id, int semester);

}
