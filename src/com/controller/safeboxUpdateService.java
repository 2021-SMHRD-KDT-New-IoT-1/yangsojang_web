package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.safeboxDAO;
import com.model.sensorDAO;


@WebServlet("/safeboxUpdateService")
public class safeboxUpdateService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String device_id = request.getParameter("device_id");
		String device_location = request.getParameter("device_location");
		
		HttpSession session = request.getSession();
		int safebox_seq_int_session = (int)session.getAttribute("safebox_seq_int_session_2");
	
		
		safeboxDAO dao = new safeboxDAO();
		int cnt = dao.safeboxUpdate(device_id, device_location, safebox_seq_int_session);
		
		if(cnt>0) {
			System.out.println("기기 정보 수정 성공!");
			
		}else {
			System.out.println("기기 정보 수정 실패!");
			
		}
		
		PrintWriter out = response.getWriter();
		out.print(cnt);
		
		
	}

}
