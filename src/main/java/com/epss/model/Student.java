package com.epss.model;

import com.epss.dto.StudentRegistrationDto;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "STUDENTS")
public class Student implements Serializable {

    public Student(StudentRegistrationDto studentRegistrationDto){
        this.recordBookNumber=studentRegistrationDto.getRecordBookNumber();
        this.group= studentRegistrationDto.getGroup();
        this.semester=studentRegistrationDto.getSemester();
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    @Column(name = "RECORD_BOOK_NUMBER", nullable = false)
    private Integer recordBookNumber;

    @NotNull
    @Column(name = "SEMESTER", nullable = false)
    private Byte semester;

    //join
    @NotNull
    @Column(name = "GROUP_ID", nullable = false)
    private Integer group;
    @NotNull
    @Column(name = "USER_ID", nullable = false)
    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGroup() {
        return group;
    }

    public void setGroup(Integer group) {
        this.group = group;
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


}
