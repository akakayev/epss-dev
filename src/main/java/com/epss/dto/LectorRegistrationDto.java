package com.epss.dto;

import com.epss.model.Lector;
import com.epss.model.User;


public class LectorRegistrationDto {

    private String degree;
    private  String position;
    private String departmentName;
    private Integer departmentId;
    private Integer userId;
    private User user;

    public LectorRegistrationDto(){}
    public LectorRegistrationDto(Lector lector, User user){
        this.user=user;
        this.degree=lector.getDegree();
        this.position=lector.getPosition();
        this.userId=lector.getUserId();
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
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

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
