package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class fieldDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt;
	fieldVO vo;
	

	// 커넥션 함수 생성
	public void connection() {

		try {

			// 1. 드라이버 동적 로딩
			
			String url = "jdbc:mariadb://211.48.228.15:3306/iot_db";
			String user = "smhrd";
			String password = "smhrd1234";
			// 2. 데이터 베이스 연결 객채(Connection) 생성
			
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패");
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
	
	//현장 추가
	 public fieldVO fieldAdd(String fieldName, String fieldAddr, String fieldmemo) {

	      //받아온 값을 db 테이블에 삽입
	      try {
	         connection();
	      
	         String sql = "insert into site_loc (site_name, site_addr, site_memo) values (site_seq.nextval,?,?,?)";
	         
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, fieldName);
	         psmt.setString(2, fieldAddr);
	         psmt.setString(3, fieldmemo);

	            
	         cnt = psmt.executeUpdate();
	      
	      } catch (Exception e) {
	         System.out.println("가입 실패!");
	         e.getStackTrace();
	      }finally {
	         close();
	      }
	      return vo;
	   }
	 
	//현장 삭제
		 public fieldVO fieldDelete(String fieldName, String fieldAddr, String fieldmemo) {

		      
		      try {
		         connection();
		      
		         String sql = "delete from site_loc where fieldName =?";
		         
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, fieldName);
		        
		         cnt = psmt.executeUpdate();
		      
		      } catch (Exception e) {
		         System.out.println("삭제 실패!");
		         e.getStackTrace();
		      }finally {
		         close();
		      }
		      return vo;
		   }
		 
		 
		 //현장 수정
		 public fieldVO fieldUpdate(String fieldName, String fieldAddr, String fieldmemo) {

		      //받아온 값을 db 테이블에 삽입
		      try {
		         connection();
		      
		         String sql = "insert into site_loc (site_name, site_addr, site_memo) values (site_seq.nextval,?,?,?)";
		         
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, fieldName);
		         psmt.setString(2, fieldAddr);
		         psmt.setString(3, fieldmemo);

		            
		         cnt = psmt.executeUpdate();
		      
		      } catch (Exception e) {
		         System.out.println("수정 실패!");
		         e.getStackTrace();
		      }finally {
		         close();
		      }
		      return vo;
		   }
	   

}
