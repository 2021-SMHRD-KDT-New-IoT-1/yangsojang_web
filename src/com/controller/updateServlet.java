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
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(); //세션객체 생성
		adminVO vo = (adminVO)session.getAttribute("admin"); //현재 로그인한 사용자의 정보
		
		String admin_id = vo.getAdmin_id();
		//수정에 사용할 정보
		String admin_pwd = request.getParameter("admin_pwd");
		String admin_name = request.getParameter("admin_name");
		String admin_phone = request.getParameter("admin_phone");
		String admin_email = request.getParameter("admin_email");
		String admin_dept = request.getParameter("admin_dept");
	
		String admin_pwd_result;
		String admin_name_result;
		String admin_phone_result;
		String admin_email_result;
		String admin_dept_result;
				
		if(admin_pwd=="" || admin_pwd==null) {
			admin_pwd_result = vo.getAdmin_pwd();
		}else {
			admin_pwd_result = admin_pwd;
		}
		
		if(admin_name=="" || admin_name==null) {
			admin_name_result = vo.getAdmin_name();
		}else {
			admin_name_result = admin_name;
		}
		
		if(admin_phone=="" || admin_phone==null) {
			admin_phone_result = vo.getAdmin_phone();
		}else {
			admin_phone_result = admin_phone;
		}
		
		if(admin_email=="" || admin_email==null) {
			admin_email_result = vo.getAdmin_email();
		}else {
			admin_email_result = admin_email;
		}
		
		if(admin_dept=="" || admin_dept==null) {
			admin_dept_result = vo.getAdmin_dept();
		}else {
			admin_dept_result = admin_dept;
		}
		

		adminDAO dao = new adminDAO();
		int cnt = dao.update(admin_pwd_result, admin_name_result, admin_phone_result, admin_email_result, admin_dept_result, admin_id);
		
		if(cnt>0) {
			System.out.println("수정 성공");
			
			vo = new adminVO(admin_pwd_result, admin_name_result, admin_phone_result, admin_email_result, admin_dept_result);
			session.setAttribute("admin", vo); //수정한 값으로 업뎃
			
			
		}else {
			System.out.println("수정 실패");
			
		}
	}

}
