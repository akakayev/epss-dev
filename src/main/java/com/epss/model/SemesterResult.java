package com.epss.model;

import com.epss.dto.Views;
import com.fasterxml.jackson.annotation.JsonView;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "SEMESTER_RESULTS")
public class SemesterResult {

    public SemesterResult(){}
    public SemesterResult(SemesterResult semesterResult) {
        this.studentId = semesterResult.getStudentId();
        this.lectorId = semesterResult.getLectorId();
        this.discipline = semesterResult.getDiscipline();
        this.score = semesterResult.getScore();
        this.date = semesterResult.getDate();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    @Column(name = "STUDENT_ID")
    private Integer studentId;

    @NotNull
    @Column(name = "LECTOR_ID")
    private Integer lectorId;

    @NotNull
    @Column(name = "DISCIPLINE")
    private Integer discipline;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "SCORE")
    protected Integer score;

    @JsonView(Views.Public.class)
    @Temporal(TemporalType.TIMESTAMP)
    @NotNull
    @Column(name = "DATE")
    protected Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getLectorId() {
        return lectorId;
    }

    public void setLectorId(Integer lectorId) {
        this.lectorId = lectorId;
    }

    public Integer getDiscipline() {
        return discipline;
    }

    public void setDiscipline(Integer discipline) {
        this.discipline = discipline;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
