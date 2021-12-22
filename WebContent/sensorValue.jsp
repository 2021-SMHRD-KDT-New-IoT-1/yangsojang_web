<%@page import="java.util.ArrayList"%>
<%@page import="com.model.fieldVO"%>
<%@page import="com.model.fieldDAO"%>
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
<title>Edito UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/onOff.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
</head>
<style>
.section {
	position: relative;
}

.article {
	position: relative;
}

.posts {
	position: relative;
}

table .ttbody {
	position: relative;
	vertical-align: middle;
}
</style>

<body class="is-preload">
	<!-- Wrapper -->
	<%
		//현재 로그인 상태인지 확인 (vo == null > 로그인 하지 않은 상태)
	adminVO vo = (adminVO) session.getAttribute("admin");
	adminDAO dao = new adminDAO();
	%>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<a href="#" class="logo" style="font-size: 20px;"><strong></strong><br></a>

					<ul class="icons">

						<li><a href="notice.jsp" class="logo"><span class="label"><strong>경고발생현황</strong></span></a></li>
						<li><a href="board_list.jsp" class="logo"><span
								class="label">관리일지</span></a></li>
					</ul>
				</header>


				<section>
					<div class="box"
						style="display: inline-block; position: relative; width: 100%">
						<div class="row">
							
							<div class="col-4">
								<h3>SAFEBOX ID</h3>
							</div>
							<div class="col-3">
								<label class="switch-button"> <input type="checkbox" />
									<div class="onoff-switch"></div>
								</label>
							</div>

							<div class="row" style="margin-left: 6px ;width:100%">
								<ul class="alt">
									<li><h4>기기 위치</h4>
										<p>위치를 넣어주세요</p></li>
									<li><h4>측정 주기</h4>
										<p>주기를 넣어주세요</p>
										<form method="post" action="#">
											<div class="row">
												<div class="col-6">
													<input type="text" id="" value="" placeholder="주기를 입력하세요.">
												</div>
												<div class="col-6">
													<input type="submit" id="" value="확인" class="primary">
												</div>
											</div>
										</form></li>
								</ul>
								<div class="container"
									style="display: float;">
									<div class="animations-container">
										<h3>SAFE BOX 동작 제어</h3>
										<div class="toggle toggle--on-off">
											<div class="toggle__switch">
												<input class="toggle__checkbox" id="toggle1" type="checkbox"
													name="toggle1" checked="" /><span class="toggle__handle"></span><span
													class="toggle__backdrop"></span>
											</div>
											<label class="toggle__label" for="toggle1"><p>무언가 주의사항이 써져있다. 주의사항을 충분히 읽은 후 이 곳을 클릭해 주세요.</p></label>
										</div>
									</div>
									
									
								</div>

							</div>

						</div>


					</div>


				</section>


				<section class="banner">
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>센서이름</th>
									<th>기준농도</th>
									<th>현재농도</th>
									<th>설정변경</th>

								</tr>
							</thead>
							<tbody class="ttbody">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td><form action="sensorManage.jsp">
											<input type="submit" value="설정">
										</form></td>
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
						<%
							if (vo == null) {
						%>
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="adminDelete.jsp">회원탈퇴</a></li>
						<%
							} else {
						%>

						<li><a href="mypage.jsp">회원정보수정</a></li>

						<li><a href="logoutServlet" class="logo">로그아웃</a></li>
						<%
							}
						%>
					</ul>
				</nav>

				<!-- Menu -->
				<%
					if (vo != null) {
				%>
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
				<%
					} else {
				%>
				<nav id="menu">
					<header class="major">
						<h2>현장 관리 메뉴</h2>
					</header>
					<ul>
						<li><a href="#">로그인이 필요합니다. </a></li>



					</ul>
				</nav>
				<%
					}
				%>



				<!-- Section -->
				<section>
					<header class="major">
						<h2>내 정보</h2>
					</header>

					<ul class="contact">
						<%
							if (vo != null) {
						%>
						<li class="icon solid fa-envelope"><%=vo.getAdmin_email()%></li>
						<li class="icon solid fa-phone"><%=vo.getAdmin_phone()%></li>
						<li class="icon solid fa-home"><%=vo.getAdmin_dept()%></li>
						<%
							} else {
						%>
						<li class="icon solid fa-envelope">이메일</li>
						<li class="icon solid fa-phone">전화번호</li>
						<li class="icon solid fa-home">소속</li>
						<%
							}
						%>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
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
	<script src="assets/js/onOff.js"></script>

</body>
</html>