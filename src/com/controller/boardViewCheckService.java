package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/boardViewCheckService")
public class boardViewCheckService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		
		String mnt_seq = request.getParameter("mnt_seq");
		int mnt_seq_int = Integer.parseInt(mnt_seq);
				
		if(mnt_seq_int > 0 ) {
			System.out.println("관리 일지 view 페이지 이동 성공!");
			
			
			// 세션 값 설정
			session.setAttribute("mnt_seq_session", mnt_seq_int);
			
			response.sendRedirect("board_view.jsp");
		}else {
			System.out.println("관리 일지 view 페이지 이동 실패!");
		}	
	}

}
