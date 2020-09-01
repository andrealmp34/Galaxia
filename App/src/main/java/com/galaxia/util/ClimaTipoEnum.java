package com.galaxia.util;

public enum  ClimaTipoEnum{
		SEQUIA   ("Sequia"),
		LLUVIA   ("Llueve"),
		NOLLUVIA   ("Nllueve"),
		OPTIMO     ("Optimo");

		
		private String type;
		
		private ClimaTipoEnum(String type) {
			this.type = type;
		}
		
		public String type() {
			return this.type;
		}
}
