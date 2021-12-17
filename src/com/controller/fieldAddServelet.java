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

@WebServlet("/fieldAddServelet")
public class fieldAddServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String admin_id = null;
		HttpSession session =request.getSession();
		fieldVO vo = null;
		
		if(session.getAttribute("admin_id") != null){
			admin_id = (String) session.getAttribute("userID");
		}
		if(admin_id == null){
			PrintWriter script = response.getWriter();//자바에서 script 사용하겠다.
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp");
			script.println("</script>");
			
		}else{
			//현장명과 주소중 하나가 빠져 있을 경우 뒤로 둘려보낸다.
			if(vo.getFieldName() == null || vo.getFieldAddr() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('현장명과 주소를 올바르게 입력해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
			}else{
				
				fieldDAO fielddao = new fieldDAO();
				int result = fielddao.fieldAdd(vo.getFieldName(), vo.getFieldAddr(), vo.getFieldMemo());
				if(result ==-1){//데이터베이스 오류가 난 경우.
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('현장 추가에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
					
				}
				else{//성공한 경우 
					PrintWriter script = response.getWriter();
					script.println("<script>");
				    script.println("location.href = 'fieldlist.jsp'");
					script.println("</script>");
				}
			}
		}
	}

}
