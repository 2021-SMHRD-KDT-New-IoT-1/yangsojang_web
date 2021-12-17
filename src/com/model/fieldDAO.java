package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class fieldDAO {
	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	int cnt;
	private fieldVO vo;
	

	// 커넥션 함수 생성
	public void connection() {

		try {

			// 1. 드라이버 동적 로딩
			Class.forName("org.mariadb.jdbc.Driver");//드라이버에 접속할수 있게 해주는 라이브러리
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
	
	public int getNext() { //현장 번호 매기기 위한 함수
		String sql = "SELECT site_seq FROM site_loc ORDER BY site_seq";
		try {
			connection();
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1; //마지막 부여된 번호에  1을 더해서 번호를 부여한다.
			}
			return 1; //첫번째 게시물인 경우
			
		} catch (Exception e) {
			 e.printStackTrace();
		} finally {
			close();
		}
		return -1; //데이터베이스 오류가 난 경우 -1반환
	}
	
	 public int fieldAdd(String fieldName, String fieldAddr, String fieldMemo) {

	      //받아온 값을 db 테이블에 삽입
	      try {
	         connection();
	      
	         String sql = "INSERT INTO site_loc (site_seq, site_name, site_addr, site_memo) VALUES (site_seq.nextval,?,?,?)";
	         
	         psmt = conn.prepareStatement(sql);
	         
	         psmt.setInt(1, getNext());
	         psmt.setString(2, fieldName);
	         psmt.setString(3, fieldAddr);
	         psmt.setString(4, fieldMemo);

	         rs=psmt.executeQuery();   
	         return psmt.executeUpdate();
	      
	      } catch (Exception e) {
	         System.out.println("추가 실패!");
	         e.getStackTrace();//해당 예외가 출력된다.
	      }finally {
	         close();
	      }
	      return -1;
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
		      
		         String sql = "UPDATE  site_loc SET site_name=?, site_addr=?, site_memo=? WHERE site_name=?";
		         
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
