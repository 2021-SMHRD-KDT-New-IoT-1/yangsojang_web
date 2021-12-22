package com.model;

public class noticeVO {

	private int notice_seq;
	private String notice_content;
	private String notice_date;
	private int device_seq;
	private int notice_check;
	
	public noticeVO(int notice_seq, String notice_content, String notice_date, int device_seq, int notice_check) {
		super();
		this.notice_seq = notice_seq;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.device_seq = device_seq;
		this.notice_check = notice_check;
	}

	public int getNotice_seq() {
		return notice_seq;
	}

	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public int getDevice_seq() {
		return device_seq;
	}

	public void setDevice_seq(int device_seq) {
		this.device_seq = device_seq;
	}

	public int getNotice_check() {
		return notice_check;
	}

	public void setNotice_check(int notice_check) {
		this.notice_check = notice_check;
	}
	
	
	
	
}
