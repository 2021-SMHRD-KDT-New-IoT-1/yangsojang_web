package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class sensorDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	ArrayList<sensorVO> sensor_array = null;
	sensorVO vo1_sensor = null;
	ArrayList<sensorVO> sensor_array_all = null;
	sensorVO vo2_sensor = null;

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
	   
	//센서 추가
	public int sensorAdd(String sensor_name, String sensor_id, int device_seq) {
		   
		   try {
	         connection();
	      
	         String sql = "insert into tbl_sensor(sensor_name, sensor_id, device_seq) values(?,?,?)";
	         
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, sensor_name);
	         psmt.setString(2, sensor_id);
	         psmt.setInt(3, device_seq);

	         cnt = psmt.executeUpdate();
	      
	      } catch (Exception e) {
	         System.out.println("센서 등록 실패..");
	         e.getStackTrace();
	      }finally {
	         close();
	      }
	      return cnt;
	   }   
	     
	//센서 수정 페이지 센서 리스트 불러오기
	public ArrayList<sensorVO> sensorList() {
		sensor_array = new ArrayList<sensorVO>();      
	      
	      try {
	         connection();
	         
	         String sql = "select sensor_name, sensor_id from tbl_sensor";
	         psmt = conn.prepareStatement(sql);
	                  
	         rs = psmt.executeQuery();
	         
	         while(rs.next()) {
	            System.out.println("센서 리스트 불러오기 성공..");
	            
	            String get_sensor_name = rs.getString("sensor_name");
	            String get_sensor_id = rs.getString("sensor_id");
	            
	            vo1_sensor = new sensorVO(get_sensor_name, get_sensor_id);
	            sensor_array.add(vo1_sensor);
	         }   
	         
	      } catch (Exception e) {
	         System.out.println("센서 리스트 불러오기 실패..");
	         e.printStackTrace();
	      }finally {
	         close();
	         }
	      return sensor_array;
	      
	   }   
	
	//센서 목록 페이지 센서 리스트 불러오기
		public ArrayList<sensorVO> sensorAllList() {
			sensor_array_all = new ArrayList<sensorVO>();      
		      
		      try {
		         connection();
		         
		         String sql = "select sensor_seq, sensor_name, sensor_id, reg_date, device_seq from tbl_sensor";
		         psmt = conn.prepareStatement(sql);
		                  
		         rs = psmt.executeQuery();
		         
		         while(rs.next()) {
		            System.out.println("센서 리스트 불러오기 성공..");
		            
		            int get_sensor_seq = rs.getInt("sensor_seq");
		            String get_sensor_name = rs.getString("sensor_name");
		            String get_sensor_id = rs.getString("sensor_id");
		            String get_reg_date = rs.getString("reg_date");
		            int get_device_seq = rs.getInt("device_seq");		            
		            
		            vo2_sensor = new sensorVO(get_sensor_seq, get_sensor_name, get_sensor_id, get_reg_date, get_device_seq);
		            sensor_array_all.add(vo2_sensor);
		         }   
		         
		      } catch (Exception e) {
		         System.out.println("센서 전체 리스트 불러오기 실패..");
		         e.printStackTrace();
		      }finally {
		         close();
		         }
		      return sensor_array_all;
		      
		   }   
	
	//센서 정보 수정 
	public int sensorUpdate(String sensor_id_string, String sensor_name_update, String sensor_id_update, String device_seq_string) {
	      try {
	         connection();
	         
	         String sql = "update tbl_sensor set sensor_name = ?, sensor_id=?, device_seq=? where sensor_id=?";
	         psmt = conn.prepareStatement(sql);
	            
	         psmt.setString(1, sensor_name_update);      
	         psmt.setString(2, sensor_id_update);   
	         psmt.setString(3, device_seq_string);
	         psmt.setString(4, sensor_id_string);
	                  
	         cnt = psmt.executeUpdate();
	         
	      } catch (Exception e) {
	         System.out.println("센서 정보 수정 실패..");
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      return cnt;
	   }
	
	//센서 정보 삭제
	public int sensorDelete(int sensor_seq) {
	      try {
	         connection();

	         String sql = "delete from tbl_sensor where sensor_seq=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, sensor_seq);   
	         
	         cnt = psmt.executeUpdate();
	         
	      } catch (Exception e) {
	         System.out.println("센서 정보 삭제 실패..");
	         e.printStackTrace();
	      }finally {
	         close();
	         }
	      return cnt;
	   }
	
	
}
