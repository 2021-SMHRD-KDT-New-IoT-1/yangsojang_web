<%@page import="com.model.boardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.boardDAO"%>
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
		}
		.board_wrap {
			position: relative;
		}
		.count{
			position: relative;
		}
	
	</style>
	<body class="is-preload">
			<%
			
			adminVO vo = (adminVO)session.getAttribute("admin");
			adminDAO dao = new adminDAO();
			
			boardDAO boarddao = new boardDAO();
		 	ArrayList<boardVO> boardall = boarddao.boardArrayList();
		 	
		 	
			%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="safeboxcheck.jsp" class="logo" style="font-size: 20px;"><strong>관리 일지 목록</strong></a>
									<ul class="icons">
									<li><a href="notice.jsp" class="logo"><span class="label"><strong>경고발생현황</strong></span></a></li>
										<li><a href="fieldlist.jsp" class="logo"><span class="label">현장목록</span></a></li>								
									</ul>
								</header>
							<!-- Content -->
								<section>
									<div class="board_wrap">
										<div class="board_title">
										
											<!-- <p>공지사항을 빠르고 정확하게 안내해드립니다.</p> -->
										</div>
										<div class="board_list_wrap">
											<div class="board_list">
												<div class="top">
													<div class="num">번호</div>
													<div class="title">제목</div>
													<div class="writer">글쓴이</div>
													<div class="date">작성일</div>
													<div class="count"></div>
												</div>
												<%for(boardVO vo_board : boardall){%>
												<div>
													<div class="num"><%=vo_board.getMnt_seq() %></div>
													<% if(vo.getAdmin_id().equals(vo_board.getAdmin_id()) ){  %>
													<div class="title">
													<a href="boardEditCheckService?mnt_seq=<%=vo_board.getMnt_seq() %>"><%=vo_board.getMnt_title() %></a>
													</div>
													<%}else{ %>
													<div class="title">
													<a href="boardViewCheckService?mnt_seq=<%=vo_board.getMnt_seq() %>"><%=vo_board.getMnt_title() %></a>
													</div>
													<%} %>
													<div class="writer"><%=vo_board.getAdmin_id() %></div>
													<div class="date"><%=vo_board.getMnt_date() %></div>
													<%-- <div class="count"><a href="boardEditCheckService?mnt_seq=<%=vo_board.getMnt_seq()%>" class="button">수정</a></div> --%>
												</div>
												<%}%>
											</div>
											<br><br><br>
											
											<ul class="pagination">
											<a href="board_write.jsp" class="button primary">등록</a>
											</ul>	
										</div>
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

		<script>
		function gascheck() {	
			setInterval(() => {
				$.ajax({
					type : "get", 
					/* data : {"email" : input.value}, */
					url : "gasgasCheck", 
					dataType : "text", 
					success : function(data){
						
						if(data=="1"){
							let check = confirm("※위험※  유출 현황을 확인해주세요!!  ※위험※");
							if(check){
								window.location.href = "notice.jsp";
								
							}							
						}
					},
					error : function(){ //통신 실패
					}
				});
				
				  $.ajax({
					type : "get", 
					url : "transeService", 
					dataType : "text",
					data : {'data' : '통신 성공'},
					success : function(data){ 
						console.log(data)
					},
					error : function(){
					}
				});  
			
			}, 1000);
			
		}
		gascheck();
		</script>
	</body>
</html>