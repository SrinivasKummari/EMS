<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/Css/login.css"/>
<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/Css/Skyrim.css"/>
</head>
<!-- <body style="background-image: url('schools7.jpg');"> -->
<body>
	<div style="border: 0px solid white;background-color: transparent;height: 100px; color: white;">
<h2 align="center">A.P.Residential School, Hyderabad</h2>
<h3 style="margin-left: 500px;">Andhra Pradesh, India 									
<b style="margin-left: 300px;">	[Hello <% String str=session.getAttribute("uname")!=null?session.getAttribute("uname").toString():null; %><%= str %>!]<a style="color: white;margin-left: 10px;" href="${pageContext.request.contextPath}/Common/Logout.jsp">logout</a></b></h3>
 
 </div>

<% String userName=(String)session.getAttribute("uname");
if(userName!=null){
%>
<!-- navigation div starting-->
    <div id="navigation" class="navigation">
        <div id="navMenu">
    <ul id="menu">
        <ul>
            <li><a href="${pageContext.request.contextPath}/Common/Home.jsp">Home</a></li>
        </ul>
       
        <ul>   
            <li><a href="">Student Admission</a>
                <ul>
                <li><a href="${pageContext.request.contextPath}/Student/Admission.jsp">Single Student</a></li>
                <li><a href="${pageContext.request.contextPath}/Student/BulkAdmission.jsp">Multiple Students</a></li>
                </ul>
               
            </li>
        </ul>
       
        <ul>   
            <li><a href="${pageContext.request.contextPath}/Student/EditInfo.jsp">Student Edition</a></li>
        </ul>
       
       
        <ul>           
            <li><a href="${pageContext.request.contextPath}/Student/inquiry.jsp">Student Inquiry</a>
            </li>
        </ul>
       
        <ul>           
            <li><a href="${pageContext.request.contextPath}/Faculty/FacultyAdmission.jsp">Faculty Admission</a>
            </li>
        </ul>
        
        <ul>           
            <li><a href="${pageContext.request.contextPath}/Faculty/FacultyEdition.jsp">Faculty Edition</a>
            </li>
        </ul>
       
        <ul>   
            <li><a href="#">Student Attendance</a>
                <ul>
                <li><a href="${pageContext.request.contextPath}/Student/Attendance.jsp">Entry</a></li>
                <li><a href="${pageContext.request.contextPath}/Student/">Edition</a></li>
                </ul>
               
            </li>
        </ul>
       
        <ul>   
            <li><a href="#">Student Marks</a>
                <ul>
                <li><a href="${pageContext.request.contextPath}/Student/Marksupload.jsp">Through File</a></li>
                <li><a href="#">Through File</a></li>
                </ul>
               
            </li>
           
        </ul>
        
         <ul>           
            <li><a href="${pageContext.request.contextPath}/Student/EditConduct.jsp">Update Conduct</a>
            </li>
        </ul>
        
         <ul>           
            <li><a href="${pageContext.request.contextPath}/Common/ChangePassword.jsp">Change Password</a>
            </li>
        </ul>
    </ul>
        <br class="clearFloat"/>
        </div><!--div navMenu ending  -->
    </div> <!-- navigation div ending-->
        <!-- content div starting-->
       
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


