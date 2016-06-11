package com.epss.service;


import com.epss.dto.ManualDto;

import java.util.List;

public interface ManualService {

    List<ManualDto> getManualsForDiscipline(int id);
}
