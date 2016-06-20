
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My WebSite for Schools</title>
<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/css/login.css"/>
<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/css/styles.css"/>
<!-- <script type="text/javascript" src="messages.js"></script> -->

<script type="text/javascript">
function activityBox() {
	
	var behav=document.getElementById("activityBox");
	behav.scrolldelay="2000";
	
}</script>
</head>

<body style="">
 	<!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	
	<div id="content"  class="content" >
<b style="left: 80%; right: 0%; position:absolute;font-size: xx-large;">Latest News</b>	             

<div class="activityBox">
<marquee   behavior="scroll"  direction="up" style="height: 100%;" id="activityBox"  onmouseover="activityBox()">Results will be announced Tomorrow<br> <br>Details of Fest<br><br><br><a href="clickMe" style="color:yellow;">CLick here to Know exam Schedule</a><br><br><a href="clickMe" style="color:yellow;">Click here to Enroll for the Sports Competition</a></marquee>


</div>
	
			</div> <!-- content div ending-->
	
	
	<!-- footer div starting -->
			


	 <!-- footer div ending -->
	</div> <!-- container div ending-->

</body>
</html>