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

									 <!-- <span class="image main"><img src="images/1130144_411194_4810.jpg" alt="" /></span>  -->

									<form method="post" action="#">
                                        <div class="row gtr-uniform">
                                            <div class="col-6 col-12-xsmall" style="text-align: center;">
                                                <input type="text" name="admin_id" id="admin_idl" value="" placeholder="아이디" />
                                            </div>
                                            <div class="col-6 col-12-xsmall" style="text-align: center;">
                                                <input type="password" name="admin_pwd" id="admin_pwdl" value="" placeholder="비밀번호" />
                                            </div>
                                        
                                            <!-- Break -->
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions">
                                                    <li><input type="button" onclick="login()" value="로그인" class="primary" /><a href="#join" class="button" style="margin-left: 10px;">회원가입</a></li>
													
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
									<form method="post" action="#">
                                        <div class="row gtr-uniform">
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall">                                              
													<input type="text" name="admin_id" id="admin_idj"  placeholder="아이디" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="button" onclick="idCheck()" value="ID 중복체크" class="primary" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="password" name="admin_pwd" id="admin_pwdj"  placeholder="비밀번호" />
                                                </div>
												<div class="col-6 col-12-xsmall">
                            
													<input type="text" name="admin_name" id="admin_name"  placeholder="이름" />
                                                </div>
                                                 <div class="col-6 col-12-xsmall">
                            
													<input type="text" name="admin_phone" id="admin_phone"  placeholder="전화번호" />
                                                </div>
												
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="email" name="admin_email" id="admin_email"  placeholder="이메일" />
                                                </div>
                                               
                                            	<div class="col-12">
                                               		 <input type="text" name="admin_dept" id="admin_dept"  placeholder="소속" />

                                            	</div>
                                            
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions">
                                                    <li><input type="button" onclick="join()" value="회원가입" class="primary" /></li>
													
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
										
										<li><a href="login.jsp">로그인</a></li>
										<li><a href="adminDelete.jsp">회원탈퇴</a></li>	
										
									</ul>
								</nav>

							<!-- Menu -->
								
				<nav id="menu">
					<header class="major">
						<h2>현장 관리 메뉴</h2>
					</header>
					<ul>
						<li><a href="#">로그인이 필요합니다. </a></li>
						

						
					</ul>
				</nav>
				

							

							<!-- Section -->
								<section>
									<header class="major">
										<h2>내 정보</h2>
									</header>
									
									<ul class="contact">
										
										<li class="icon solid fa-envelope">이메일</li>
										<li class="icon solid fa-phone">전화번호</li>
										<li class="icon solid fa-home">소속</li>
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
				function idCheck() {
					
					var input = document.getElementById("admin_idj");
					
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
				
				function login() {
					var admin_id = document.getElementById("admin_idl");
					var admin_pwd = document.getElementById("admin_pwdl");
					
					$.ajax({
						type : "post", //데이터 전송 요청 방식
						data : {
								"admin_id" : 	admin_id.value,
								"admin_pwd" :	admin_pwd.value
								},
						url : "loginServlet", //데이터를 전송, 요청하는 서버 페이지
						dataType : "text", //응답데이터의 형식
						success : function(data){ //통신 성공
							
							if(data==null){
								alert('로그인을 다시 시도해 주세요.')
								window.location.href = "login.jsp"; 
							}else{
								
								alert('로그인 완료되었습니다. 경고 발생 현황을 확인해 주세요!')
								
								$.ajax({
									type:"post",
									data:{
										number:"1",
										value:"1"
									},
									url:"mqtt_pub_sub"
									
									})
								window.location.href = "notice.jsp";
								
							}
						},
						error : function(){ //통신 실패
						}
					});
				}
				
				function join() {
					
					var admin_id = document.getElementById("admin_idj");
					var admin_pwd = document.getElementById("admin_pwdj");
					var admin_name = document.getElementById("admin_name");
					var admin_phone = document.getElementById("admin_phone");
					var admin_email = document.getElementById("admin_email");
					var admin_dept = document.getElementById("admin_dept");
									
					$.ajax({
						type : "post", //데이터 전송 요청 방식
						data : {
								"admin_id" : 	admin_id.value,
								"admin_pwd" :	admin_pwd.value,
								"admin_name" :	admin_name.value,
								"admin_phone" :	admin_phone.value,
								"admin_email" :	admin_email.value,
								"admin_dept" :	admin_dept.value
								},
						url : "joinServlet", //데이터를 전송, 요청하는 서버 페이지
						dataType : "text", //응답데이터의 형식
						success : function(data){ //통신 성공
							
							if(data=="0"){
								alert('회원가입을 다시 시도해 주세요.')
								window.location.href = "login.jsp"; 
							}else{
								
								alert('회원가입 완료되었습니다.')
								window.location.href = "login.jsp"; 
							}
						},
						error : function(){ //통신 실패
						}
					});
				}
			</script>
			
			
	</body>
</html>