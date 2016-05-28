package com.epss.controller;

import com.fasterxml.jackson.annotation.JsonView;

import java.util.List;
import java.util.Map;

public class AjaxResponseBody {

	@JsonView(Views.Public.class)
	String msg;
	@JsonView(Views.Public.class)
	List<String> list;
	@JsonView(Views.Public.class)
	String code;
	@JsonView(Views.Public.class)
	Map<Integer,String> univers;

	public Map<Integer, String> getUnivers() {
		return univers;
	}

	public void setUnivers(Map<Integer, String> univers) {
		this.univers = univers;
	}

	public List<String> getList() {
		return list;
	}

	public void setList(List<String> list) {
		this.list = list;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}


	@Override
	public String toString() {
		return "AjaxResponseResult [msg=" + msg + ", code=" + code + ", result=" + univers + "]";
	}

}
