package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.fieldDAO;
import com.model.sensorDAO;

@WebServlet("/fieldDeleteService")
public class fieldDeleteService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String field_seq = request.getParameter("field_seq");
		int field_seq_int = Integer.parseInt(field_seq);
		
		fieldDAO dao = new fieldDAO();
		int cnt = dao.fieldDelete(field_seq_int);
		
		if(cnt>0) {
			System.out.println("현장 삭제 성공!");
			response.sendRedirect("fieldlist.jsp");
		}else {
			System.out.println("현장 삭제 실패!");
			response.sendRedirect("fieldUpdate.jsp");
		}
		
		
	}

}
