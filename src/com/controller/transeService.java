package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.noticeDAO;

@WebServlet("/transeService")
public class transeService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String data = request.getParameter("data");
		System.out.println(data);
		noticeDAO noticedao = new noticeDAO();
		String notice_check = noticedao.selectOne();
		
		
		/*
		 * if(notice_check.equals("1")) { notice_check = dao.Alert_cnt_1(); PrintWriter
		 * out = response.getWriter(); out.print(alert_cnt);
		 * 
		 * 
		 * System.out.println(alert_cnt);
		 * 
		 * } PrintWriter out = response.getWriter(); out.print(alert_cnt);
		 */
		
		
	}

}
