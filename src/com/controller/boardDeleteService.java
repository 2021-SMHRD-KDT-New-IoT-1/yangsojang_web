package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.boardDAO;
import com.model.fieldDAO;


@WebServlet("/boardDeleteService")
public class boardDeleteService extends HttpServlet {
		
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mnt_seq = request.getParameter("mnt_seq");
		int mnt_seq_int = Integer.parseInt(mnt_seq);
		
		boardDAO dao = new boardDAO();
		int cnt = dao.boardDelete(mnt_seq_int);
		
		if(cnt>0) {
			System.out.println("관리 일지 삭제 성공!");
			response.sendRedirect("board_list.jsp");
		}else {
			System.out.println("관리 일지 삭제 실패!");
			response.sendRedirect("board_edit.jsp");
		}
	}

}
