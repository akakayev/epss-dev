package com.epss.dao;

import com.epss.model.DepartmentDetails;

/**
 * Created by Артём on 09.06.2016.
 */
public interface DepartmentDetailsDao {

    public DepartmentDetails getDetails(int id);

    public void addDetails(DepartmentDetails departmentDetails);
}
