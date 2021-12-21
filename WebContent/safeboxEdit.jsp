
<%@page import="com.model.fieldVO"%>
<%@page import="com.model.fieldDAO"%>
<%@page import="com.model.safeboxVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.safeboxDAO"%>
<%@page import="com.model.adminDAO"%>
<%@page import="com.model.adminVO"%>
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
			int field_seq_session = (int)session.getAttribute("field_seq_session2");
			safeboxDAO safeboxdao = new safeboxDAO();
			ArrayList<safeboxVO> safebox_array_all = safeboxdao.safeboxAllList(field_seq_session);
			
			fieldDAO fielddao = new fieldDAO();
			fieldVO fieldvo = fielddao.fieldOne(field_seq_session);
			
			adminVO vo = (adminVO)session.getAttribute("admin");
			adminDAO dao = new adminDAO();
		
		%>

			

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="safeboxEdit.jsp" class="logo" style="font-size: 20px;"><strong>SafeBox 관리</strong></a>
									<ul class="icons">
										<li><a href="safeboxAddCheckService?field_seq=<%=field_seq_session %>" class="logo"><span class="label"><strong>Safebox추가</strong></span></a></li>
									</ul>
								</header>

								
							<!-- Content -->
								<section>
									

									<h2>현장 [<%=fieldvo.getField_name() %>]의 SAFEBOX LIST </h2>
									
													<div class="table-wrapper">
													
														<table>
															<thead>
																<tr>
																	<th>SAFEBOX 번호</th>
																	<th>SAFEBOX ID</th>
																	<th>SAFEBOX 위치</th>
																	<th>SAFEBOX 설치일</th>
																	<th>SAFEBOX 정보수정</th>
																	<th>SAFEBOX 설치제거</th>
																</tr>
															</thead>
															<tbody>
															<%for(safeboxVO vo2_safebox : safebox_array_all){%>
																<tr>
																	<td><%=vo2_safebox.getDevice_seq() %></td>
																	<td><%=vo2_safebox.getDevice_id() %></td>
																	<td><%=vo2_safebox.getDevice_location() %></td>
																	<td><%=vo2_safebox.getReg_date() %></td>
																	<%-- <td><a href="safeboxsensorCheckService?safebox_seq=<%=vo2_safebox.getDevice_seq() %>" class="logo" style="outline: none; text-decoration: none;">확인</a></td> --%>
																	<td><a href="safeboxUpdateCheckService?safebox_seq=<%=vo2_safebox.getDevice_seq() %>" class="logo" style="outline: none; text-decoration: none;">수정</a></td>
																	<td><a href="safeboxDeleteService?safebox_seq=<%=vo2_safebox.getDevice_seq() %>" class="logo" style="outline: none; text-decoration: none;">제거</a></td>
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
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
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