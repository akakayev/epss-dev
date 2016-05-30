package com.epss.dao;


import com.epss.model.Group;

import java.util.List;

public interface GroupDao {

    public List<Group> getGroupList();

    public Group getGroupById(int id);
}
