package com.epss.model;


import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "DEPARTMENT_DETAILS")
public class DepartmentDetails implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    @Column(name = "MANAGER", nullable = false)
    private Integer manager;

    @NotEmpty
    @Column(name = "DESCRIPTION", nullable = false)
    private String Description;

    @Column(name = "LOGO", nullable = true)
    private byte [] logo;

    @NotNull
    @Column(name = "HOUSING_ID", nullable = false)
    private Integer housingId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getManager() {
        return manager;
    }

    public void setManager(Integer manager) {
        this.manager = manager;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public byte[] getLogo() {
        return logo;
    }

    public void setLogo(byte[] logo) {
        this.logo = logo;
    }

    public Integer getHousingId() {
        return housingId;
    }

    public void setHousingId(Integer housingId) {
        this.housingId = housingId;
    }
}
