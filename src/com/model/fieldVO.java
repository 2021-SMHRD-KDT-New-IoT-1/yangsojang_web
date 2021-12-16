package com.model;

public class fieldVO {

	private String fieldName; //현장이름
	private String fieldAddr; //현장주소
	private String fieldmemo; //현장메모
	
	//생성자
	public fieldVO(String fieldName, String fieldAddr, String fieldmemo) {
		this.fieldName = fieldName;
		this.fieldAddr = fieldAddr;
		this.fieldmemo = fieldmemo;
	}
	
	//게더세더
	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldAddr() {
		return fieldAddr;
	}

	public void setFieldAddr(String fieldAddr) {
		this.fieldAddr = fieldAddr;
	}

	public String getFieldmemo() {
		return fieldmemo;
	}

	public void setFieldmemo(String fieldmemo) {
		this.fieldmemo = fieldmemo;
	}
	
	
	
}


