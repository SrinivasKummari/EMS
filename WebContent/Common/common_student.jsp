<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel='stylesheet' type='text/css' href='../Css/login.css' />
	<link rel='stylesheet' type='text/css' href='../Css/styles.css'/>
	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<script type='text/javascript' src='../Scripts/menu_jquery.js'></script>
</head>
<body>

<div style="border: 0px solid white;background-color: transparent;height: 100px; color: white;">
<h2 align="center">A.P.Residential School, Hyderabad</h2>
<h3 style="margin-left: 580px;">Andhra Pradesh, India 									
<b style="margin-left: 300px;">	[Hello <% String str=session.getAttribute("uname")!=null?session.getAttribute("uname").toString():null; %><%= str %>!]<a style="color: white;margin-left: 10px;" href="${pageContext.request.contextPath}/Common/Logout.jsp">logout</a></b></h3>
 
 </div>

<% String userName=(String)session.getAttribute("uname");
if(userName!=null){
%>
<!-- navigation div starting-->
    <div id="navigation" class="navigation">

<div id="navMenu">
<div id='cssmenu'>
<ul>
   <li class='active'><a href='${pageContext.request.contextPath}/Common/StudentHome.jsp'><span><b>Home</b></span></a></li>
   <li class='has-sub'><a href='${pageContext.request.contextPath}/Student/inquiry.jsp'><span><b>Student Inquiry</b></span></a></li>
   <li class='has-sub'><a href='${pageContext.request.contextPath}/Common/ChangePassword.jsp'><span><b>Change Password</b></span></a></li>
   
</ul>
</div>
</div>
</div>

        <div class="footerDiv"><b>Web development by Rajasekhar & Srinivas</b>
    </div>
    <%}
else{
	
%>

<%
session.setAttribute("error", "You need to login  to view this page");
request.getRequestDispatcher("../Login/Index.jsp").forward(request, response);
}
%>

</body>
</html>