package com.epss.service;

import com.epss.dto.LectorRegistrationDto;
import com.epss.model.Lector;

public interface LectorService {

    public void saveLector(LectorRegistrationDto lector);
}
