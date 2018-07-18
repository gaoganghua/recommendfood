package com.recommendfood.util;

public enum QueryTypeEnum {
	TOTAL_RECORD("select count(*) "),
	MAX_RECORD("select max() "),
	MIN_RECORD("select min() ");
	
	private String value;
	private QueryTypeEnum(String value){
		this.value = value;
	}
	public String getValue(){
		return value;
	}
}
