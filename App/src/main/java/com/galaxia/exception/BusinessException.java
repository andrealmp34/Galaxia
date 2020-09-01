package com.galaxia.exception;


import com.galaxia.model.Response;

public class BusinessException extends Exception{
	
	private static final long serialVersionUID = -1593016764071232306L;
	
	public static String INI_PRECISION = "Precision debe estar entre 0 y 3, siendo el mas optimo la precision=1";
	public static String INI_DESTROY = "Destroy debe ser 0 o 1, siendo 0 para no destruir la galaxia y uno para destruirla";
	public static String INI_ERROR ="Error al crear la galaxy, contacte al adminitrador";
	public static String PERIODS ="Valores permitidos para tipo son: ['sequia', 'lluvia', 'nollueve', 'optimo']";
	public static String WEATHER ="El dia es obligatorio, debe estar entre 0 y 3650 años";
	
	Response response;
	
	public BusinessException(String message) {
		super(message);
		response = new Response(Response.FAIL, message);
		
	}
	
	public static BusinessException init(String message){
		return new BusinessException(message);
	}
	
	public Response getResponde() {
		return response;
	}
	
	

}
