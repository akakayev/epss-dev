package com.epss.dto;

import com.epss.model.AcademicPlan;
import com.fasterxml.jackson.annotation.JsonView;

public class AcademicPlanDto extends AcademicPlan{

    @JsonView(Views.Public.class)
    private String discipline;

    public AcademicPlanDto(AcademicPlan academicPlan, String discipline) {
        super(academicPlan);
        this.discipline = discipline;
    }

    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }
}
