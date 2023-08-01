package com.zephyr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zephyr.dto.DiabetesDataDto;
import com.zephyr.dto.HeartDataDto;
import com.zephyr.service.DoctorZephyrService;

@Controller
@RequestMapping("/drzephyr")
public class DoctorController {
	
	@Autowired
	private DoctorZephyrService doctorZephyrService;

	@GetMapping
	public String showDoctorZephyrPage() {
		return "doctor-zephyr";
	}
	
	@GetMapping("/checkdiabetes")
	public String showDiabetesCheckForm(Model model) {
		model.addAttribute("dto", new DiabetesDataDto());
		return "check-diabetes-form";
	}
	
	@PostMapping("/checkdiabetes")
	public String processDiabetesCheckForm(@ModelAttribute("dto") DiabetesDataDto dto, Model model) {
		String response = doctorZephyrService.predictDiabetes(dto);
		model.addAttribute("response", response);
		return "check-diabetes-form";
	}
	
	@GetMapping("/checkheartdisease")
	public String showHeartDiseaseCheckForm(Model model) {
		model.addAttribute("dto", new HeartDataDto());
		return "check-heart-disease-form";
	}
	
	@PostMapping("/checkheartdisease")
	public String processHeartDiseaseCheckForm(@ModelAttribute("dto") HeartDataDto dto, Model model) {
		String response = doctorZephyrService.predictHeartDisease(dto);
		model.addAttribute("response", response);
		return "check-heart-disease-form";
	}
	
}
