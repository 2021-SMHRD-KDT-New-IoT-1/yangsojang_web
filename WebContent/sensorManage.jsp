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
		<script src="jquery-3.6.0.min.js"></script>
	</head>
	<style>
		#chartdiv {
		  width: 100%;
		  height: 100px;
		}
		</style>
		
		<!-- Resources -->
		<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
		<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
		<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
		
		<!-- Chart code -->
		<script>
		am5.ready(function() {
		
		// Create root element
		// https://www.amcharts.com/docs/v5/getting-started/#Root_element
		var root = am5.Root.new("chartdiv");
		
		
		// Set themes
		// https://www.amcharts.com/docs/v5/concepts/themes/
		root.setThemes([
		  am5themes_Animated.new(root)
		]);
		
		
		// Create chart
		// https://www.amcharts.com/docs/v5/charts/xy-chart/
		var chart = root.container.children.push(am5xy.XYChart.new(root, {
		  panX: false,
		  panY: false,
		  layout: root.verticalLayout
		}));
		
		
		// Add legend
		// https://www.amcharts.com/docs/v5/charts/xy-chart/legend-xy-series/
		var legend = chart.children.push(
		  am5.Legend.new(root, {
			centerX: am5.p50,
			x: am5.p50
		  })
		);
		
		var data = [{
		  category: "",
		  from: 0,
		  to: 15,
		  name: "매우 좋음",
		  columnSettings: {
			fill: am5.color(0x0ca948)
		  }
		}, {
		  category: "",
		  from: 15,
		  to: 50,
		  name: "양호",
		  columnSettings: {
			fill: am5.color(0x93da49)
		  }
		}, {
		  category: "",
		  from: 50,
		  to: 90,
		  name: "경계",
		  columnSettings: {
			fill: am5.color(0xffd100)
		  }
		}, {
		  category: "",
		  from: 90,
		  to: 95,
		  name: "나쁨",
		  columnSettings: {
			fill: am5.color(0xcd213b)
		  }
		}, {
		  category: "",
		  from: 95,
		  to: 100,
		  name: "매우 나쁨",
		  columnSettings: {
			fill: am5.color(0x9e9e9e)
		  }
		}];
		
		
		// Create axes
		// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
		var yAxis = chart.yAxes.push(am5xy.CategoryAxis.new(root, {
		  categoryField: "category",
		  renderer: am5xy.AxisRendererY.new(root, {})
		}));
		yAxis.data.setAll([{ category: "" }]);
		
		
		var xAxis = chart.xAxes.push(am5xy.ValueAxis.new(root, {
		  min: 0,
		  max: 100,
		  numberFormat: "#'%'",
		  renderer: am5xy.AxisRendererX.new(root, {})
		}));
		
		xAxis.get("renderer").labels.template.set("forceHidden", true);
		
		
		// Add series
		// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
		var series = chart.series.push(am5xy.ColumnSeries.new(root, {
		  xAxis: xAxis,
		  yAxis: yAxis,
		  valueXField: "to",
		  openValueXField: "from",
		  categoryYField: "category",
		  categoryXField: "name"
		}));
		
		series.columns.template.setAll({
		  strokeWidth: 0,
		  strokeOpacity: 0,
		  height: am5.percent(100),
		  templateField: "columnSettings"
		});
		
		series.data.setAll(data);
		
		// Create axis ranges for each column
		// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/axis-ranges/
		for(var i = 0; i < data.length; i++) {
		  var rangeDataItem = xAxis.makeDataItem({
			value: data[i].from
		  });
		  
		  var range = xAxis.createAxisRange(rangeDataItem);
		  
		  rangeDataItem.get("grid").set("forceHidden", true);
		  
		  rangeDataItem.get("tick").setAll({
			visible: true,
			length: 18,
			strokeOpacity: 0.2
		  });
		  
		  rangeDataItem.get("label").setAll({
			centerX: am5.p0,
			forceHidden: false,
			fontSize: 10,
			text: data[i].from + "ppm"
		  });
		}
		
		// Add legend
		// https://www.amcharts.com/docs/v5/charts/xy-chart/legend-xy-series/
		var legend = chart.children.push(am5.Legend.new(root, {
		  nameField: "categoryX",
		  centerX: am5.percent(50),
		  x: am5.percent(50),
		  clickTarget: "none"
		}));
		
		legend.markerRectangles.template.setAll({
		  strokeOpacity: 0
		});
		
		legend.data.setAll(series.dataItems);
		
		
		// Make stuff animate on load
		// https://www.amcharts.com/docs/v5/concepts/animations/
		series.appear();
		chart.appear(1000, 100);
		
		}); // end am5.ready()
		</script>
	<style>
		.form-range{
			background-color: #0d0d0d;
			width: 100%;
			height: 0.2rem;
			cursor: pointer;
			border-radius: 1rem;
			box-shadow: inset;
			position: relative;
			
		}

		.set1{
			position: relative;
			width: 30%;
			height : 100
		}
		.set2{
			position: relative;
			width: 30%;
			margin-left: 100px;
			
		}  

		#section{
			text-align: center;
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
									<a href="sensorManage.html" class="logo" style="font-size: 20px;"><strong>Sensor Set</strong> Update</a>
									
								</header>

							<!-- Content -->
								<section >
									<!-- <header class="main">
										<h1></h1>
									</header> -->
									
										<div id="chartdiv"></div>
								
									<BR><BR>
									<!-- <span class="image main"><img src="images/pic11.jpg" alt="" /></span> -->
									<div class="row gtr-uniform" >
										<div class="col-6 col-12-xsmall" style="text-align: center;">
											<input type="text" name="demo-id" id="demo-name" value="" placeholder="현재 설정된 기준농도 : 10ppm  /  수정할 기준농도 입력" />
										</div>
										<div class="col-6 col-12-xsmall" style="text-align: center;">
											<input type="text" name="demo-pw" id="demo-email" value="" placeholder="현재 설정된 측정주기 : 10초  /  수정할 측정주기 입력" />
										</div>
											
									</div>
										<BR>
										<ul class="actions" style="text-align: center;">
										<li><input type="submit" value="Update" class="primary" style="margin-right: 10PX;"/><input type="reset" value="Reset" style="margin-left: 10px;"></li>
										</ul>
                                        

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

	</body>
</html>