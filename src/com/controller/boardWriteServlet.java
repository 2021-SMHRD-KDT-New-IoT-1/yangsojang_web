package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.adminDAO;
import com.model.boardDAO;

@WebServlet("/boardWriteServlet")
public class boardWriteServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		//요청데이터 받아주기
		String mnt_seq = request.getParameter("mnt_seq");
		String mnt_title = request.getParameter("mnt_title");
		String mnt_content = request.getParameter("mnt_content");
		String mnt_file = request.getParameter("mnt_file");
		 
		
		boardDAO dao = new boardDAO();
		int cnt = dao.write(mnt_seq, mnt_title, mnt_content, mnt_file);
		
		
		if(cnt>0) {
			System.out.println("게시판 등록 성공");
			
			//forward 방식으로 페이지 이동
			RequestDispatcher rd = request.getRequestDispatcher("board_list.jsp");
			
			//request영역에 기억해야할 데이터 설정
			request.setAttribute("mnt_seq", mnt_seq);
			
			//페이지 이동할 시 request, response 객체 전달				
			rd.forward(request, response);
			
			//response.sendRedirect("join_success.jsp?email="+email);
			//쿼리스트링 방식으로 데이터 전송 > 받을 때는 getParameter()로 
			
		}else {
			System.out.println("가입 실패..");
			response.sendRedirect("notice.jsp");
		}
	}

}
