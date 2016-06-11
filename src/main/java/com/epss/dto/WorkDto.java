package com.epss.dto;


import com.epss.model.Work;

public class WorkDto extends Work{

    private String workKind;

    public WorkDto(Work work, String workKind) {
        super(work);
        this.workKind=workKind;
    }

    public String getWorkKind() {
        return workKind;
    }

    public void setWorkKind(String workKind) {
        this.workKind = workKind;
    }
}
