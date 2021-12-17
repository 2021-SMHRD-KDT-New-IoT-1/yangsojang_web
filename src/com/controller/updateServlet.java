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

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession(); //세션객체 생성
		adminVO vo = (adminVO)session.getAttribute("member"); //현재 로그인한 사용자의 정보
		String admin_id = vo.getAdmin_id(); //현재 로그인한 사용자의 이메일
		
		//수정에 사용할 정보
		String admin_pwd = request.getParameter("admin_pwd");
		String admin_name = request.getParameter("admin_name");
		String admin_phone = request.getParameter("admin_phone");
		String admin_email = request.getParameter("admin_email");
		String admin_dept = request.getParameter("admin_dept");
		
		// String user_no = request.getParameter("user_no");
		
//		String result = loc_no.substring(loc_no.lastIndexOf("/")+1);
					
		adminDAO dao = new adminDAO();
		int cnt = dao.update(admin_id, admin_pwd, admin_name, admin_phone, admin_email, admin_dept);
		
		if(cnt>0) {
			System.out.println("수정 성공");
			
			vo = new adminVO(admin_id, admin_pwd, admin_name, admin_phone, admin_email, admin_dept);
			session.setAttribute("admin", vo); //수정한 값으로 업뎃
			
			response.sendRedirect("login.jsp");
		}else {
			System.out.println("수정 실패");
			response.sendRedirect("notice.jsp");
		}
	}

}
