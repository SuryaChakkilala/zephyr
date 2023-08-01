package com.zephyr.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.zephyr.validation.FieldMatch;
import com.zephyr.validation.ValidEmail;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@FieldMatch.List({
	@FieldMatch(first="password", second="matchingPassword")
})
@Getter
@Setter
@NoArgsConstructor
public class CrmUser {

	@NotNull(message="is required")
	@Size(min=1, message="is required")
	private String username;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String password;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String matchingPassword;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String firstName;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String lastName;

	@ValidEmail
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String email;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String gender;
}