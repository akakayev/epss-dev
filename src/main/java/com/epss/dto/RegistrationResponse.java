package com.epss.dto;

import com.fasterxml.jackson.annotation.JsonView;

public class RegistrationResponse {

	@JsonView(Views.Public.class)
	String message;
	@JsonView(Views.Public.class)
	Boolean success;

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "AjaxResponseResult message=" + message;
	}

}
