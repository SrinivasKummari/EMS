<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>
School Management Services</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/login1.css" />
<script type="text/javascript">
var currentEnabled = null;
function enableElement() {
if (currentEnabled) {
currentEnabled.disabled = true;
}
elem.disabled = false;
currentEnabled = elem;
}
</script>
</head>
<body>
<!-- Container DIvision Starting -->
<div id="container" class="container">

	<div style="border: 0px solid white;background-color: transparent;height: 100px; color: white;">
<h2 align="center">A.P.Residential School, Hyderabad</h2>
<h3 align="center">Andhra Pradesh, India</h3>
</div>

<!--Navigation Division Starting  -->
<div id="navigation" class="navigation">
<div ><h2 style="text-shadow: blue;color: white;margin-left: 30px">Education Management System...</h2>
<p style="color: white;margin-left: 35px">A best site which provides all education services</p></div>
</div>
<!--Navigation Division Ending  -->

<!--Content Division Starting  -->
<div id="content" class="content">

<!--inner content division starting  -->

	<div style="border: 0px solid white;background-color: transparent; height: 488px;">

			<form action="${pageContext.request.contextPath}/ValidateLogin" method="post" name="AdminLogin">
			<%String msg = session.getAttribute("error")!=null?session.getAttribute("error").toString():null;
			if (msg != null) {
			    %><p style="color:red;position:absolute;left:60%"><%= msg %></p><%
			} %>
			<input style="margin-left: 55%;margin-top: 5%" type="radio" id="sel" name="sel" value="Student" required="required"  >Student
			<input style="margin-left: 20%%;" type="radio" name="sel" id="sel" value="Admin" required="required">Administrator <br/>
			<br>
			<label style="margin-left: 40%;"><span>*</span>UserName:</label>
			<input style="margin-left: 3%;" type="text" name="username" id="username" placeholder="name" required="required">
			<label id="errorusername"></label>
			<br><br>
			<label style="margin-left: 40%;"><span>*</span>Password:</label>
			<input style="margin-left: 4%;" type="password" name="pass" placeholder="password" required="required">
			<label id="errorpassword"></label><br><br>
			<input type="submit" style="margin-left: 63%;" value="Login">
			<hidden name="validate" value="1">
			</form>
			</div>
		<!--inner division ending  -->	
</div>
<!--Content Division Ending  -->

<!--Footer Division Starting  -->
<div id="footer" class="footerDiv">
	<div style="border: 0px solid white;background-image:tranparent;height: 55px;">
	<h6 align="center" style="top:20px;">Web Application Developed by Srinivas & Rajasekhar</h6>
	</div>
</div>
<!--Footer Division Ending  -->
</div>
<!--Container Division Ending  -->
</body>
</html>