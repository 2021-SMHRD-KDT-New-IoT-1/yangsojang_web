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
									<form method="post" action="#">
										
                                        <div class="row gtr-uniform">
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="demo-name" id="demo-name" value="" placeholder="이름" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="email" name="demo-email" id="demo-email" value="" placeholder="이메일" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="demo-id" id="demo-name" value="" placeholder="아이디" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="password" name="demo-pw" id="demo-email" value="" placeholder="비밀번호" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="demo-phone" id="demo-email" value="" placeholder="전화번호" />
                                                </div>
                                            <!-- Break -->
                                            <div class="col-12">
                                                <select name="demo-category" id="demo-category">
                                                    <option value="">- 소속 -</option>
                                                    <option value="1">Manufacturing</option>
                                                    <option value="1">Shipping</option>
                                                    <option value="1">Administration</option>
                                                    <option value="1">Human Resources</option>
                                                </select>
                                            </div>
                                            
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions">
                                                    <li><input type="submit" value="회원가입" class="primary" /></li>
													
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
										<li><a href="mypage.jsp">회원정보수정</a></li>
									</ul>
								</nav>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>현장 관리 메뉴</h2>
									</header>
									<ul>
										<li><a href="fieldlist.jsp">현장 목록 </a></li>
										<li><a href="sensorList.jsp">센서 목록 </a></li>
										<li><a href="board_list.jsp">관리 일지</a></li>
                              			<li><a href="notice.jsp">경고 발생 현황</a></li>
										
										
									</ul>
								</nav>

							

							<!-- Section -->
								<section>
									<header class="major">
										<h2>내 정보</h2>
									</header>
									
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
										<li class="icon solid fa-phone">(000) 000-0000</li>
										<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
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