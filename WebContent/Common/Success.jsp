<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My WebSite for Schools</title>
<!-- <link rel="stylesheet" type=text/css href="layout.css"/> -->
<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/Css/login.css"/>
<link rel='stylesheet' type='text/css' href='../Css/styles.css'/>
<!-- <script type="text/javascript" src="messages.js"></script> -->

</head>
<body style="background-image: url('../Images/schools7.jpg');">
 	<!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="${pageContext.request.contextPath}/../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="${pageContext.request.contextPath}/../Common/common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	<div id="content"  class="content" >
			
					<fieldset class="fieldHead"><%=session.getAttribute("msg") %></fieldset>

	</div> <!-- content div ending-->
	

	
	<!-- footer div starting -->
			


	 <!-- footer div ending -->
	</div> <!-- container div ending-->

</body>
</html>