package com.epss.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "LECTOR_DISCIPLINE")
public class LectorDiscipline implements Serializable {

    @Id
    @NotNull
    @Column(name = "LECTOR_ID")
    private Integer lectorId;
    @Id
    @NotNull
    @Column(name = "DISCIPLINE_ID")
    private Integer disciplineId;

    public Integer getLectorId() {
        return lectorId;
    }

    public void setLectorId(Integer lectorId) {
        this.lectorId = lectorId;
    }

    public Integer getDisciplineId() {
        return disciplineId;
    }

    public void setDisciplineId(Integer disciplineId) {
        this.disciplineId = disciplineId;
    }
}
