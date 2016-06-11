package com.epss.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.scheduling.annotation.EnableScheduling;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "ATTACHMENTS")
public class Attachment {

    public Attachment(){}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Integer id;

    @NotEmpty
    @Column(name = "FILE_NAME", nullable = false)
    protected String fileName;

    @Column(name = "SIZE", nullable = true)
    protected Integer size;

    @Column(name = "FORMAT", nullable = true)
    protected String format;

    @Column(name = "FILE", nullable = true)
    protected byte[] file;

    @Column(name = "LINK", nullable = true)
    protected String link;

    @Column(name = "ATTACHMENT_KIND", nullable = true)
    protected String attachmentKind;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getAttachmentKind() {
        return attachmentKind;
    }

    public void setAttachmentKind(String attachmentKind) {
        this.attachmentKind = attachmentKind;
    }
}
