<%@page import="java.sql.ResultSet"%>
<%@page import="com.demo.dao.ResultsDao"%>
<%@page import="com.demo.dto.Results"%>
<%@page import="com.demo.dao.AttendanceDao"%>
<%@page import="com.demo.dto.Attendance"%>
<%@page import="com.demo.util.ExtendDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.demo.dao.StudentDao"%>
<%@page import="com.demo.dto.Student"%>
<%@page import="com.demo.dao.StudentClassDao"%>
<%@page import="com.demo.dto.StudentClass"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.ClassRoomDao"%>
<%@page import="com.demo.dto.ClassRoom"%>
<%@page import="com.demo.dto.Exam"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type=text/css href="login.css"/>
<script type="text/javascript" src="../datetimepicker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" >
new MY.DatePicker({
    input: 'arrivalDt',
    format: 'dd-MMM-yyyy',
    initialText : '22-June-2011',
    validate: function(value, errors) {
        if (value != null && value.isAfter(new Date())) {
            errors.push('Selected date is after current');
            return false;
        }
        return true;
    }
});

</script>

</head>
<!-- <body style="background-image: url('/schools7.jpg');"> -->
<body>
     <!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

        <!-- content div starting-->
   
   
    <div id="content"  class="content" >
    
<%  if(request.getParameter("Second")==null){
List<Student> students =(List<Student>)session.getAttribute("students");
List<Exam> exams = (List<Exam>)session.getAttribute("exams");
if(true){
	//!(students.size()==0)
%> <form action="ClassMarksDisplay1.jsp" method="post">
	 <label  class="label"><span>*</span>Choose Exam :</label><select id="sectionList" class="inputs" name="examdesc">
	 <option>Select</option>
	 <%
for(Exam exam : exams){
	
%>    <option><%=exam.getDesc() %></option>
      
      
<%
}
}else{
	%>
	No Students in this class 
<%} %>

</select><br/><br/>
<input type="hidden" name="Second" value="Second" />

<input type="submit" value="Show"> 
<% request.setAttribute("students1", students);
request.setAttribute("exams1",exams); %>

</form>
<%

} %>


 </div>
        </div>
</body>
</html>