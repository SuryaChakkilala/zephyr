package com.zephyr.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiabetesDataDto {
	private double glucose;
	private double bloodPressure;
	private double skinThickness;
	private double insulin;
	private double bmi;
	private double age;
}
