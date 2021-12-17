package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.safeboxDAO;
import com.model.sensorDAO;

@WebServlet("/safeboxDeleteService")
public class safeboxDeleteService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String safebox_seq = request.getParameter("safebox_seq");
		int safebox_seq_int = Integer.parseInt(safebox_seq);
		
		safeboxDAO dao = new safeboxDAO();
		int cnt = dao.safeboxDelete(safebox_seq_int);
		
		if(cnt>0) {
			System.out.println("기기 삭제 성공!");
			response.sendRedirect("safeboxEdit.jsp");
		}else {
			System.out.println("기기 삭제 실패!");
			response.sendRedirect("safeboxEdit.jsp");
		}
		
		
	}

}
