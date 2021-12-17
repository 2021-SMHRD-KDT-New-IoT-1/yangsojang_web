package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.sensorDAO;

@WebServlet("/sensorUpdateService")
public class sensorUpdateService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String sensor_id = request.getParameter("sensor_id");
		String sensor_name_update = request.getParameter("sensor_name_update");
		String sensor_id_update = request.getParameter("sensor_id_update");
		String device_seq_update = request.getParameter("device_seq_update");
	
		String sensor_id_string = sensor_id.substring(sensor_id.lastIndexOf("/")+1);
		String device_seq_string = device_seq_update.substring(device_seq_update.lastIndexOf("/")+1);
		
		sensorDAO dao = new sensorDAO();
		int cnt = dao.sensorUpdate(sensor_id_string, sensor_name_update, sensor_id_update, device_seq_string);
		
		if(cnt>0) {
			System.out.println("센서 수정 성공!");
			response.sendRedirect("sensorList.jsp");
		}else {
			System.out.println("센서 수정 실패!");
			response.sendRedirect("sensorUpdate.jsp");
		}
		
	}

}
