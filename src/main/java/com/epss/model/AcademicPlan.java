package com.epss.model;

import com.epss.dto.Views;
import com.fasterxml.jackson.annotation.JsonView;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "ACADEMIC_PLAN")
public class AcademicPlan {

    @JsonView(Views.Public.class)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "COURSE", nullable = false)
    private Integer course;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "SEMESTER", nullable = false)
    private Integer semester;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "DISCIPLINE_ID", nullable = false)
    private Integer disciplineId;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "HOURS", nullable = false)
    protected Integer hours;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "LECTURES", nullable = false)
    protected Integer lectures;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "LABS", nullable = false)
    protected Integer labs;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "SEMINARS", nullable = false)
    protected Integer seminars;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "DIPLOMA", nullable = false)
    protected Byte diploma;

    @JsonView(Views.Public.class)
    @NotEmpty
    @Column(name = "EVALUATION", nullable = false)
    protected String evaluation;

    @JsonView(Views.Public.class)
    @NotEmpty
    @Column(name = "EDUCATION_FORM", nullable = false)
    private String educationForm;

    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "DEPARTMENT", nullable = false)
    protected Integer department;

    public AcademicPlan() {
    }

    public AcademicPlan(AcademicPlan academicPlan) {
        this.course = academicPlan.getCourse();
        this.semester = academicPlan.getSemester();
        this.disciplineId = academicPlan.getDisciplineId();
        this.hours = academicPlan.getHours();
        this.lectures = academicPlan.getLectures();
        this.labs = academicPlan.getLabs();
        this.seminars = academicPlan.getSeminars();
        this.diploma = academicPlan.getDiploma();
        this.evaluation = academicPlan.getEvaluation();
        this.educationForm = academicPlan.getEducationForm();
        this.department = academicPlan.getDepartment();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourse() {
        return course;
    }

    public void setCourse(Integer course) {
        this.course = course;
    }

    public Integer getSemester() {
        return semester;
    }

    public void setSemester(Integer semester) {
        this.semester = semester;
    }

    public Integer getDisciplineId() {
        return disciplineId;
    }

    public void setDisciplineId(Integer disciplineId) {
        this.disciplineId = disciplineId;
    }

    public Integer getHours() {
        return hours;
    }

    public void setHours(Integer hours) {
        this.hours = hours;
    }

    public Integer getLectures() {
        return lectures;
    }

    public void setLectures(Integer lectures) {
        this.lectures = lectures;
    }

    public Integer getLabs() {
        return labs;
    }

    public void setLabs(Integer labs) {
        this.labs = labs;
    }

    public Integer getSeminars() {
        return seminars;
    }

    public void setSeminars(Integer seminars) {
        this.seminars = seminars;
    }

    public Byte getDiploma() {
        return diploma;
    }

    public void setDiploma(Byte diploma) {
        this.diploma = diploma;
    }

    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }

    public String getEducationForm() {
        return educationForm;
    }

    public void setEducationForm(String educationForm) {
        this.educationForm = educationForm;
    }

    public Integer getDepartment() {
        return department;
    }

    public void setDepartment(Integer department) {
        this.department = department;
    }
}
