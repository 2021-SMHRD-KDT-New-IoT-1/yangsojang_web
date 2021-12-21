package com.model;

public class boardVO {
	
	private String mnt_seq;
	private String mnt_title;
	private String mnt_content;
	private String mnt_file;
	private int device_seq;
	private String admin_id;
	private String mnt_date;
		
	public boardVO(String mnt_seq,String mnt_title,String mnt_content,String mnt_file,int device_seq, String admin_id)
	{
		this.mnt_seq = mnt_seq;
		this.mnt_title = mnt_title;
		this.mnt_content = mnt_content;
		this.device_seq = device_seq;
		this.admin_id = admin_id;
		this.mnt_file = mnt_file;
	}
	
	// 관리 일지 작성, view 생성자
	public boardVO(String mnt_title,String mnt_content,String mnt_file,int device_seq, String admin_id)
	{
		this.mnt_title = mnt_title;
		this.mnt_content = mnt_content;
		this.device_seq = device_seq;
		this.admin_id = admin_id;
		this.mnt_file = mnt_file;
	}
	
	// 관리 일지 수정 생성자
	public boardVO(String mnt_title,String mnt_content,String mnt_file,int device_seq) {
		this.mnt_title = mnt_title;
		this.mnt_content = mnt_content;
		this.device_seq = device_seq;
		this.mnt_file = mnt_file;
	}
	
	// 관리  리스트표시 생성자
	public boardVO(String mnt_seq, String mnt_title, String admin_id, String mnt_date) {
		this.mnt_seq = mnt_seq;
		this.mnt_title = mnt_title;
		this.admin_id = admin_id;
		this.mnt_date = mnt_date;
	}

	public String getMnt_seq() {
		return mnt_seq;
	}

	public void setMnt_seq(String mnt_seq) {
		this.mnt_seq = mnt_seq;
	}

	public String getMnt_title() {
		return mnt_title;
	}

	public void setMnt_title(String mnt_title) {
		this.mnt_title = mnt_title;
	}

	public String getMnt_content() {
		return mnt_content;
	}

	public void setMnt_content(String mnt_content) {
		this.mnt_content = mnt_content;
	}

	public String getMnt_file() {
		return mnt_file;
	}

	public void setMnt_file(String mnt_file) {
		this.mnt_file = mnt_file;
	}

	public int getDevice_seq() {
		return device_seq;
	}

	public void setDevice_seq(int device_seq) {
		this.device_seq = device_seq;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getMnt_date() {
		return mnt_date;
	}

	public void setMnt_date(String mnt_date) {
		this.mnt_date = mnt_date;
	}
	

	
	
	

}
