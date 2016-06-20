<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="${pageContext.request.contextPath}/../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="${pageContext.request.contextPath}/../Common/common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	<div id="content"  class="content" >
			



<% out.print(session.getAttribute("error"));
String msg = request.getAttribute("error")!=null?request.getAttribute("error").toString():null;
if (msg != null) {
			    %><p style="color:red;position:absolute;"><%= msg %></p><%
			}%>
</div>
</div>
</body>
</html>