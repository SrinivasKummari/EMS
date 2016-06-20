<%@page import="java.text.DecimalFormat"%>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type=text/css href="login.css"/>
<link rel="stylesheet" type=text/css href="../Css/table.css"/>
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
   
   
   <%  
	try{
	
	List<Student> students1 =(List<Student>)session.getAttribute("students");
	List<Exam> exams1=	(List<Exam>)session.getAttribute("exams");
	System.out.println("qwerty"+students1.size());
	System.out.println(request.getParameter("examdesc"));
	Integer examId=null;
	for(Exam e:exams1){
		System.out.println("in for..");
		if(e.getDesc().equals(request.getParameter("examdesc"))){
			System.out.println("in iff...");
			examId=e.getExamId();
			
		}
	}
  System.out.println("examId-----"+examId);
  
 
	Connection conn =ConnectionProvider.getConnection();
	%>
	 <table style="padding-top: 5px;padding-left: 10px;">
	    <tr><th>Student Id </th>
	    <th>Name </th>
	    <%if(students1!=null){
	    	ResultSet rs = ResultsDao.retriveDataByStudentExamId(students1.get(0).getStudentId(), examId, conn);
	    	
	    	 
	    		while(rs.next()){
	    		
	    		%>
	    		

	    	        <th><%=rs.getString(2) %></th>
	    	       
	    	  
	    		


	    	<%}
	    	    %><th>Total  </th><th>CGPA </th>  </tr><%
	    	}
	    
	    %>
	     <%
	for(Student s:students1){
		 System.out.println("studentId-----"+s.getStudentId());		
		
		ResultSet rs1 = ResultsDao.retriveDataByStudentExamId(s.getStudentId(), examId, conn);
		System.out.print("rs--"+rs1);
		%>	  
	
   <%
    int cnt=1;
    int totalMarks=0;
    while(rs1.next()){
    	if(cnt==1){
    		 %><tr><td><%=rs1.getString(1) %></td><td><%=rs1.getString(5) %></td><%
   cnt++;    	}
    	totalMarks=totalMarks+Integer.valueOf(rs1.getString(3));
    	%>  <td><%=rs1.getString(3) %></td><%
    }%>
    <td><%=totalMarks %></td><td><%= new DecimalFormat("#.##").format((totalMarks/1.50)) %></td></tr><%
	}
	}
catch(Exception e){
	
}

%>
  
</table>
  </div> 
</div>


</body>
</html>