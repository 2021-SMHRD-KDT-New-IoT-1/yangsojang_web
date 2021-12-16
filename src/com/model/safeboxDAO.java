package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class safeboxDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;

	public void connection() {
	      try {
	    	  
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
	
	   //기기 추가
	   public int join(String admin_id, String admin_pw, String admin_name, String admin_tel, String admin_email, String admin_job, String loc_no) {

	      //받아온 값을 db 테이블에 삽입
	      try {
	         connection();
	      
	         String sql = "insert into ADMIN_MEMBER (admin_no, admin_id, admin_pw, admin_name, admin_tel, admin_email, admin_job, loc_no) values (admin_seq.nextval,?,?,?,?,?,?,?)";
	         
	         psmt = conn.prepareStatement(sql);
//	         psmt.setString(1, );
//	         psmt.setString(2, );
//	         psmt.setString(3, );
//	         psmt.setString(4, );
//	         psmt.setString(5, );
//	         psmt.setString(6, );
//	         psmt.setString(7, );
	            
	         cnt = psmt.executeUpdate();
	      
	      } catch (Exception e) {
	         System.out.println("가입 실패!");
	         e.getStackTrace();
	      }finally {
	         close();
	      }
	      return cnt;
	   }
	   
	   
}
