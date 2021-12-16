package com.model;

public class adminVO {
	
	private String admin_id;
	private String admin_pwd;
	private String admin_name;
	private String admin_phone;
	private String admin_email;
	private String admin_dept;
	private String admin_joindate;
	
	public adminVO(String admin_id, String admin_pwd,String admin_name,String admin_phone,String admin_email,String admin_dept,String admin_joindate) {
		super();
		this.admin_id = admin_id;
		this.admin_pwd = admin_pwd;
		this.admin_name = admin_name;
		this.admin_phone = admin_phone;
		this.admin_email = admin_email;
		this.admin_dept = admin_dept;
		this.admin_joindate = admin_joindate;
	}
	     
	
}
