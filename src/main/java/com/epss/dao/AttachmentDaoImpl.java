package com.epss.dao;


import com.epss.model.Attachment;
import org.springframework.stereotype.Repository;

@Repository("attachmentDao")
public class AttachmentDaoImpl extends AbstractDao<Integer, Attachment> implements AttachmentDao{


    @Override
    public Attachment getAttachmentById(int id) {
        return getByKey(id);
    }
}
