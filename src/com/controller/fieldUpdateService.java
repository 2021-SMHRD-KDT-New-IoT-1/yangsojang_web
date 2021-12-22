package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.fieldDAO;
import com.model.fieldVO;
import com.model.sensorDAO;

@WebServlet("/fieldUpdateService")
public class fieldUpdateService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String field_name = request.getParameter("field_name");
		String field_addr = request.getParameter("field_addr");
		String field_memo = request.getParameter("field_memo");
		
		HttpSession session = request.getSession();
		int field_seq = (int)session.getAttribute("field_seq_session_again");
		
		String field_name_result;
		String field_addr_result;
		String field_memo_result;
		
		if(field_name=="" || field_name == null) {
			
		}else {
			field_name_result = field_name;
		}
		
		if(field_addr=="" || field_addr == null) {
					
		}else {
			field_addr_result = field_addr;
		}
		
		if(field_memo=="" || field_memo == null) {
			
		}else {
			field_memo_result = field_memo;
		}
		
			
		fieldDAO dao = new fieldDAO();
		int cnt = dao.fieldUpdate(field_name, field_addr, field_memo, field_seq);
		
		if(cnt>0) {
			System.out.println("현장 정보 수정 성공!");
			
		}else {
			System.out.println("현장 정보 수정 실패!");
			
		}
		PrintWriter out = response.getWriter();
		out.print(cnt);
		
		
	}

}
