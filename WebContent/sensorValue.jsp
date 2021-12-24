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
      //���� �α��� �������� Ȯ�� (vo == null > �α��� ���� ���� ����)
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

                  <li><a href="notice.jsp" class="logo"><span class="label"><strong>���߻���Ȳ</strong></span></a></li>
                  <li><a href="board_list.jsp" class="logo"><span
                        class="label">��������</span></a></li>
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
                              <img src="images/�����󵿱׶��.png">
                           </div>
                           <div class="col-4">
                              <h3><%=vo2_safebox.getDevice_seq()%>.
                                 <%=vo2_safebox.getDevice_id()%></h3>
                           </div>
                           <br> <br> <br>
                           <div>
                              <h4>��� ��ġ</h4>
                              <p>��ġ�� �־��ּ���</p>
                              <script type="text/javascript">
                        var selectBoxChange = function(){
                           var value = $("#changeInput").val(); 
                           console.log("�������׽�Ʈ : " + value);
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
                              
                           alert("����Ǿ����ϴ�");
                        }
                        </script>

                              </script>
                              <strong>���� �ֱ� :</strong> <span id="iter">1</span>

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
                                          <input type="button" id="" value="Ȯ��" class="primary"
                                             onclick="selectSubmit()">
                                       </div>


                                       <div class="container">
                                          <div class="animations-container">
                                             <h3>SAFE BOX ���� ����</h3>
                                             <div class="toggle toggle--on-off">
                                                <div class="toggle__switch">
                                                   <input class="toggle__checkbox" id="toggle1"
                                                      type="checkbox" name="toggle1" checked="" /><span
                                                      class="toggle__handle"></span><span
                                                      class="toggle__backdrop"></span>
                                                </div>
                                                <label class="toggle__label" for="toggle1"><p>����
                                                      ���ǻ����� �����ִ�. ���ǻ����� ����� ���� �� �� ���� Ŭ���� �ּ���.</p></label>
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
                                 <th>�����̸�</th>
                                 <th>���س�</th>
                                 <th>�����</th>
                                 <th>��������</th>

                              </tr>
                           </thead>
                           <tbody class="ttbody">
                              <tr>
                                 <td id="id">�µ�</td>
                                 <td id="std"></td>
                                 <td id="cur"></td>
                                 <td><form action="sensorManage.jsp">
                                       <input type="submit" value="����">
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
                  <li><a href="login.jsp">�α���</a></li>
                  <li><a href="adminDelete.jsp">ȸ��Ż��</a></li>
                  <%
                     } else {
                  %>

                  <li><a href="mypage.jsp">ȸ����������</a></li>

                  <li><a href="logoutServlet" class="logo">�α׾ƿ�</a></li>
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
                  <h2>���� ���� �޴�</h2>
               </header>
               <ul>
                  <li><a href="fieldlist.jsp">���� ��� </a></li>
                  <li><a href="board_list.jsp">���� ����</a></li>
                  <li><a href="notice.jsp">��� �߻� ��Ȳ</a></li>


               </ul>
            </nav>
            <%
               } else {
            %>
            <nav id="menu">
               <header class="major">
                  <h2>���� ���� �޴�</h2>
               </header>
               <ul>
                  <li><a href="#">�α����� �ʿ��մϴ�. </a></li>



               </ul>
            </nav>
            <%
               }
            %>



            <!-- Section -->
            <section>
               <header class="major">
                  <h2>�� ����</h2>
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
                  <li class="icon solid fa-envelope">�̸���</li>
                  <li class="icon solid fa-phone">��ȭ��ȣ</li>
                  <li class="icon solid fa-home">�Ҽ�</li>
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
               /* data : {"email" : input.value}, //�����ϴ� ������ */
               url : "Getsensor", //�����͸� ����, ��û�ϴ� ���� ������
               dataType : "json", //���䵥������ ����
               success : function(data){ //��� ����
                  /* alert(data) */
                  
                  let result =[];
                  let i = 0;
                  for(i=0;i<data.length;i++){
                     result = JSON.parse(data[i]);
                  }
                  
                 
                  
                  
                  var storeAdd = "<tr>" + "<td>" +"�µ�" + "</td>"+"<td>"+result.Temp+"</td>" + "<td>"+result.Humidity+"</td>" + "<td>"+"<form>"+
                  "<input type= submit value=����>" +"</form>"+"</td>"+"</tr>";
                
                 $("#std").text(result.Temp);
                $("#cur").text(result.Humidity);
            
            
            


                  //console.log(result[i].temp);
                  console.log(result);
                  console.log(result.Temp);
                  console.log(result.Humidity);
                  //result[i].temp �迭�ȿ� temp���� ������ ���°�
                  
               
               },
               error : function(){ //��� ����
               
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
               let check = confirm("�������  ���� ��Ȳ�� Ȯ�����ּ���!!  �������");
               if(check){
                  window.location.href = "notice.jsp";
                  
               }                     
            }
         },
         error : function(){ //��� ����
         }
      });
      
        $.ajax({
         type : "get", 
         url : "transeService", 
         dataType : "text",
         data : {'data' : '��� ����'},
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