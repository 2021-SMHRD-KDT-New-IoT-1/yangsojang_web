package com.model;

public class boardVO {
	
	private String mnt_seq;
	private String mnt_title;
	private String mnt_content;
	private String mnt_file;
	
	
	
	public boardVO(String mnt_seq, String mnt_title, String mnt_content, String mnt_file) {
		super();
		this.mnt_seq = mnt_seq;
		this.mnt_title = mnt_title;
		this.mnt_content = mnt_content;
		this.mnt_file = mnt_file;
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


}
