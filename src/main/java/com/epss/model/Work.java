package com.epss.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "WORKS")
public class Work {

    public Work(Work work) {
        this.disciplineId = work.getDisciplineId();
        this.workKindId = work.getWorkKindId();
        this.number = work.getNumber();
        this.theme = work.getTheme();
        DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/MM/yyyy");
        this.deadline = formatter.parseDateTime(work.getDeadline()).toDate();
    }

    public Work(){}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Integer id;

    @NotNull
    @Column(name = "DISCIPLINE_ID", nullable = false)
    protected Integer disciplineId;

    @NotNull
    @Column(name = "WORK_KIND_ID", nullable = false)
    protected Integer workKindId;

    @NotNull
    @Column(name = "NUMBER", nullable = false)
    protected Integer number;

    @NotEmpty
    @Column(name = "THEME", nullable = false)
    protected String theme;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "DEADLINE", nullable = true)
    protected Date deadline;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDisciplineId() {
        return disciplineId;
    }

    public void setDisciplineId(Integer disciplineId) {
        this.disciplineId = disciplineId;
    }

    public Integer getWorkKindId() {
        return workKindId;
    }

    public void setWorkKindId(Integer workKindId) {
        this.workKindId = workKindId;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getDeadline() {
        return new DateTime(deadline).toString("dd/MM/yyyy");
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

}
