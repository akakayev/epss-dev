package com.epss.service;


import com.epss.model.Work;
import com.epss.model.WorkKind;

public interface WorkService {

    public Work getWork(int id);

    public void addWork(Work work);

    public String getWorkKind(int id);
}
