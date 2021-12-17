package com.model;

public class fieldVO {
	
	private String fieldSeq; //현장번호pk
	private String fieldName; //현장이름
	private String fieldAddr; //현장주소
	private String fieldMemo; //현장메모
	
	public fieldVO(String fieldSeq, String fieldName, String fieldAddr, String fieldMemo) {
		
		this.fieldSeq = fieldSeq;
		this.fieldName = fieldName;
		this.fieldAddr = fieldAddr;
		this.fieldMemo = fieldMemo;
	}

	public String getFieldSeq() {
		return fieldSeq;
	}

	public void setFieldSeq(String fieldSeq) {
		this.fieldSeq = fieldSeq;
	}

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

	public String getFieldMemo() {
		return fieldMemo;
	}

	public void setFieldmemo(String fieldMemo) {
		this.fieldMemo = fieldMemo;
	}
	
	
	
	
}

