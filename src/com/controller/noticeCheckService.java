package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.noticeDAO;
import com.model.noticeVO;

@WebServlet("/noticeCheckService")
public class noticeCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		noticeDAO dao = new noticeDAO();
		String notice_check = dao.selectOne();
		System.out.println(notice_check);
		
		if(notice_check.equals("1")) {
			response.setContentType("application/x-json; charset=EUC-KR");
	        PrintWriter out = response.getWriter();
	        out.print(notice_check);
	        
	        
	        System.out.println(notice_check);
	        
		}else {
			
		}
	}

}
