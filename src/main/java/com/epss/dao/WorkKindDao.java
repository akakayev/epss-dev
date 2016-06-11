package com.epss.dao;


import java.util.List;

public interface WorkKindDao {

    public String getKindOfWork(int id);

    public List<String> getAllKinds();
}
