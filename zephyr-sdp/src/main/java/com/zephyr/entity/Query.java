package com.zephyr.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="query")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Query {
	@Id
	@GeneratedValue
	private long id;
	private String name;
	private String queryString;
	private String email;
	private String reply;
}
