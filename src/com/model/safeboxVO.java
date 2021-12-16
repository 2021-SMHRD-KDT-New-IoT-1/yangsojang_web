package com.model;

public class safeboxVO {
	
	private int device_seq;
	private String device_id;
	private String device_location;
	private String device_status;
	private String reg_date;
	private String admin_id;
	
	//전체 생성자 
	public safeboxVO(int device_seq, String device_id, String device_location, String device_status, String reg_date,
			String admin_id) {
		super();
		this.device_seq = device_seq;
		this.device_id = device_id;
		this.device_location = device_location;
		this.device_status = device_status;
		this.reg_date = reg_date;
		this.admin_id = admin_id;
	}
	
	//센서 추가 페이지의 기기 리스트 생성자
	public safeboxVO(int device_seq, String device_id) {
		super();
		this.device_seq = device_seq;
		this.device_id = device_id;
	}

	public int getDevice_seq() {
		return device_seq;
	}

	public void setDevice_seq(int device_seq) {
		this.device_seq = device_seq;
	}

	public String getDevice_id() {
		return device_id;
	}

	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}

	public String getDevice_location() {
		return device_location;
	}

	public void setDevice_location(String device_location) {
		this.device_location = device_location;
	}

	public String getDevice_status() {
		return device_status;
	}

	public void setDevice_status(String device_status) {
		this.device_status = device_status;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	
	
	
	
	
}
