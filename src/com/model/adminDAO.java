package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class adminDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	adminVO vo = null;
	ArrayList<adminVO> adminall = null;
	

	public void connection() {
	      try {
	    	  Class.forName("org.mariadb.jdbc.Driver");
	          String url = "jdbc:mariadb://211.48.228.15:3306/iot_db";
	          String user="smhrd";;
	          String password="smhrd1234";
	          conn = DriverManager.getConnection(url, user, password);
	      } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("연결 실패");
	      }
	      
	   }
	   
	   public void close() {
	      try {
	         if(rs!=null) {
	            rs.close();
	         }
	         if(psmt!=null) {
	            psmt.close();
	         }
	         if(conn!=null) {
	            conn.close();
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	 //회원가입 메소드
	   public int join(String admin_id, String admin_pwd,String admin_name,String admin_phone,String admin_email,String admin_dept) {

	      try {
	         connection();
	      
	         String sql = "insert into tbl_admin (admin_id, admin_pwd, admin_name, admin_phone, admin_email, admin_dept) values (?,?,?,?,?,?)";
	         
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, admin_id);
	         psmt.setString(2, admin_pwd);
	         psmt.setString(3, admin_name);
	         psmt.setString(4, admin_phone);
	         psmt.setString(5, admin_email);
	         psmt.setString(6, admin_dept);
	            
	         cnt = psmt.executeUpdate();
	      
	      } catch (Exception e) {
	         System.out.println("가입 실패!");
	         e.getStackTrace();
	      }finally {
	         close();
	      }
	      return cnt;
	   }
	   //로그인 메소드
	   public adminVO login(String admin_id, String admin_pwd) {
		      try {
		         connection();
		         
		         String sql = "select admin_id, admin_pwd, admin_name, admin_phone, admin_email, admin_dept from tbl_admin where admin_id=? and admin_pwd=?";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, admin_id);   
		         psmt.setString(2, admin_pwd);      
		         
		         rs = psmt.executeQuery();
		         
		         if(rs.next()) {
		            System.out.println("로그인 성공!");
		            String get_admin_id = rs.getString("admin_id");
		            String get_admin_pwd = rs.getString("admin_pwd");
		            String admin_name = rs.getString("admin_name");
		            String admin_phone = rs.getString("admin_phone");
		            String admin_email = rs.getString("admin_email");
		            String admin_dept= rs.getString("admin_dept");
		            
		            
		            
		            vo = new adminVO(admin_id, admin_pwd, admin_name, admin_phone, admin_email,admin_dept);
		                  
		         }else {
		            System.out.println("로그인 실패..");
		         }
		         
		      } catch (Exception e) {
		         System.out.println("로그인 실패!");
		         e.printStackTrace();
		      }finally {
		         close();
		      }
		      return vo;
		   }
	   
	 //수정 메소드
	   public int update(String admin_pwd,String admin_name,String admin_phone,String admin_email,String admin_dept, String admin_id) {
	      try {
	         connection();
	         
	         String sql = "update tbl_admin set admin_pwd = ?, admin_name=?, admin_phone=?, admin_email=?, admin_dept=? where admin_id=?";
	         psmt = conn.prepareStatement(sql);
	         
	         psmt.setString(1, admin_pwd); 
	         psmt.setString(2, admin_name);   
	         psmt.setString(3, admin_phone);
	         psmt.setString(4, admin_email);
	         psmt.setString(5, admin_dept);
	         psmt.setNString(6, admin_id);
	        
	         cnt = psmt.executeUpdate();
	         
	      } catch (Exception e) {
	         System.out.println("수정 실패!");
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      return cnt;
	   }
	 //main 항목 추가하기 
	  // 로그인 후 이메일,전화번호,소속 가져오기
	   public ArrayList<adminVO> allMember() {
	      adminall = new ArrayList<adminVO>();      
	      
	      try {
	         connection();
	         
	         String sql = "select admin_email, admin_phone, admin_dept from tbl_admin";
	         psmt = conn.prepareStatement(sql);
	                  
	         rs = psmt.executeQuery();
	         
	         while(rs.next()) {
	            System.out.println("회원정보 불러오기 성공!");
	            
	            String get_email = rs.getString("admin_email");
	            String get_phone = rs.getString("admin_phone");
	            String get_dept = rs.getString("admin_dept");
	            
	            vo = new adminVO(get_email,get_phone, get_dept);
	            adminall.add(vo);
	         }   
	         
	      } catch (Exception e) {
	         System.out.println("회원정보 불러오기 실패!");
	         e.printStackTrace();
	      }finally {
	         close();
	         }
	      return adminall;
	      }
	   
	 //id 중복체크 메소드
	   public boolean idCheck(String admin_id) {
	      boolean idcheck = false;
	      
	      try {
	         connection();
	         
	         String sql = "select admin_id from tbl_admin where admin_id=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setNString(1, admin_id);      
	         
	         rs = psmt.executeQuery();
	         
	         if(rs.next()) {
	            //입력한 이메일 사용 불가
	            System.out.println("아이디 중복");
	            idcheck = true;
	            
	         }else {
	            //입력한 이메일 사용 가능
	            System.out.println("아이디 중복 x");
	            idcheck = false;
	         }
	         
	      } catch (Exception e) {
	         System.out.println("아이디 중복 x");
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      return idcheck;
	   }
}
