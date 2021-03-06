package com.app.note.bean;


/**
 * Created by Preksha
 */

public enum UserType implements IEnum{

	ADMIN("ADMIN"),
	DBUSER("DBUSER"),
	VIEWER("VIEWER"),
	ENDUSER("ENDUSER");
	
	private String value;
	
	private UserType(String value){
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
	
}
