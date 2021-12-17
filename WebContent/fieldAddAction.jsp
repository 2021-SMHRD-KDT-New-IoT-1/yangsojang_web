<%@page import="sun.font.Script"%>
<%@page import="com.model.fieldVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.model.fieldDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="fieldVO" class="com.model.fieldVO" scope="page" />
<jsp:setProperty name="fieldVO" property="fieldName" />
<jsp:setProperty name="fieldVO" property="fieldAddr" />
<jsp:setProperty name="fieldVO" property="fieldMemo" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String admin_id = null;
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
			if(fieldVO.getFieldName() == null || fieldVO.getFieldAddr() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('현장명과 주소를 올바르게 입력해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
			}else{
				
				fieldDAO fielddao = new fieldDAO();
				int result = fielddao.fieldAdd(fieldVO.getFieldName(), fieldVO.getFieldAddr(), fieldVO.getFieldMemo());
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	%>

</body>
</html>