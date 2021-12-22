package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.noticeDAO;

@WebServlet("/noticeDeleteCheckService")
public class noticeDeleteCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String check = request.getParameter("check");
		System.out.println(check);
		
		if(check.equals("on")) {
			noticeDAO dao = new noticeDAO();
			/* dao.notice_check_0(); */
		}
		
		
		
		
	}

}
