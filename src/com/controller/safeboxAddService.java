package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.safeboxDAO;
import com.model.sensorDAO;

@WebServlet("/safeboxAddService")
public class safeboxAddService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("euc-kr");
		
		String device_name = request.getParameter("device_name");
		String device_location = request.getParameter("device_location");
		
		HttpSession session = request.getSession();
		int field_seq = (int)session.getAttribute("field_seq_session_4");
		
		safeboxDAO dao = new safeboxDAO();
		int cnt = dao.safeboxAdd(device_name, device_location, field_seq);
		
		if(cnt>0) {
			System.out.println("기기 추가 성공!");
			response.sendRedirect("safeboxEdit.jsp");
		}else {
			System.out.println("기기 추가 실패!");
			response.sendRedirect("safeboxadd.jsp");
		}
		
		
	}

}
