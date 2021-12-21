package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class boardDAO {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int cnt = 0;
		boardVO vo = null;
		ArrayList<boardVO> boardall = null;
		

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
		   //게시판 작성
		   public int write(String mnt_seq, String mnt_title, String mnt_content,String mnt_file) {
			   try {
			         connection();
			         
			   String sql = "insert into tbl_device_mnt (mnt_seq, mnt_title, mnt_content, mnt_file) values (?,?,?,?)";
		         psmt = conn.prepareStatement(sql);
		 
		         psmt.setString(1, mnt_seq); 
		         psmt.setString(2, mnt_title); 
		         psmt.setString(3, mnt_content);
		         psmt.setString(4, mnt_file);
		         
		         cnt = psmt.executeUpdate();
		         
		      } catch (Exception e) {
		         System.out.println("수정 실패!");
		         e.printStackTrace();
		      }finally {
		         close();
		      }
		      return cnt;
		   }   
 }
