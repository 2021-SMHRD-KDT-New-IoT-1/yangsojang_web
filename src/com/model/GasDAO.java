package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GasDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	String sql = null;
	ArrayList<GasVO> gasall = null;
	GasVO vo = null;
	
	public void connection() {
	      try {
	    	  Class.forName("org.mariadb.jdbc.Driver");
	          String url = "jdbc:mariadb://211.48.228.15:3306/iot_db";
	          String user="smhrd";
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
	public int InsertSensor(Float Tolueno, Float NH4, Float Acetona, Float Co2, Float Co, 
			Float Formalin, Float Temp, Float Humidity, String mid) {
		  
		
		   try {
	         connection();
	      
	         sql = "insert into tbl_sensor(device_id, toluene_level, acetone_level, ammonia_level, co_level, co2_level,formalin_level,Temperature_level,humidity_level,device_seq) values(?,?,?,?,?,?,?,?,?,(select device_seq from tbl_device where device_id =?))";
	         
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, mid);
	         psmt.setFloat(2, Tolueno);
	         psmt.setFloat(3, Acetona);
	         psmt.setFloat(4, NH4);
	         psmt.setFloat(5, Co);
	         psmt.setFloat(6, Co2);
	         psmt.setFloat(7, Formalin);
	         psmt.setFloat(8, Temp);
	         psmt.setFloat(9, Humidity);
	         psmt.setString(10, mid);
          
	      
	         cnt = psmt.executeUpdate();
	      
	      } catch (Exception e) {
	    	 System.out.println(e);
	         System.out.println("센서 등록 실패..");
	         e.getStackTrace();
	      }finally {
	         close();
	      }
	      return cnt;
	   }   
	
	public ArrayList<GasVO> gasData() {
	      gasall = new ArrayList<GasVO>();

	      try {
	         connection();

	         String sql = "SELECT device_id, toluene_level, acetone_level, ammonia_level, "
	         		+ "co_level, co2_level, formalin_level, Temperature_level, humidity_level FROM tbl_sensor ORDER BY reg_date DESC LIMIT 1;";
	         psmt = conn.prepareStatement(sql);

	         rs = psmt.executeQuery();

	         while (rs.next()) {
	            System.out.println("회원정보 불러오기 성공!");

	            String admin_id = rs.getString("device_id");
	            String tolueno = rs.getString("toluene_level");
	            String NH4 = rs.getString("ammonia_level");
	            String acetona = rs.getString("acetone_level");
	            String co2 = rs.getString("co2_level");
	            String co = rs.getString("co_level");
	            String formalin = rs.getString("formalin_level");
	            String temp = rs.getString("Temperature_level");
	            String humidity = rs.getString("humidity_level");

	            vo = new GasVO(admin_id, tolueno, NH4, acetona, co2, co, formalin, temp, humidity);
	            gasall.add(vo);
	         }

	      } catch (Exception e) {
	         System.out.println("회원정보 불러오기 실패!");
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return gasall;

	   }
	   
	

}
