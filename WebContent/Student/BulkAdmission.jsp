<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My WebSite for Schools</title>
<!-- <link rel="stylesheet" type=text/css href="layout.css"/> -->
<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/css/login.css"/>

<!-- <script type="text/javascript" src="messages.js"></script> -->

</head>
<body style="">
 	<!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	
	<div id="content"  class="content" >
			
			
			<form action="../FileUploadServlet" method="post" enctype="multipart/form-data" >
			
		
        	<div><input size="200" type="file" class="inputs" name="spreadsheet" value="select" /><br/><br/>
        	<input type="hidden" name="admissionfile" value="admission"/>
          <div><input type="submit" class="submit" style="margin-left: 50px;" value="Upload File"><br/></div></div>
        </form><br /><br>
			
			</div> <!-- content div ending-->
	

	
	<!-- footer div starting -->
			


	 <!-- footer div ending -->
	</div> <!-- container div ending-->

</body>
</html>