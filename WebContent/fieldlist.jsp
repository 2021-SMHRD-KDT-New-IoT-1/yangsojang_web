
<%@page import="com.model.fieldVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.fieldDAO"%>

<%@page import="com.model.adminDAO"%>
<%@page import="com.model.adminVO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<!-- bootStrap에서 지원하는 해상도 변경 기능 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- bootStrap의 css를 사용하겠다 명시 -->
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<body class="is-preload">

			<%
			//현재 로그인 상태인지 확인 (vo == null > 로그인 하지 않은 상태)
			adminVO vo = (adminVO)session.getAttribute("admin");
			adminDAO dao = new adminDAO();
			
			fieldDAO fielddao = new fieldDAO();
		 	ArrayList<fieldVO> array_field_all = fielddao.fieldAllList();
			%>

	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="fieldlist.jsp" class="logo" style="font-size: 20px;"><strong>현장
							목록</strong></a>
					<ul class="icons">
						<li><a href="fieldAdd.jsp" class="logo"><span
								class="label">현장추가</span></a></li>
						<li><a href="notice.jsp" class="logo"><span class="label"><strong>경고발생현황</strong></span></a></li>
						<li><a href="board_list.jsp" class="logo"><span
							class="label">관리일지</span></a></li>
					</ul>
				</header>
				
				<!-- Section -->
				
				<section>
					<div class="posts"> 
					<%for(fieldVO vo1_field : array_field_all){%>
						<article>
							<a href="#" class="image"><img src="images/pic01.jpg" ></a>
							<h3><%=vo1_field.getField_seq() %>. <%=vo1_field.getField_name() %></h3>
							<p><%=vo1_field.getField_addr() %></p>
							<ul class="actions">
								<li><a href="sensorValueCheckService?field_seq=<%=vo1_field.getField_seq()%>" class="button primary"
									style="margin-right: 10px;">SAFEBOX 확인</a>
									<a href="fieldUpdateCheckService?field_seq=<%=vo1_field.getField_seq()%>" class="button"
									style="margin-right: 10px;">현장 정보 수정</a>
									<a href="safeboxListCheckService?field_seq=<%=vo1_field.getField_seq()%>" class="button">설치 SAFEBOX 목록</a>
								</li>
							</ul>
						</article>
						<%}%>
					</div>
				</section>
				

			</div>
		</div>


		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">


                     <!-- Header -->
                        
				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>


				<nav id="menu">


					<ul>
										<% if(vo==null){%>
										<li><a href="login.jsp">로그인</a></li>
										<li><a href="adminDelete.jsp">회원탈퇴</a></li>
										<%}else{ %>
										
										<li><a href="mypage.jsp">회원정보수정</a></li>
										<li><a href="logoutServlet" class="logo">로그아웃</a></li>
										<%} %>
									</ul>
				</nav>


				<!-- Menu -->
				<% if(vo!=null){%>
				<nav id="menu">
					<header class="major">
						<h2>현장 관리 메뉴</h2>
					</header>
					<ul>
						<li><a href="fieldlist.jsp">현장 목록 </a></li>
						<li><a href="board_list.jsp">관리 일지</a></li>
						<li><a href="notice.jsp">경고 발생 현황</a></li>

						
					</ul>
				</nav>
				<%}else{%>
				<nav id="menu">
					<header class="major">
						<h2>현장 관리 메뉴</h2>
					</header>
					<ul>
						<li><a href="#">로그인이 필요합니다. </a></li>
						

						
					</ul>
				</nav>
				<%} %>

				

				<!-- Section -->
				<section>
					<header class="major">
						<h2>내 정보</h2>
					</header>
		
					<ul class="contact">
										<% if(vo!=null){%>
										<li class="icon solid fa-envelope"><%=vo.getAdmin_email() %></li>
										<li class="icon solid fa-phone"><%=vo.getAdmin_phone() %></li>
										<li class="icon solid fa-home"><%=vo.getAdmin_dept() %></li>
										<%}else{ %>
										<li class="icon solid fa-envelope">이메일</li>
										<li class="icon solid fa-phone">전화번호</li>
										<li class="icon solid fa-home">소속</li>
										<%} %>
									</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>

			</div>
		</div>

	</div>

	<!-- Scripts -->
	<!-- 사이트에서 제공하는 제이쿼리와 js폴더안에 있는 제이쿼리를 참조하겠다. -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>

</html>