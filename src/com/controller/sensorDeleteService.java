package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.sensorDAO;

@WebServlet("/sensorDeleteService")
public class sensorDeleteService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sensor_seq = request.getParameter("sensor_seq");
		int sensor_seq_int = Integer.parseInt(sensor_seq);
		
		sensorDAO dao = new sensorDAO();
		int cnt = dao.sensorDelete(sensor_seq_int);
		
		if(cnt>0) {
			System.out.println("센서 삭제 성공!");
			response.sendRedirect("sensorList.jsp");
		}else {
			System.out.println("센서 삭제 실패!");
			response.sendRedirect("sensorList.jsp");
		}
		
	}

}
