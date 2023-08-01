package com.zephyr.service;

import com.zephyr.dto.DiabetesDataDto;
import com.zephyr.dto.HeartDataDto;

public interface DoctorZephyrService {
	public String predictHeartDisease(HeartDataDto dto);
	public String predictDiabetes(DiabetesDataDto dto);
}
