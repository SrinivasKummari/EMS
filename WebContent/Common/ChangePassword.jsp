<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My WebSite for Schools</title>
<!-- <link rel="stylesheet" type=text/css href="layout.css"/> -->
<link rel="stylesheet" type=text/css href="../css/login.css"/>
<link rel="stylesheet" type=text/css href="../messages.css"/>
<!-- <script type="text/javascript" src="messages.js"></script> -->

</head>
<body style="background-image: url('schools7.jpg');">
 	<!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	
	<div id="content"  class="content" >
	<%String msg=session.getAttribute("error")!=null?session.getAttribute("error").toString():null;
	if(msg!=null){
	%>
	<p style="color: red"><%=msg%></p>
	
	<% session.removeAttribute("error");	} %>
	<form action="${pageContext.request.contextPath}/ChangePassword" method="post">	
		<br/><br/>
		<label class="label" >Old Password:</label><input  placeholder="*******" type="password" class="inputLogin" name="oldpassword"><br/><br/>
		<label class="label" >New Password:</label><input   placeholder="*******" type="password" class="inputLogin" name="newpassword"><br/><br/>
		<label class="label">Confirm Password:</label><input   placeholder="*******" type="password" class="inputLogin" name="confirmpassword"><br/><br/>
		<input  type="submit"  class="submitLogin" style="margin-left: 130px;" value="Save">
		</form>
	</div> <!-- content div ending-->
	

	
	<!-- footer div starting -->
			


	 <!-- footer div ending -->
	</div> <!-- container div ending-->

</body>
</html>