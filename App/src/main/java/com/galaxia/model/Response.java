package com.galaxia.model;



public class Response {
	
	public static final String OK = "Ok";
	public static final String FAIL = "Failed";
	private String code;
	private String message;
	
	public Response(String code, String message) {
		super();
		this.code = code;
		this.message = message;
	}
	
	public String getCode() {
		return code;
	}
	
	public String getMessage() {
		return message;
	}

}