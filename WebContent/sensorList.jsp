<%@page import="com.model.adminDAO"%>
<%@page import="com.model.adminVO"%>
<%@page import="com.model.safeboxVO"%>
<%@page import="com.model.safeboxDAO"%>
<%@page import="com.model.sensorVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.sensorDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Elements - Editorial HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">

		<%
			adminVO vo = (adminVO)session.getAttribute("admin");
			adminDAO dao = new adminDAO();
			sensorDAO sensordao = new sensorDAO();
			
			int safebox_seq_int_session = (int)session.getAttribute("safebox_seq_int_session");
			
			ArrayList<sensorVO> sensor_array_all = sensordao.sensorAllList(safebox_seq_int_session);
			
			
		%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								
							<header id="header">
									<a href="sensorList.jsp" class="logo" style="font-size: 20px;"><strong>센서 관리</strong></a>
									<ul class="icons">
										<!-- <form action="safeboxadd.html"><input type="submit" value="SAFEBOX 추가" class="primary" /></form> -->
										<li><a href="sensorAddCheckService?device_seq=<%=safebox_seq_int_session%>" class="logo"><span class="label"><strong>센서추가</strong></span></a></li>
										
									</ul>
								</header>

									<!-- Elements -->
										<h2 id="elements"><%--기기 번호, 아이디  <%= %> --%></h2>
											
													<div class="table-wrapper">
														<table>
															<thead>
																<tr>
																	<th>센서 번호</th>
																	<th>센서 이름</th>
																	<th>센서 ID</th>
																	<th>등록일자</th>
																	<th>센서  수정</th>
																	<th>센서 삭제</th>
																</tr>
															</thead>
															<tbody>
															<%for(sensorVO vo2_sensor : sensor_array_all){%>
																<tr>
																	<td><%=vo2_sensor.getSensor_seq() %></td>
																	<td><%=vo2_sensor.getSensor_name() %></td>
																	<td><%=vo2_sensor.getSensor_id() %></td>
																	<td><%=vo2_sensor.getReg_date() %></td>
																	<td><a href="sensorUpdateCheckService?sensor_seq=<%=vo2_sensor.getSensor_seq()%>" class="logo" style="outline: none; text-decoration: none;">수정</a></td>
																	<td><a href="sensorDeleteService?sensor_seq=<%=vo2_sensor.getSensor_seq()%>" class="logo" style="outline: none; text-decoration: none;">삭제</a></td>
																</tr>
																<%}%>
															</tbody>
															
														</table>
													</div>
											
										

								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

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
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">YANG SO JANG</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>