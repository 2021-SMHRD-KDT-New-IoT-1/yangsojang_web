package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.noticeDAO;


@WebServlet("/gasgasCheck")
public class gasgasCheck extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		noticeDAO dao = new noticeDAO();
		int notice_check = dao.gasOne();	
		System.out.println(notice_check);
		
		if(notice_check==1) {
			response.setContentType("application/x-json; charset=EUC-KR");
	        PrintWriter out = response.getWriter();
	        out.print(notice_check);
	        
	        
	        System.out.println(notice_check);
	        
		}else {
			
		}
	}

}
