package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.adminDAO;
import com.model.safeboxDAO;


@WebServlet("/adminDeleteServlet")
public class adminDeleteServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String admin_id = request.getParameter("admin_id");
		String admin_pwd = request.getParameter("admin_pwd");
		
		adminDAO dao = new adminDAO();
		int cnt = dao.adminDelete(admin_id, admin_pwd);
		
		if(cnt>0) {
			System.out.println("관리자 삭제 성공!");
			
		}else {
			System.out.println("관리자 삭제 실패!");
			
		}
		
		PrintWriter out = response.getWriter();
		out.print(cnt);
		
		
		
	}

}
