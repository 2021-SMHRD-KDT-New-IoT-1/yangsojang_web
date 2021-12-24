<%@page import="java.util.ArrayList"%>
<%@page import="com.model.safeboxDAO"%>
<%@page import="com.model.safeboxVO"%>
<%@page import="com.model.boardVO"%>
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
			margin-top: 30px;
		}
		.board_wrap {
			position: relative;
		}
		.filebox .upload-name {
			display: inline-block;
			height: 40px;
			padding: 0 10px;
			vertical-align: middle;
			margin-bottom: 12px;
			border: 1px solid #dddddd;
			width: 50%;
			color: #999999;
		}
		.filebox label {
			display: inline-block;
			padding: 10px 20px;
			color: #fff;
			vertical-align: middle;
			
			background-color: #999999;
			cursor: pointer;
			height: 40px;
			margin-left: 10px;
		}
		.filebox input[type="file"] {
    		position: absolute;
    		width: 0;
    		height: 0;
    		padding: 0;
    		overflow: hidden;
    		border: 0;
		}
		
	
	</style>
	<body class="is-preload">
			<%
			int mnt_seq = (int)session.getAttribute("mnt_seq_session");
			boardDAO boarddao = new boardDAO();
			boardVO boardvo = boarddao.board_one(mnt_seq);
			
			adminVO vo = (adminVO)session.getAttribute("admin");
			adminDAO dao = new adminDAO();
			
			safeboxDAO safeboxdao = new safeboxDAO();
			ArrayList<safeboxVO> safebox_array_all = safeboxdao.safeboxList();
			session.setAttribute("mnt_seq_session_again", mnt_seq);
			%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="board_edit.jsp" class="logo" style="font-size: 20px;"><strong>관리 일지 수정</strong></a>
									<ul class="icons">
										
									</ul>
								</header>

							<!-- Content -->
								<section>
									<div class="board_wrap">
										<div class="board_write_wrap">
											<div class="board_write">
											<form method="post" action="boardEdit">
												<div class="title">
													<dl>
														<dt>제목</dt>
														<dd><input type="text" name="mnt_title" placeholder="제목 입력" value="<%=boardvo.getMnt_title() %>"></dd>
													</dl>
												</div>
												<div class="info">
													<dl>
														<dt>SAFEBOX 선택</dt>
														<dd><select name="device_seq" id="demo-category">
			                                                    <option value=""> SAFEBOX LIST </option>
			                                                    <%for(safeboxVO vo2_safebox : safebox_array_all){%>
			                                                    <option ><%=vo2_safebox.getDevice_id() %>/<%=vo2_safebox.getDevice_seq() %></option>
			                                                    <%}%>
			                                                </select></dd>
													</dl>
													<dl>
														<dt>사진첨부</dt>
														<dd><div class="filebox">
																<input class="upload-name" name ="mnt_file"  placeholder="첨부파일">
																<label for="file">파일찾기</label>
																<input type="file" id="file">
															</div></dd>
													</dl>
												</div>
												<div class="cont">
													<img src="<%=boardvo.getMnt_file() %>">
													<textarea placeholder="내용 입력" name="mnt_content"><%=boardvo.getMnt_content() %></textarea>
												</div>
											</div>
											
											<ul class="pagination">
												<input type="submit" value="수정" class="primary" />
												<a href="boardDeleteService?mnt_seq=<%=mnt_seq %>" class="button">삭제</a>
												<a href="board_list.jsp" class="button">취소</a>	
											</ul>
											</form>
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
	
			//파일 선택 시 경로 뜨는 제이쿼리 지우면 안됩니다!!
			$("#file").on('change',function(){
				var fileName = $("#file").val();
				$(".upload-name").val(fileName);
			  });
			
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