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
		<title>Generic - Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css"/>
		<link rel="stylesheet" href="assets/css_board/css.css">
	</head>
	<style>
		.pagination{
			text-align: center;
			margin-top: 20px;
		}
		.board_write {
			position: relative;
		}
	
	</style>
	<body class="is-preload">
<%
			//현재 로그인 상태인지 확인 (vo == null > 로그인 하지 않은 상태)
			adminVO vo = (adminVO)session.getAttribute("admin");
			adminDAO dao = new adminDAO();
			
			
			safeboxDAO safeboxdao = new safeboxDAO();
			ArrayList<safeboxVO> safebox_array_all = safeboxdao.safeboxList();
			%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="board_write.jsp" class="logo" style="font-size: 20px;"><strong>관리 일지 작성</strong> </a>
									<ul class="icons">
										
									</ul>
								</header>

							<!-- Content -->
								<section>
											<div class="board_write">
												<div class="title">
													<dl>
														<dt>제목</dt>
														<dd><input type="text" placeholder="제목 입력"></dd>
													</dl>
												</div>
												<div class="info">
													<dl>
														<dt>SAFEBOX 선택</dt>
														<dd>
															<select name="demo-category" id="demo-category">
			                                                    <option value=""> SAFEBOX LIST </option>
			                                                    <%for(safeboxVO vo2_safebox : safebox_array_all){%>
			                                                    <option value=""><%=vo2_safebox.getDevice_seq() %>. <%=vo2_safebox.getDevice_id() %></option>
			                                                    <%}%>
			                                                </select>
														</dd>
													</dl>
													<dl>
														<dt>사진첨부</dt>
														<dd><a href="#" class="button icon solid fa-download">첨부</a></dd>
														
													</dl>
												</div>
												<div class="cont">
													<textarea placeholder="내용 입력"></textarea>
												</div>
											</div>
											<div class="col-12" style=" vertical-align : middle;">
												<ul class="pagination" >
													<li><form action="#"><input type="submit" value="등록" class="primary" /></form></li>
													<li><form action="board_list.jsp"><input type="submit" value="취소" class="primary" /></form></li>
												</ul>
												
											
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