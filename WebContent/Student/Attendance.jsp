
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
         <form action="../AttendanceEntry" method="post">
          <label  class="label" ><span>*</span>Grade</label><select id="classname" class="inputs" name="classname">
                                                                     <option>Select</option>
                                                                     <option>Nursery</option>
                                                                     <option>LKG</option>
                                                                     <option>UKG</option>
                                                                     <option>First</option>
                                                                     <option>Second</option>
                                                                     <option>Third</option>
                                                                     <option>Fourth</option>
                                                                     <option>Fifth</option>
                                                                     <option>Sixth</option>
                                                                     <option>Seventh</option>
                                                                     <option>Eighth</option>
                                                                     <option>Ninth</option>
                                                                     <option>Tenth</option>
                                                                     </select>
           <label  class="label"><span>*</span>Section:</label><select id="sectionList" class="inputs" name="section">
                                                                <option>Select</option>
                                                                <option>A</option>
                                                                <option>B</option>
                                                                <option>C</option>
                                                                <option>D</option>
                                                              </select><br/><br/>
                                                             
                                                             
        Choose Date:<input id="demo1" type="text" size="25" name='fromdate'>
        <a id="date" href="javascript:NewCal('demo1','ddmmyyyy')"><img src="../Images/calen.png" style=" width: 20px; height: 20px ; margin-left: 2px; "  alt="Pick a date"></a>
              
                <input type="submit" value="Go">
         
          </form><br/><br/>
      
        </div>
        </div>
</body>
</html>