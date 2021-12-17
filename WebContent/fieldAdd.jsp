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
									<a href="fieldAdd.jsp" class="logo" style="font-size: 20px;"><strong>현장 추가 </strong></a>
									
								</header>

							<!-- Content -->
								<section>
									<!-- <header class="main">
										<h1></h1>
									</header> -->

									<!-- <span class="image main"><img src="images/pic11.jpg" alt="" /></span> -->

									<form method="post" action="fieldAddService">
                                        <div class="row gtr-uniform">
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall"> 
                                               
                                                    <input type="text" name="field_name" id="demo-name" value="" placeholder="현장명" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="field_addr" id="demo-email" value="" placeholder="주소" />
                                                </div>
                                                <div class="col-12">
                                                    <textarea name="field_memo" id="demo-message" placeholder="메모" rows="6"></textarea>
                                                </div>
                                                
                                            <!-- Break -->
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions" >
                                                    <li>
                                                    <input type="submit" value="추가" class="primary" style="margin-right: 10px;" >
                                                    <input type="reset" value="초기화" style="margin-left: 10px;">
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                       </div>
                                    </form>

									<!-- <hr class="major" />

									<h2></h2>
									<p></p>
									<p></p>

									<hr class="major" />

									<h2></h2>
									<p></p>
									<p></p>

									<hr class="major" />

									<h2></h2>
									<p></p>
									<p></p> -->

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
										<li>
										<% if(vo==null){%>
										<a href="login.jsp">로그인</a>
										<%}else{ %>
										</li>
										<li>
										<a href="mypage.jsp">회원정보수정</a>
										</li>
										<li><a href="logoutServlet" class="logo">로그아웃</a></li>
										<%} %>
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
											<!-- <li><a href="elements.html">SafeBox List Manage</a></li> -->
											<!-- <li><a href="safebox.html">SafeBox List</a></li> -->
											<!-- <li>
												<span class="opener">Submenu</span>
												<ul>
													<li><a href="#">Lorem Dolor</a></li>
													<li><a href="#">Ipsum Adipiscing</a></li>
													<li><a href="#">Tempus Magna</a></li>
													<li><a href="#">Feugiat Veroeros</a></li>
												</ul>
											</li> -->
											
										</ul>
									</nav>
	
								<!-- Section -->
									<!-- <section>
										<header class="major">
											<h2>Ante interdum</h2>
										</header>
										<div class="mini-posts">
											<article>
												<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
											</article>
											<article>
												<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
											</article>
											<article>
												<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
											</article>
										</div>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</section> -->
	
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