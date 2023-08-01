package com.zephyr.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.zephyr.dto.DiabetesDataDto;
import com.zephyr.dto.HeartDataDto;
import com.zephyr.service.DoctorZephyrService;

@Service
public class DoctorZephyrServiceImpl implements DoctorZephyrService {

	@Autowired
	private RestTemplate rest;
	
	@Override
	public String predictHeartDisease(HeartDataDto dto) {
		String url = "http://localhost:5000/heartdisease";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<HeartDataDto> request = new HttpEntity<>(dto);
		String response = rest.postForObject(url, request, String.class);
		return response;
	}

	@Override
	public String predictDiabetes(DiabetesDataDto dto) {
		String url = "http://localhost:5000/diabetes";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<DiabetesDataDto> request = new HttpEntity<>(dto);
		String response = rest.postForObject(url, request, String.class);
		return response;
	}

}
