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
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
	  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
   </head>
   <style>
	   .section{
			position: relative;
	   }
	   .article {
		   position: relative;
	   }
	   .posts{
			position: relative;
	   }
      table .ttbody{
         position: relative;
         vertical-align: middle;
      }
      .switch-button { position: relative; display: inline-block; width: 55px; height: 30px; } 
      .switch-button input { opacity: 0; width: 0; height: 0; } 
      .switch-button input:checked + .onoff-switch { background-color: #F2D522; box-shadow: inset 1px 5px 1px #E3AE56; } 
      .switch-button input:checked + .onoff-switch:before { -webkit-transform: translateX(26px); -ms-transform: translateX(26px); transform: translateX(26px); }
      .onoff-switch { position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; border-radius:20px; background-color: #ccc; box-shadow: inset 1px 5px 1px #999; -webkit-transition: .4s; transition: .4s; } 
      .onoff-switch:before { position: absolute; content: ""; height: 22px; width: 22px; left: 4px; bottom: 4px; background-color: #fff; -webkit-transition: .5s; transition: .4s; border-radius:20px; }
      .onoff-switch {
			display: inline-block;
			} 
   </style>
   
   <body class="is-preload">	
      <!-- Wrapper -->
     		 <%
			//현재 로그인 상태인지 확인 (vo == null > 로그인 하지 않은 상태)
			adminVO vo = (adminVO)session.getAttribute("admin");
			adminDAO dao = new adminDAO();
			%>
         <div id="wrapper">
            
            <!-- Main -->
               <div id="main">
                  <div class="inner">

                     <!-- Header -->
                        <header id="header">
                           <a href="sensorValue.jsp" class="logo" style="font-size: 20px;"><strong>현장명</strong>  <br> 현장 주소</a>
                           
                           <ul class="icons">
                              
                              <li><a href="notice.jsp" class="logo"><span class="label"><strong>경고발생현황</strong></span></a></li>
                              <li><a href="board_list.jsp".html" class="logo"><span class="label">관리일지</span></a></li>
                               
                              
                           </ul>
                        </header>                                  
                                    
                     	<!-- Section -->
								<section class="section">
									<!-- <header class="major">
										<h2>관리 현장 목록</h2>
									</header> -->
									<div class="posts">
										<article class="article">
											
											<h3>SAFEBOX ID</h3>
											<label class="switch-button"><input type="checkbox"/> <div class="onoff-switch"></div> </label>
											<p>기기 위치</p>
													<div class="table-wrapper">
														
																
                                                <table>
                                                   <thead>
                                                      <tr>
                                                         <th>센서 ID</th>
                                                         
                                                         <th>기기상태</th>
                                                         <th>기준농도</th>
                                                         <th>현재농도</th>
                                                         <th>측정주기</th>
                                                         <th>설정변경</th>
      
                                                      </tr>
                                                   </thead>
                                                   <tbody  class="ttbody">
                                                      <tr>
                                                         <td >Item1</td>
                                                         
                                                         <td style="vertical-align:middle;"><img src="images/비정상동그라미.png" ></td>
                                                         <td></td>
                                                         <td></td>
                                                         <td></td>
                                                         <td><form action="sensorManage.jsp"><input type="submit" value="설정"></form></td>											
                                                      </tr>
																
																
																
															</tbody>
															
														</table>
													</div>
											
										</article>
                             
													
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

   </body>
</html>