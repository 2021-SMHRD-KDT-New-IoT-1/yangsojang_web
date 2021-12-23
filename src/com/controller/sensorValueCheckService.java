package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.fieldDAO;
import com.model.fieldVO;

@WebServlet("/sensorValueCheckService")
public class sensorValueCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		fieldDAO fielddao = new fieldDAO();
		
		String field_seq = request.getParameter("field_seq");
		int field_seq_int = Integer.parseInt(field_seq);
		System.out.println(field_seq_int);
		
		fieldVO fieldvo = fielddao.fieldName_Addr(field_seq_int);
		
		if(field_seq_int > 0 ) {
			System.out.println("센서 value 페이지 확인 성공!!");
			HttpSession session = request.getSession();
			// 세션 값 설정
			session.setAttribute("fieldvo_session", fieldvo);
			session.setAttribute("field_seq_session_", field_seq_int);
			response.sendRedirect("sensorValue.jsp");
		}else {
			System.out.println("센서 value 페이지 확인 실패!!");
		}
		
	
	}

}
