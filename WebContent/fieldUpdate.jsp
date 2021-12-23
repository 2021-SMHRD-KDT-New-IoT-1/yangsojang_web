
<%@page import="com.model.fieldDAO"%>
<%@page import="com.model.fieldVO"%>

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
	<style>
	.filebox .upload-name {
			margin-top : 30px;
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
			margin-top : 30px;
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
			int vo_field_session = (int)session.getAttribute("field_seq_session");
			session.setAttribute("field_seq_session_again", vo_field_session);
			
			adminVO vo = (adminVO)session.getAttribute("admin");
			adminDAO dao = new adminDAO();
			
			fieldDAO fielddao = new fieldDAO();
			fieldVO fieldvo = fielddao.field_one(vo_field_session);
			
		%>

			

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="fieldUpdate.jsp" class="logo" style="font-size: 20px;"><strong>현장 정보 수정 </strong> </a>
									
								</header>

							<!-- Content -->
								<section>
									<!-- <header class="main">
										<h1></h1>
									</header> -->

									<!-- <span class="image main"><img src="images/pic11.jpg" alt="" /></span> -->

									<form method="post" encType = "multipart/form-data" action="#">
                                        <div class="row gtr-uniform">
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="field_name" id="field_name" value="<%=fieldvo.getField_name() %>" placeholder="현장명" /><br>
                                                    <input type="text" name="field_addr" id="field_addr" value="<%=fieldvo.getField_addr() %>" placeholder="주소" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                <div class="filebox">
																<input class="upload-name" name ="field_file" id = "field_file"  placeholder="첨부파일" value="<%=fieldvo.getField_file() %>">
																<label for="file">파일찾기</label>
																<input type="file" id="file">
															</div>
                                                </div>
                                                <div class="col-12">
                                                    <textarea name="field_memo" id="field_memo" placeholder="메모" rows="6"><%=fieldvo.getField_memo() %></textarea>
                                                </div>
                                               
                                            <div class="col-12" style="text-align: center;">
                                                <ul class="actions" >
                                                    <li><input type="button" onclick="fieldUpdate()" value="수정" class="primary" style="margin-right: 10px;" >
                                                    <a href="fieldDeleteService?field_seq=<%=vo_field_session %>" class="button">삭제</a>
                                                    <input type="reset" value="초기화" style="margin-left: 10px;"></li>
                                                    
                                                </ul>
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
			
			<script >
				function fieldUpdate() {
				
				let field_name = document.getElementById("field_name");
				let field_addr = document.getElementById("field_addr");
				let field_file = document.getElementById("field_file");
				let field_memo = document.getElementById("field_memo");
				
								
				$.ajax({
					type : "post", //데이터 전송 요청 방식
					data : {
							"field_name" :	field_name.value,
							"field_addr" :	field_addr.value,
							"field_file" :	field_file.value,
							"field_memo" :	field_memo.value
							},
					url : "fieldUpdateService", //데이터를 전송, 요청하는 서버 페이지
					dataType : "text", //응답데이터의 형식
					success : function(data){ //통신 성공
						
						if(data=="0"){
							alert('현장 정보 수정을 다시 시도해 주세요.')
							window.location.href = "fieldUpdate.jsp"; 
						}else{
							
							alert('현장 정보 수정 완료되었습니다.')
							window.location.href = "fieldlist.jsp"; 
						}
					},
					error : function(){ //통신 실패
					}
				});
			}
			</script>
			<script>
	
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