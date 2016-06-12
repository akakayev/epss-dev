package com.epss.dto;

import com.epss.model.SemesterResult;

public class RecordBookEntry extends SemesterResult{

    private String lector;
    private String disciplineName;
    private String evaluation;

    public RecordBookEntry(SemesterResult semesterResult, String lector, String disciplineName, String evaluation) {
        super(semesterResult);
        this.lector = lector;
        this.disciplineName = disciplineName;
        this.evaluation = evaluation;
    }

    public String getLector() {
        return lector;
    }

    public void setLector(String lector) {
        this.lector = lector;
    }

    public String getDisciplineName() {
        return disciplineName;
    }

    public void setDisciplineName(String disciplineName) {
        this.disciplineName = disciplineName;
    }

    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }
}
