package com.epss.service;

import com.epss.dto.LectorRegistrationDto;
import com.epss.model.Discipline;
import com.epss.model.Lector;

import java.util.List;

public interface LectorService {

    public void saveLector(LectorRegistrationDto lector);

    public LectorRegistrationDto getLectorByLogin(String login);

    public List<Discipline> getDisciplineListForLector(int id);

    public Lector getLectorById(int id);
}
