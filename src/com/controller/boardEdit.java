package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.boardDAO;
import com.model.fieldDAO;


@WebServlet("/boardEdit")
public class boardEdit extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("euc-kr");
		
		String mnt_title = request.getParameter("mnt_title");
		String mnt_content = request.getParameter("mnt_content");
		String mnt_file = request.getParameter("mnt_file");
		
		HttpSession session = request.getSession();
		int mnt_seq = (int)session.getAttribute("mnt_seq_session_again");
		
			
		boardDAO dao = new boardDAO();
		int cnt = dao.boardedit(mnt_title, mnt_content, mnt_file, mnt_seq);
		
		if(cnt>0) {
			System.out.println("관리 일지 수정 성공!");
			
		}else {
			System.out.println("관리 일지 수정 실패!");
			
		}
		PrintWriter out = response.getWriter();
		out.print(cnt);
	}

}
