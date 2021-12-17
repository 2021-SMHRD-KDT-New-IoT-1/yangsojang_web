package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/safeboxsensorCheckService")
public class safeboxsensorCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String safebox_seq = request.getParameter("safebox_seq");
		int safebox_seq_int = Integer.parseInt(safebox_seq);
		
		if(safebox_seq_int>0) {
			System.out.println("기기-센서 목록 페이지 이동 성공!");
			
			HttpSession session = request.getSession();
			// 세션 값 설정
			session.setAttribute("safebox_seq_int_session", safebox_seq_int);
			
			response.sendRedirect("sensorList.jsp");
			
		}else {
			System.out.println("기기-센서 목록 페이지 이동 실패!");
		}
		
		
		
	}

}
