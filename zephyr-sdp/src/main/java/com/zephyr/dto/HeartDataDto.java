package com.zephyr.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HeartDataDto {
	private int age;
	private String sex;
	private double trestbps;
	private double chol;
	private double fbs;
	private double restecg;
	private double thalach;
	private double exang;
}
