package com.epss.dto;

import com.epss.model.Attachment;
import com.epss.model.Manual;

public class ManualDto extends Attachment{

    private Integer id;
    private Integer disciplineId;
    private String disciplineName;

    public ManualDto(){}
    public ManualDto(Manual manual, Attachment attachment){
        this.id=manual.getId();
        this.disciplineId= manual.getDiscipline();
        this.fileName=attachment.getFileName();
        this.file=attachment.getFile();
        this.link=attachment.getLink();
        this.attachmentKind=attachment.getAttachmentKind();
        this.format=attachment.getFormat();
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDisciplineId() {
        return disciplineId;
    }

    public void setDisciplineId(Integer disciplineId) {
        this.disciplineId = disciplineId;
    }

    public String getDisciplineName() {
        return disciplineName;
    }

    public ManualDto setDisciplineName(String disciplineName) {
        this.disciplineName = disciplineName;
        return this;
    }
}
