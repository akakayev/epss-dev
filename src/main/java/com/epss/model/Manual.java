package com.epss.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "MANUALS")
public class Manual {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    @Column(name = "DISCIPLINE", nullable = false)
    private Integer discipline;

    @NotNull
    @Column(name = "ATTACHMENT_ID", nullable = false)
    private Integer AttachmentId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDiscipline() {
        return discipline;
    }

    public void setDiscipline(Integer discipline) {
        this.discipline = discipline;
    }

    public Integer getAttachmentId() {
        return AttachmentId;
    }

    public void setAttachmentId(Integer attachmentId) {
        AttachmentId = attachmentId;
    }
}
