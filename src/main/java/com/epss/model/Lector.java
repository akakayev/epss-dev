package com.epss.model;

import com.epss.dto.LectorRegistrationDto;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "LECTORS")
public class Lector {

    public Lector(){}
    public Lector(LectorRegistrationDto lectorRegistrationDto){
        this.degree=lectorRegistrationDto.getDegree();
        this.departmentId=lectorRegistrationDto.getDepartmentId();
        this.position=lectorRegistrationDto.getPosition();
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotEmpty
    @Column(name = "DEGREE", nullable = false)
    private String degree;

    @NotEmpty
    @Column(name = "POSITION", nullable = false)
    private  String position;

    @NotNull
    @Column(name = "DEPARTMENT_ID", nullable = false)
    private Integer departmentId;

    @NotNull
    @Column(name = "USER_ID", nullable = false)
    private Integer userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
