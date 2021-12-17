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

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="safeboxEdit.jsp".html" class="logo" style="font-size: 20px;"><strong>SafeBox 관리</strong></a>
									<ul class="icons">
										<!-- <form action="safeboxadd.html"><input type="submit" value="SAFEBOX 추가" class="primary" /></form> -->
										<li><a href="safeboxadd.jsp" class="logo"><span class="label"><strong>Safebox추가</strong></span></a></li>
										<li><a href="safeboxUpdate.jsp" class="logo"><span class="label">Safebox정보수정</span></a></li>
										
									</ul>
								</header>

								
							<!-- Content -->
								<section>
									

									<h2>현장명</h2>
									
													<div class="table-wrapper">
														<table>
															<thead>
																<tr>
																	<th>SAFEBOX 번호</th>
																	<th>SAFEBOX ID</th>
																	<th>SAFEBOX 위치</th>
																	<th>설치된 센서</th>	
																	<th>SAFEBOX 설치제거</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>Item1</td>
																	<td>Item1</td>
																	<td>Ante turpis integer aliquet porttitor.</td>
																	<td>Item1</td>
																	<td><a href="safeboxDeleteService?safebox_seq=>" class="logo" style="outline: none; text-decoration: none;">제거</a></td>
																</tr>
																
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