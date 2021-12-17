package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.safeboxDAO;

@WebServlet("/sensorAddCheckService")
public class sensorAddCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String device_seq = request.getParameter("device_seq");
		int device_seq_int = Integer.parseInt(device_seq);
		
		if(device_seq_int>0) {
			System.out.println("센서 추가 페이지 이동 성공!");
			
			HttpSession session = request.getSession();
			// 세션 값 설정
			session.setAttribute("device_seq_int_session", device_seq_int);
			
			response.sendRedirect("sensorAdd.jsp");
			
		}else {
			System.out.println("센서 추가 페이지 이동 실패!");
		}
		
	}

}
