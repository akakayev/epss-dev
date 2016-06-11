package com.epss.model;

import com.epss.dto.Views;
import com.fasterxml.jackson.annotation.JsonView;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "FACULTIES")
public class Faculty {

    @JsonView(Views.Public.class)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @JsonView(Views.Public.class)
    @NotEmpty
    @Column(name = "NAME", nullable = false)
    private String name;

    @JsonView(Views.Public.class)
    @NotEmpty
    @Column(name = "ABBREVIATION", nullable = false)
    private String abbreviation;
    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "INSTITUTION_ID", nullable = false)
    private Integer institutionId;
    @JsonView(Views.Public.class)
    @NotNull
    @Column(name = "DETAILS_ID", nullable = false)
    private Integer details_id;
    @JsonView(Views.Public.class)
    @NotEmpty
    @Column(name = "GRADATION", nullable = false)
    private String gradation;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public Integer getInstitutionId() {
        return institutionId;
    }

    public void setInstitutionId(Integer institutionId) {
        this.institutionId = institutionId;
    }

    public Integer getDetails_id() {
        return details_id;
    }

    public void setDetails_id(Integer details_id) {
        this.details_id = details_id;
    }

    public String getGradation() {
        return gradation;
    }

    public void setGradation(String gradation) {
        this.gradation = gradation;
    }
}
