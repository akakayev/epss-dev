package com.epss.service;

import com.epss.dao.AttachmentDao;
import com.epss.dao.DisciplineDao;
import com.epss.dao.ManualDao;
import com.epss.dto.ManualDto;
import com.epss.model.Manual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

@Service("manualService")
@Transactional
public class ManualServiceImpl implements ManualService{

    @Autowired
    private AttachmentDao attachmentDao;

    @Autowired
    private ManualDao manualDao;

    @Autowired
    private DisciplineDao disciplineDao;

    @Override
    public List<ManualDto> getManualsForDiscipline(int id) {
        List<Manual> manuals= manualDao.getManualsListForDiscipline(id);
        List<ManualDto> result = new LinkedList<ManualDto>();
        for(Manual manual:manuals){
            result.add(new ManualDto(manual,
                    attachmentDao.getAttachmentById(manual.getAttachmentId())).
                    setDisciplineName(disciplineDao.getDisciplinesWithIds(Arrays.asList(manual.getDiscipline())).get(0).getName()));
        }
        return result;
    }
}
