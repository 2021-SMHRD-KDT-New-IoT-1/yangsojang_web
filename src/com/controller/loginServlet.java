package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.adminDAO;
import com.model.adminVO;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");

		String admin_id = request.getParameter("admin_id");
		String admin_pwd = request.getParameter("admin_pwd");
		

		adminDAO dao = new adminDAO();
		adminVO vo = dao.login(admin_id, admin_pwd);
		

		if (vo != null) {
			
			// 세션 객체 생성
			HttpSession session = request.getSession();
			// 세션 값 설정
			session.setAttribute("admin", vo);

			response.sendRedirect("notice.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
		
	}

}
