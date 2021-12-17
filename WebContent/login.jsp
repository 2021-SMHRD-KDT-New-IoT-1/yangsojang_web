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
									<a href="login.jsp" class="logo" style="font-size: 20px;"><strong>로그인</strong>  </a>
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

									<span class="image main"><img src="images/pic11.jpg" alt="" /></span>

									<form method="post" action="loginServlet">
                                        <div class="row gtr-uniform">
                                            <div class="col-6 col-12-xsmall" style="text-align: center;">
                                                <input type="text" name="admin_id" id="demo-name" value="" placeholder="아이디" />
                                            </div>
                                            <div class="col-6 col-12-xsmall" style="text-align: center;">
                                                <input type="password" name="admin_pwd" id="demo-email" value="" placeholder="비밀번호" />
                                            </div>
                                        
                                            <!-- Break -->
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions">
                                                    <li><input type="submit" value="로그인" class="primary" /><a href="#join" class="button" style="margin-left: 10px;">회원가입</a></li>
													
                                                    <!-- <li><input type="reset" value="Reset" /></li> -->
                                                </ul>
                                            </div>
                                        </div>
                                    </form>
								</section>
								<header id="header">
									<a class="logo" name = "join"  style="font-size: 20px;"><strong>회원가입</strong> </a>
								</header>
								<section>
									<form method="post" action="joinServlet">
                                        <div class="row gtr-uniform">
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall">                                              
													<input type="text" name="admin_id" id="input_id" value="" placeholder="아이디" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="button" onclick="idCheck()" value="ID 중복체크" class="primary" />
                                                </div>
												<div class="col-6 col-12-xsmall">
                            
													<input type="text" name="admin_name" id="input_name" value="" placeholder="이름" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="email" name="admin_email" id="input_email" value="" placeholder="이메일" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="admin_phone" id="input_phone" value="" placeholder="전화번호" />
                                                </div>
												<div class="col-6 col-12-xsmall">
                                                    <input type="password" name="admin_pwd" id="input_pwd" value="" placeholder="비밀번호" />
                                                </div>
                                            	<div class="col-12">
                                               		 <input type="text" name="admin_dept" id="input_deft" value="" placeholder="소속" />

                                            	</div>
                                            
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions">
                                                    <li><input type="submit" onclick="join()" value="회원가입" class="primary" /></li>
													
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
			
			
			<script>
			function idCheck() {
				
				var input = document.getElementById("input_id");
				
				$.ajax({
					type : "post", //데이터 전송 요청 방식
					data : {"admin_id" : input.value}, //전송하는 데이터
					url : "idCheckServlet", //데이터를 전송, 요청하는 서버 페이지
					dataType : "text", //응답데이터의 형식
					success : function(data){ //통신 성공
						if(data=="true"){
							alert('이미 사용중인 아이디 입니다.')
						}else{
							alert('사용 가능한 아이디입니다.')
						}
					},
					error : function(){ //통신 실패
					}
				});
			}

			function join() {
				
				var input_id = document.getElementById("input_id");
				var input_pwd = document.getElementById("input_pwd");
				var input_name = document.getElementById("input_name");
				var input_phone = document.getElementById("input_phone");
				var input_email = document.getElementById("input_email");
				var input_dept = document.getElementById("input_dept");
								
				$.ajax({
					type : "post", //데이터 전송 요청 방식
					data : {"admin_id" : 	input_id.value,
							"admin_pwd" :	input_pwd.value,
							"admin_name":	input_name.value,
							"admin_phone":	input_phone.vlaue,
							"admin_email":	input_email.value,
							"admin_dept":	input_dept.value}, //전송하는 데이터
					url : "joinServlet", //데이터를 전송, 요청하는 서버 페이지
					dataType : "text", //응답데이터의 형식
					success : function(){ //통신 성공
						alert('회원가입 완료되었습니다.')
					},
					error : function(){ //통신 실패
					}
				});
			}
			 
			
			</script>
	</body>
</html>