<%@page import="com.model.safeboxVO"%>
<%@page import="com.model.safeboxDAO"%>
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

   fieldVO fieldvo = (fieldVO) session.getAttribute("fieldvo_session");

   int field_seq_session = (int) session.getAttribute("field_seq_session_");
   safeboxDAO safeboxdao = new safeboxDAO();
   ArrayList<safeboxVO> safebox_array_all = safeboxdao.safeboxAllList(field_seq_session);
   %>
   <div id="wrapper">
      <div id="main">
         <div class="inner">
            <header id="header">
               <a href="#" class="logo" style="font-size: 20px;"><strong><%=fieldvo.getField_name()%></strong><br><%=fieldvo.getField_addr()%></a>

               <ul class="icons">

                  <li><a href="notice.jsp" class="logo"><span class="label"><strong>경고발생현황</strong></span></a></li>
                  <li><a href="board_list.jsp" class="logo"><span
                        class="label">관리일지</span></a></li>
               </ul>
            </header>


            <!-- <section class="banner" style="width: 45%; padding-top: 10px"> -->
            <section>
               <div class="posts">
                  <%
                     for (safeboxVO vo2_safebox : safebox_array_all) {
                  %>
                  <article>
                     <div class="box" style="display: inline-block;; margin-top: 1px">
                        <div class="row">
                           <div class="col-2">
                              <img src="images/비정상동그라미.png">
                           </div>
                           <div class="col-4">
                              <h3><%=vo2_safebox.getDevice_seq()%>.
                                 <%=vo2_safebox.getDevice_id()%></h3>
                           </div>
                           <br> <br> <br>
                           <div>
                              <h4>기기 위치</h4>
                              <p>위치를 넣어주세요</p>
                              <script type="text/javascript">
                        var selectBoxChange = function(){
                           var value = $("#changeInput").val(); 
                           console.log("값변경테스트 : " + value);
                           $("#iter").text(value);
                        }
                        var selectSubmit = function(){
                           var value = $("#changeInput").val(); 
                           $.ajax({
                              type:"get",
                              data:{
                                 num:value
                              },
                              url:"mqtt_pub_sub"
                              })
                              
                           alert("변경되었습니다");
                        }
                        </script>

                              </script>
                              <strong>측정 주기 :</strong> <span id="iter">1</span>

                              <p><%=vo2_safebox.getDevice_location()%></p>


                              <div style="padding-top: 20px">
                                 <form method="get" action="mqtt_pub_sub">
                                    <div class="row">
                                       <div class="col-6">
                                          <select name=num onchange="selectBoxChange();"
                                             id="changeInput">
                                             <option value="1">1</option>
                                             <option value="2">2</option>
                                             <option value="3">3</option>
                                             <option value="4">4</option>
                                             <option value="5">5</option>
                                             <option value="6">6</option>
                                             <option value="7">7</option>
                                             <option value="8">8</option>
                                             <option value="9">9</option>
                                             <option value="10">10</option>
                                          </select>
                                       </div>
                                       <div class="col-6">
                                          <input type="button" id="" value="확인" class="primary"
                                             onclick="selectSubmit()">
                                       </div>


                                       <div class="container">
                                          <div class="animations-container">
                                             <h3>SAFE BOX 동작 제어</h3>
                                             <div class="toggle toggle--on-off">
                                                <div class="toggle__switch">
                                                   <input class="toggle__checkbox" id="toggle1"
                                                      type="checkbox" name="toggle1" checked="" /><span
                                                      class="toggle__handle"></span><span
                                                      class="toggle__backdrop"></span>
                                                </div>
                                                <label class="toggle__label" for="toggle1"><p>무언가
                                                      주의사항이 써져있다. 주의사항을 충분히 읽은 후 이 곳을 클릭해 주세요.</p></label>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                              </div>



                           </div>

                        </div>


                     </div>






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
                                 <td id="id">온도</td>
                                 <td id="std"></td>
                                 <td id="cur"></td>
                                 <td><form action="sensorManage.jsp">
                                       <input type="submit" value="설정">
                                    </form></td>
                              </tr>
                           </tbody>

                        </table>
                     </div>

                  </article>
                  <%
                     }
                  %>
               </div>
            </section>

            <!-- <section class="banner"></section> -->

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

   <script type="text/javascript">
      function gascheck() {   
         setInterval(() => {
            
            $.ajax({
               type : "get",
               /* data : {"email" : input.value}, //전송하는 데이터 */
               url : "Getsensor", //데이터를 전송, 요청하는 서버 페이지
               dataType : "json", //응답데이터의 형식
               success : function(data){ //통신 성공
                  /* alert(data) */
                  
                  let result =[];
                  let i = 0;
                  for(i=0;i<data.length;i++){
                     result = JSON.parse(data[i]);
                  }
                  
                 
                  
                  
                  var storeAdd = "<tr>" + "<td>" +"온도" + "</td>"+"<td>"+result.Temp+"</td>" + "<td>"+result.Humidity+"</td>" + "<td>"+"<form>"+
                  "<input type= submit value=설정>" +"</form>"+"</td>"+"</tr>";
                
                 $("#std").text(result.Temp);
                $("#cur").text(result.Humidity);
            
            
            


                  //console.log(result[i].temp);
                  console.log(result);
                  console.log(result.Temp);
                  console.log(result.Humidity);
                  //result[i].temp 배열안에 temp값을 가지고 오는거
                  
               
               },
               error : function(){ //통신 실패
               
               }
            });
            
            
         }, 1000);
         
      }
      gascheck();
      
   </script>

   <script>
var test;
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