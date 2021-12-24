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

@WebServlet("/fieldUpdateCheckService")
public class fieldUpdateCheckService extends HttpServlet {
		
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String field_seq = request.getParameter("field_seq");
		int field_seq_int = Integer.parseInt(field_seq);
				
		if(field_seq_int > 0 ) {
			System.out.println("현장 수정 페이지 이동 성공!");
			
			HttpSession session = request.getSession();
			// 세션 값 설정
			session.setAttribute("field_seq_session", field_seq_int);
			
			response.sendRedirect("fieldUpdate.jsp");
		}else {
			System.out.println("현장 수정 페이지 이동 실패!");
		}
		
		
	}

}
