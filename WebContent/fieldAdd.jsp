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
									<a href="fieldAdd.html" class="logo" style="font-size: 20px;"><strong>현장 추가 </strong></a>
									
								</header>

							<!-- Content -->
								<section>
									<!-- <header class="main">
										<h1></h1>
									</header> -->

									<!-- <span class="image main"><img src="images/pic11.jpg" alt="" /></span> -->

									<form method="post" action="fieldAddAction.jsp">
                                        <div class="row gtr-uniform">
                                            <div class="row gtr-uniform">
                                                <div class="col-6 col-12-xsmall"> 
                                               
                                                    <input type="text" name="fieldName" id="demo-name" value="" placeholder="현장명" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="fieldAddr" id="demo-email" value="" placeholder="주소" />
                                                </div>
                                                <div class="col-12">
                                                    <textarea name="fieldMemo" id="demo-message" placeholder="메모" rows="6"></textarea>
                                                </div>
                                                <!-- <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="demo-id" id="demo-name" value="" placeholder="아이디" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="password" name="demo-pw" id="demo-email" value="" placeholder="비밀번호" />
                                                </div>
                                                <div class="col-6 col-12-xsmall">
                                                    <input type="text" name="demo-phone" id="demo-email" value="" placeholder="전화번호" />
                                                </div> -->
                                            <!-- Break -->
                                            <!-- <div class="col-12">
                                                <select name="demo-category" id="demo-category">
                                                    <option value="">- 소속 -</option>
                                                    <option value="1">Manufacturing</option>
                                                    <option value="1">Shipping</option>
                                                    <option value="1">Administration</option>
                                                    <option value="1">Human Resources</option>
                                                </select>
                                            </div> -->
                                            <!-- Break -->
                                            <!-- <div class="col-4 col-12-small">
                                                <input type="radio" id="demo-priority-low" name="demo-priority" checked>
                                                <label for="demo-priority-low">Low</label>
                                            </div>
                                            <div class="col-4 col-12-small">
                                                <input type="radio" id="demo-priority-normal" name="demo-priority">
                                                <label for="demo-priority-normal">Normal</label>
                                            </div>
                                            <div class="col-4 col-12-small">
                                                <input type="radio" id="demo-priority-high" name="demo-priority">
                                                <label for="demo-priority-high">High</label>
                                            </div> -->
                                            <!-- Break -->
                                            <!-- <div class="col-6 col-12-small">
                                                <input type="checkbox" id="demo-copy" name="demo-copy">
                                                <label for="demo-copy">Email me a copy</label>
                                            </div>
                                            <div class="col-6 col-12-small">
                                                <input type="checkbox" id="demo-human" name="demo-human" checked>
                                                <label for="demo-human">I am a human</label>
                                            </div> -->
                                            <!-- Break -->
                                            <!-- <div class="col-12">
                                                <textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
                                            </div> -->
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