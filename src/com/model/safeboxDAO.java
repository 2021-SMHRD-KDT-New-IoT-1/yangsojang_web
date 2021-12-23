package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import java.sql.DriverManager;

public class safeboxDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	ArrayList<safeboxVO> safebox_array = null;
	safeboxVO vo1_safebox = null;
	ArrayList<safeboxVO> safebox_array_all = null;
	safeboxVO vo2_safebox = null;
	safeboxVO vo3_safebox = null;
	
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
	
	   //기기 추가
	   public int safeboxAdd(String device_name, String device_location, int field_seq) {
	      
	      try {
	         connection();
	      
	         String sql = "insert into tbl_device (device_id, device_location, site_seq) values (?,?,?)";
	         
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, device_name);
	         psmt.setString(2, device_location);
	         psmt.setInt(3, field_seq);

	            
	         cnt = psmt.executeUpdate();
	      
	      } catch (Exception e) {
	         System.out.println("기기 추가 실패..");
	         e.getStackTrace();
	      }finally {
	         close();
	      }
	      return cnt;
	   }
	   
	   //기기 부분 리스트 확인
	   public ArrayList<safeboxVO> safeboxList() {
		   safebox_array = new ArrayList<safeboxVO>();      
	      
	      try {
	         connection();
	         
	         String sql = "select device_seq, device_id from tbl_device";
	         psmt = conn.prepareStatement(sql);
	                  
	         rs = psmt.executeQuery();
	         
	         while(rs.next()) {
	            System.out.println("기기 리스트 불러오기 성공..");
	            
	            int get_device_seq = rs.getInt("device_seq");
	            String get_device_id = rs.getString("device_id");
	            
	            vo1_safebox = new safeboxVO(get_device_seq, get_device_id);
	            safebox_array.add(vo1_safebox);
	         }   
	         
	      } catch (Exception e) {
	         System.out.println("기기 리스트 불러오기 실패..");
	         e.printStackTrace();
	      }finally {
	         close();
	         }
	      return safebox_array;
	      
	   }
	   
	   //기기 전체 리스트 확인
	   public ArrayList<safeboxVO> safeboxAllList(int field_seq) {
		   safebox_array_all = new ArrayList<safeboxVO>();      
	      
	      try {
	         connection();
	         
	         String sql = "select device_seq, device_id, device_location, reg_date from tbl_device where site_seq=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, field_seq);
	                  
	         rs = psmt.executeQuery();
	         
	         while(rs.next()) {
	            System.out.println("기기 리스트 불러오기 성공..");
	            
	            int get_device_seq = rs.getInt("device_seq");
	            String get_device_id = rs.getString("device_id");
	            String get_device_location = rs.getString("device_location");
	            String get_reg_date = rs.getString("reg_date");
	            
	            vo2_safebox = new safeboxVO(get_device_seq, get_device_id, get_device_location, get_reg_date);
	            safebox_array_all.add(vo2_safebox);
	         }   
	         
	      } catch (Exception e) {
	         System.out.println("기기 전체 리스트 불러오기 실패..");
	         e.printStackTrace();
	      }finally {
	         close();
	         }
	      return safebox_array_all;
	      
	   }
	   
	 //기기 정보 수정 
		public int safeboxUpdate(String device_id, String device_location, int device_seq) {
		      try {
		         connection();
		         
		         String sql = "update tbl_device set device_id = ?, device_location=? where device_seq=?";
		         psmt = conn.prepareStatement(sql);
		            
		         psmt.setString(1, device_id);      
		         psmt.setString(2, device_location);   
		         psmt.setInt(3, device_seq);
		         
		         cnt = psmt.executeUpdate();
		         
		      } catch (Exception e) {
		         System.out.println("기기 정보 수정 실패..");
		         e.printStackTrace();
		      }finally {
		         close();
		      }
		      return cnt;
		   }
		
		//센서 정보 삭제
		public int safeboxDelete(int safebox_seq_int) {
		      try {
		         connection();

		         String sql = "delete from tbl_device where device_seq=?";
		         psmt = conn.prepareStatement(sql);
		         psmt.setInt(1, safebox_seq_int);   
		         
		         cnt = psmt.executeUpdate();
		         
		      } catch (Exception e) {
		         System.out.println("기기 정보 삭제 실패..");
		         e.printStackTrace();
		      }finally {
		         close();
		         }
		      return cnt;
		   }
	   
		public safeboxVO safeboxSelect(int device_seq) {
		       
            try {
               connection();
               
               String sql = "select device_id, device_location from tbl_device where device_seq=?";
               psmt = conn.prepareStatement(sql);
                        
               psmt.setInt(1, device_seq);  
               
               rs = psmt.executeQuery();
               
               while(rs.next()) {
                  System.out.println("safeboxSelect 불러오기 성공..");
                  
                  String get_device_id = rs.getString("device_id");
                  String get_device_location = rs.getString("device_location");
                  
                  
                  vo3_safebox = new safeboxVO(get_device_id, get_device_location);
               }   
               
            } catch (Exception e) {
               System.out.println("safeboxSelect 불러오기 실패..");
               e.printStackTrace();
            }finally {
               close();
               }
            return vo3_safebox;
            
         }   
		
		public int field_seq(int device_seq) {
	          int site_seq = 0;
	          try {
	             connection();
	             
	             String sql = "select site_seq from tbl_device where device_seq=?";
	             psmt = conn.prepareStatement(sql);
	                      
	             psmt.setInt(1, device_seq);  
	             
	             rs = psmt.executeQuery();
	             
	             while(rs.next()) {
	                System.out.println("현장seq  불러오기 성공..");
	                
	                site_seq = rs.getInt("site_seq");
	             }   
	             
	          } catch (Exception e) {
	             System.out.println("현장seq  불러오기 실패..");
	             e.printStackTrace();
	          }finally {
	             close();
	             }
	          return site_seq;
	          
	       }  
		
}
