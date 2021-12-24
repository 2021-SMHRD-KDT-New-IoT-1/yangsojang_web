<%@page import="java.util.ArrayList"%>
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
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
			<%
			//현재 로그인 상태인지 확인 (vo == null > 로그인 하지 않은 상태)
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
									<a href="login.jsp" class="logo" style="font-size: 20px;"><strong>회원 탈퇴</strong>  </a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<!-- <header class="main">
										<h1></h1>
									</header> -->

									<!-- <span class="image main"><img src="images/pic11.jpg" alt="" /></span> -->

									<form method="post" action="#">
                                        <div class="row gtr-uniform">
                                            <div class="col-6 col-12-xsmall" style="text-align: center;">
                                                <input type="text" name="admin_id" id="admin_id"  placeholder="아이디" />
                                            </div>
                                            <div class="col-6 col-12-xsmall" style="text-align: center;">
                                                <input type="password" name="admin_pwd" id="admin_pwd"  placeholder="비밀번호" />
                                            </div>
                                        
                                            <!-- Break -->
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions">
                                                    <li><input type="button" onclick="admindelete()" value="탈퇴" class="primary" /></li>
													
                                                    <!-- <li><input type="reset" value="Reset" /></li> -->
                                                </ul>
                                            </div>
                                        </div>
                                    </form>
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
										<li><a href="adminDelete.jsp">회원탈퇴</a></li>
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
				
				
				function admindelete() {
					
					let admin_id = document.getElementById("admin_id");
					let admin_pwd = document.getElementById("admin_pwd");
					
					$.ajax({
						type : "post", //데이터 전송 요청 방식
						data : {
								"admin_id" : admin_id.value,
								"admin_pwd" :admin_pwd.value
								},
						url : "adminDeleteServlet", //데이터를 전송, 요청하는 서버 페이지
						dataType : "text", //응답데이터의 형식
						success : function(data){ //통신 성공
							
							if(data=="0"){
								alert('회원 탈퇴를 다시 시도해 주세요.')
								window.location.href = "adminDelete.jsp"; 
							}else{
								
								alert('회원 탈퇴 완료되었습니다.')
								
								window.location.href = "login.jsp";
							}
						},
						error : function(){ //통신 실패
						}
					});
				}
				
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