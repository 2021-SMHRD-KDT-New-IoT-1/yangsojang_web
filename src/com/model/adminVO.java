package com.model;

public class adminVO {
	
	private String admin_id;
	private String admin_pwd;
	private String admin_name;
	private String admin_phone;
	private String admin_email;
	private String admin_dept;
	private String admin_joindate;
	
	public adminVO(String admin_id, String admin_pwd,String admin_name,String admin_phone,String admin_email,String admin_dept) {
		super();
		this.admin_id = admin_id;
		this.admin_pwd = admin_pwd;
		this.admin_name = admin_name;
		this.admin_phone = admin_phone;
		this.admin_email = admin_email;
		this.admin_dept = admin_dept;
		
	}
	// 로그인 시 나타낼 정보 생성자
	public adminVO(String admin_email, String admin_phone,String admin_dept) {
		super();
		this.admin_email = admin_email;
		this.admin_phone = admin_phone;
		this.admin_dept = admin_dept;
	}
	
	//업데이트 생성자
	public adminVO(String admin_pwd,String admin_name,String admin_phone,String admin_email,String admin_dept) {
		super();
		this.admin_pwd = admin_pwd;
		this.admin_name = admin_name;
		this.admin_phone = admin_phone;
		this.admin_email = admin_email;
		this.admin_dept = admin_dept;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public String getAdmin_dept() {
		return admin_dept;
	}
	public void setAdmin_dept(String admin_dept) {
		this.admin_dept = admin_dept;
	}
	public String getAdmin_joindate() {
		return admin_joindate;
	}
	public void setAdmin_joindate(String admin_joindate) {
		this.admin_joindate = admin_joindate;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
