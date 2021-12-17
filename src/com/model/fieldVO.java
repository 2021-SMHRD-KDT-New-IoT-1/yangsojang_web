package com.model;

public class fieldVO {
	
	private int field_seq; //현장번호pk
	private String field_name; //현장이름
	private String field_addr; //현장주소
	private String field_memo; //현장메모
	private String field_file;
	
	//전체 생성자
	public fieldVO(int field_seq, String field_name, String field_addr, String field_memo, String field_file) {
		super();
		this.field_seq = field_seq;
		this.field_name = field_name;
		this.field_addr = field_addr;
		this.field_memo = field_memo;
		this.field_file = field_file;
	}
	
	//현장 추가 생성자
	public fieldVO(String field_name, String field_addr, String field_memo, String field_file) {
		super();
		this.field_name = field_name;
		this.field_addr = field_addr;
		this.field_memo = field_memo;
		this.field_file = field_file;
	}
	
	//현장 리스트 생성자
	public fieldVO(int field_seq, String field_name, String field_addr) {
		super();
		this.field_seq = field_seq;
		this.field_name = field_name;
		this.field_addr = field_addr;
	}
	
	// 현장 one select 생성자
	public fieldVO(int field_seq) {
		super();
		this.field_seq = field_seq;
	}
	
	// 현장 one select 생성자
	public fieldVO(String field_name) {
		super();
		this.field_name = field_name;
	}


	public int getField_seq() {
		return field_seq;
	}

	

	
	public void setField_seq(int field_seq) {
		this.field_seq = field_seq;
	}

	public String getField_name() {
		return field_name;
	}

	public void setField_name(String field_name) {
		this.field_name = field_name;
	}

	public String getField_addr() {
		return field_addr;
	}

	public void setField_addr(String field_addr) {
		this.field_addr = field_addr;
	}

	public String getField_memo() {
		return field_memo;
	}

	public void setField_memo(String field_memo) {
		this.field_memo = field_memo;
	}

	public String getField_file() {
		return field_file;
	}

	public void setField_file(String field_file) {
		this.field_file = field_file;
	}
	
	
	
	
	
	
	
	
}

