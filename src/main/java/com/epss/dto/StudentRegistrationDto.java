package com.epss.dto;


import com.epss.model.Student;
import com.epss.model.User;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

public class StudentRegistrationDto {

    private Integer recordBookNumber;
    private Byte semester;
    private Integer group;
    private User user;

    public StudentRegistrationDto(){}
    public StudentRegistrationDto(Student student, User user){
        this.user=user;
        this.recordBookNumber=student.getRecordBookNumber();
        this.semester=student.getSemester();
        this.group=student.getGroup();
    }

    public Integer getRecordBookNumber() {
        return recordBookNumber;
    }

    public void setRecordBookNumber(Integer recordBookNumber) {
        this.recordBookNumber = recordBookNumber;
    }

    public Byte getSemester() {
        return semester;
    }

    public void setSemester(Byte semester) {
        this.semester = semester;
    }

    public Integer getGroup() {
        return group;
    }

    public void setGroup(Integer group) {
        this.group = group;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
