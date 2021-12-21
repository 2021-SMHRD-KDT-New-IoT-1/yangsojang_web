package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.model.adminDAO;
import com.model.boardDAO;

@WebServlet("/boardWriteServlet")
public class boardWriteServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		//요청데이터 받아주기
		
		String mnt_title = request.getParameter("mnt_title");
		String device_seq = request.getParameter("device_seq");
		String mnt_content = request.getParameter("mnt_content");
		String mnt_file = request.getParameter("mnt_file");
		
		HttpSession session = request.getSession();
		String getadmin_id = (String)session.getAttribute("admin_id");
		
		String result = device_seq.substring(device_seq.lastIndexOf("/")+1);
		int result2 = Integer.parseInt(result);
		
		System.out.println(result + " / " + result2);

		boardDAO dao = new boardDAO();
		
		int cnt = dao.boardwrite(mnt_title, mnt_content, mnt_file, result2, getadmin_id);
		
		
		if(cnt>0) {
			System.out.println("게시판 등록 성공");
			response.sendRedirect("board_list.jsp");

			
			
		}else {
			System.out.println("게시판 등록 실패..");
			response.sendRedirect("board_write.jsp");
		}
	}

}
