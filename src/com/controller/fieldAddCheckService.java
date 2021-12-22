package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.fieldDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/fieldAddCheckService")
public class fieldAddCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String field_name = request.getParameter("field_name");
		String field_addr = request.getParameter("field_addr");
		String field_memo = request.getParameter("field_memo");
		String field_file = request.getParameter("field_file"); 
		
		fieldDAO dao = new fieldDAO();
		int cnt = dao.fieldAdd(field_name, field_addr, field_memo, field_file);
		
		if(cnt>0) {
			System.out.println("현장 추가 성공!");			
			
		}else {
			System.out.println("현장 추가 실패!");
		}
		
		PrintWriter out = response.getWriter();
		out.print(cnt);
	
			
			
		
		
	}

}
