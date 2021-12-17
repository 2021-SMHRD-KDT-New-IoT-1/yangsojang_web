<%@page import="com.model.safeboxVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.safeboxDAO"%>
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
			safeboxDAO safeboxdao = new safeboxDAO();
			ArrayList<safeboxVO> safebox_array = safeboxdao.safeboxList();
			
		%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="sensorAdd.jsp" class="logo" style="font-size: 20px;"><strong>센서 추가</strong> </a>
									<ul class="icons">
										
									</ul>
								</header>

							<!-- Content -->
								<section>

									<form method="post" action="sensorAddService">
                                        <div class="row gtr-uniform">
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="sensor_name" id="demo-name" value="" placeholder="센서  이름" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="sensor_id" id="demo-email" value="" placeholder="센서 ID" />
                                                </div>
                                               	<div class="col-6 col-12-xsmall">
                                                	<select name="device_seq" id="demo-category">
                                                    	<option value="">- SAFEBOX -</option>
                                                    	<%for(safeboxVO vo1_safebox : safebox_array){%>
                                                    	<option name="device_seq"><%=vo1_safebox.getDevice_id()%>/<%=vo1_safebox.getDevice_seq()%></option>
                                                    	<%}%>
                                                	</select>
                                                </div>
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions" >
                                                    <li><input type="submit" value="추가" class="primary" style="margin-right: 10px;" ><input type="reset" value="초기화" style="margin-left: 10px;"></li>
                                                    
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