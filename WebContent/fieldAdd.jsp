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

									<form method="post" action="#">
                                        <div class="row gtr-uniform">
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall"> 
                                               
                                                    <input type="text" name="field_name" id="field_name" value="" placeholder="현장명" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="field_addr" id="field_addr" value="" placeholder="주소" />
                                                </div>
                                                <div class="col-12">
                                                    <textarea name="field_memo" id="field_memo" placeholder="메모" rows="6"></textarea>
                                                </div>
                                                
                                            <!-- Break -->
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions" >
                                                    <li>
                                                    <input type="submit" value="추가" class="primary" style="margin-right: 10px;" onclick="fieldAddCheck()">
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
			function fieldAddCheck() {
				
				var field_name = document.getElementById("field_name");
				var field_addr = document.getElementById("field_addr");
				var field_memo = document.getElementById("field_memo");
				
				$.ajax({
					type : "post", //데이터 전송 요청 방식
					data : {"field_name" : field_name.value,
						"field_addr" : field_addr.value,
						"field_memo" : field_memo.value
						}, //전송하는 데이터
					url : "fieldAddCheckService", //데이터를 전송, 요청하는 서버 페이지
					dataType : "text", //응답데이터의 형식
					success : function(data){ //통신 성공
						
						if(data=="0"){
							alert('다시 시도해 주세요.')
							
						}else{
							confirm('현장 추가 완료되었습니다.')
						}
					},
					error : function(){ //통신 실패
					}
				});
			} 
		</script>
	</body>
</html>