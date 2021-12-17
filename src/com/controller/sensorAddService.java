package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;

import com.model.sensorDAO;

@WebServlet("/sensorAddService")
public class sensorAddService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String sensor_name = request.getParameter("sensor_name");
		String sensor_id = request.getParameter("sensor_id");
								
		HttpSession session = request.getSession();
		int device_seq_int_session = (int)session.getAttribute("device_seq_int_session_2");
		
		sensorDAO dao = new sensorDAO();
		int cnt = dao.sensorAdd(sensor_name, sensor_id, device_seq_int_session);
		
		if(cnt>0) {
			System.out.println("센서 추가 성공!");
			response.sendRedirect("sensorList.jsp");
		}else {
			System.out.println("센서 추가 실패!");
			response.sendRedirect("sensorAdd.jsp");
		}
		
	}

}
