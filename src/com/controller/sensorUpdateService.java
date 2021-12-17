package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.sensorDAO;

@WebServlet("/sensorUpdateService")
public class sensorUpdateService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String sensor_name_update = request.getParameter("sensor_name_update");
		String sensor_id_update = request.getParameter("sensor_id_update");
		
		HttpSession session = request.getSession();
		int sensor_seq_int_session = (int)session.getAttribute("sensor_seq_int_session");
		
		sensorDAO dao = new sensorDAO();
		int cnt = dao.sensorUpdate(sensor_name_update, sensor_id_update, sensor_seq_int_session);
		
		if(cnt>0) {
			System.out.println("센서 수정 성공!");
			response.sendRedirect("sensorList.jsp");
		}else {
			System.out.println("센서 수정 실패!");
			response.sendRedirect("sensorUpdate.jsp");
		}
		
	}

}
