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
   <li class='active'><a href='${pageContext.request.contextPath}/Common/Home.jsp'><span><b>Home</b></span></a></li>
   <li class='has-sub'><a href='#'><span>Student Admission</span></a>
      <ul>
         <li><a href='${pageContext.request.contextPath}/Student/Admission.jsp'><span><b>Single Student</b></span></a></li>
         <li class='last'><a href='${pageContext.request.contextPath}/Student/BulkAdmission.jsp'><span><b>Multiple Students</b></span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='${pageContext.request.contextPath}/Student/EditInfo.jsp'><span><b>Student Edition</b></span></a></li>
   
   <li class='has-sub'><a href='${pageContext.request.contextPath}/Student/inquiry.jsp'><span><b>Student Inquiry</b></span></a></li>
   
   <li class='has-sub'><a href='${pageContext.request.contextPath}/Faculty/FacultyAdmission.jsp'><span><b>Faculty Admission</b></span></a></li>
   
   <li class='has-sub'><a href='${pageContext.request.contextPath}/Faculty/FacultyEdition.jsp'><span><b>Faculty Edition</b></span></a></li>
   
   <li class='has-sub'><a href='#'><span><b>Student Attendance</b></span></a>
      <ul>
         <li><a href='${pageContext.request.contextPath}/Student/Attendance.jsp'><span><b>Entry</b></span></a></li>
         <li class='last'><a href='${pageContext.request.contextPath}/Student/EditStudentAttendance.jsp'><span><b>Edition</b></span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span><b>Student Marks</b></span></a>
      <ul>
         <li><a href='#'><span><b>Through UI</b></span></a></li>
         <li class='last'><a href='${pageContext.request.contextPath}/Student/Marksupload.jsp'><span><b>Through File</b></span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span><b>Library Information</b></span></a>
      <ul>
         <li><a href='${pageContext.request.contextPath}/Student/issueBook.jsp'><span><b>Issue Book</b></span></a></li>
         <li class='last'><a href='${pageContext.request.contextPath}/Student/SubmitBook.jsp'><span><b>Submit Book</b></span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span><b>Transport Information</b></span></a>
      <ul>
         <li><a href='${pageContext.request.contextPath}/Transport/addBus.jsp'><span><b>Add New Bus</b></span></a></li>
         <li class='last'><a href='${pageContext.request.contextPath}/Transport/editStudentBus.jsp'><span><b>Update Student BUs</b></span></a></li>
      </ul>
   </li>
   
   <li class='has-sub'><a href='${pageContext.request.contextPath}/Student/EditConduct.jsp'><span><b>Update Conduct</b></span></a></li>
   
   <li class='has-sub'><a href='${pageContext.request.contextPath}/Student/ClassMarks.jsp'><span><b>Class Marks</b></span></a></li>
   
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