<%@page import="com.demo.dto.Attendance"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.demo.dto.Student" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

  <div id="content"  class="content" >
<%if("markattendance".equals(session.getAttribute("mark"))) {
System.out.println("ids---"+session.getAttribute("students"));
List<Student> students =(List<Student>)session.getAttribute("students");
System.out.println(students.get(0).getFname());
session.setAttribute("students", students);

for(Student s:students){
	
	
%>

<form action="${pageContext.request.contextPath}/Student/SubmitAttendance1.jsp" method="post">
<table>
<tr>
<td><label class="label"><%=s.getStudentId() %></label></td><td><label class="label"><%=s.getFname()+" "+s.getLname() %></label></td>
<td><select name="<%=s.getStudentId() %>"><option>P</option><option>A</option></select></td>


<%
}

%>
</tr>
</table>
<input type="submit" value="Submit">
</form>
<%}
%>
</div>
</div>
</body>
</html>