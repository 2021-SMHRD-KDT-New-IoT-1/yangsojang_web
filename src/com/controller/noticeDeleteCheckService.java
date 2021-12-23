package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.noticeDAO;

@WebServlet("/noticeDeleteCheckService")
public class noticeDeleteCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String check = request.getParameter("1");
		System.out.println(check);
		
		HttpSession session = request.getSession();
		int notice_seq = (int)session.getAttribute("notice_seq");
		
		if(check.equals("on")) {
			noticeDAO dao = new noticeDAO();
			dao.notice_check_0(notice_seq); 
			response.sendRedirect("notice.jsp");
		}
		
		
		
		
	}

}
