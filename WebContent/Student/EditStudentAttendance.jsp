<%@page import="java.util.Date"%>
<%@page import="com.demo.dao.AttendanceDao" %>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../datetimepicker.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/login.css">
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
<body>
<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

        <!-- content div starting-->
   
   
    <div id="content"  class="content" >
           <%
                   
                    if(request.getParameter("id")==null){%>
                    <fieldset  id="fieldHead">Edit Student Information</fieldset>
                    <form action="EditStudentAttendance.jsp" method="post"><br>
                  <label class="label" for="id"><span>*</span> Student Id : </label><input type="text" class="inputLogin" name="id">
                  <label class="label" for="date"><span>*</span>Choose Date : </label><input id="date" type="text" class="inputLogin" name="date">
                    <a href="javascript:NewCal('date','ddmmyyyy')"><img src="../Images/calen.png" style=" width: 20px; height: 20px ; "  alt="Pick a date"></a><br><br>
                    <input type="submit" class="submitLogin" style="margin-left: 190px;" value="Go"><br><br>
                    </form>
                   <%} %>
                    <%
                   
                    if(request.getParameter("id")!=null &&request.getParameter("date")!=null){
                        Connection conn =ConnectionProvider.getConnection();
                Integer i=Integer.valueOf(request.getParameter("id"));
                SimpleDateFormat df= new  SimpleDateFormat("dd-mm-yyyy");
                Date date=df.parse(request.getParameter("date").toString());
                session.setAttribute("studentId", i);
                session.setAttribute("date", date);
					String status=AttendanceDao.retriveAttendanceByIdAndDate(i, date, conn);
					System.out.print(status);
                    if(!status.isEmpty()){
				
                    	 session.setAttribute("studentId", i);
                         session.setAttribute("date", date);
         			  %>
                    
                 
                    
                  
                    <fieldset class="fieldList">
                    <form action="UpdateStudentAttendance.jsp">
               <label class="label" for="status"><span>*</span>Status : </label><input id="status" name="status"  type="text" class="inputLogin" value="<%= status %>" required="required"></input>   
             <label  class="label"></label><input class="submitLogin" type="reset"/><input class="submitLogin" style="margin-left: 20px;" type="submit" value="Update"  />
               </fieldset>
            </form>
            <%}else{ %>
                No Such Student
                <%
               
                }
                   
                    }
            else{%>
            Please enter a value
            <%} %>
        </div>
       
        </div>
</body>
</html>