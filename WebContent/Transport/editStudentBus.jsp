<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.demo.dao.FeeDao" %>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.BusListDao"%>
<%@page import="com.demo.dao.BusRouteDao"%>
<%@page import="com.demo.dao.StudentBusDao"%>
<%@page import="com.demo.dao.StudentDao"%>
<%@ page language="java"
import="java.util.*,com.demo.dto.* "
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My WebSite for Schools</title>
<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/Css/login.css"/>
</head>
<body >
     <!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

        <!-- content div starting-->
   
   
    <div id="content"  class="content" >
           
                               <%
                   
                    if(request.getParameter("id")==null){%>
           
                    <fieldset class="fieldHead">Update student bus information</fieldset>
                    <form action="editStudentBus.jsp" method="post"><br>
                  <label class="label" for="id"><span>*</span> Student Id : </label><input type="text" class="inputLogin" name="id"><br><br>
                    <input type="submit" class="submitLogin" style="margin-left: 190px;" value="Go"><br><br>
                    </form>
                    <%}%><%     
                    
                   
                    if(request.getParameter("id")!=null){
                        Connection conn =ConnectionProvider.getConnection();
                String rollno=request.getParameter("id");
                int i=StudentDao.getStudentId(rollno, conn);
                String stopNo=StudentBusDao.retrieveStopNo(i,conn);
                BusRoute  busRoute = BusRouteDao.retrieveBusInfo(stopNo, conn);
                String routeNo=busRoute.getRouteNo();
                BusList busList=BusListDao.retrieveBusInfo(routeNo, conn);
                                    Student student = StudentDao.retriveInfoForLib(i,conn);
                    if(student!=null){
                 session.setAttribute("studentid", i);
                %>  <%session.setAttribute("student", student); %>
                    
                    <fieldset class="fieldHead">Student Personal Information</fieldset>
                 <fieldset class="fieldList">
                    
                  
                    <img src="../<%=student.getImgSrc()%>" height="133" width="100" style="margin-left: 10px;border: 3px solid #395656;"><br>
                  <b><label class="label" style="position: absolute;top:50px;left:130px;">Student Name</label><label style="position: absolute;top:50px;left:230px; "> <%= ':'+student.getFname() +' '+student.getLname()%></label></b>
                             <b><label class="label" style="position: absolute;top:90px;left:130px;">Student Id</label><label style="position: absolute;top:90px;left:230px; "> <%= ':'+student.getRollNo()%></label></b>
           <%} %></fieldset>
                            
                                <form action="updateStudentBus.jsp">
                
                    <fieldset class="fieldHead"><b>Transport Information</b></fieldset>
                    <fieldset class="fieldList">
                
                
                <br><br>
             <table>
           <tr>
           <td><label class="label">Route Number ::</label><input name="routeNo"  class="inputLogin" value="<%= busRoute.getRouteNo()%>"></td>
           <td><label class="label">Stop Number :</label><input name="stopNo"  class="inputLogin" value="<%=stopNo %>"></td>
           <td><label class="label">Pickup Time :</label><input name="pickTime"  class="inputLogin" value="<%= busRoute.getPickTime() %>"><br><br></td>
           </tr>
           <tr>
           <td> <label class="label">Route Name ::</label><input name="routeName"  class="inputLogin" value="<%= busList.getRouteName() %>"></td>
           <td><label class="label">Stop Name :</label><input name="stopName"  class="inputLogin" value="<%=busRoute.getStopName() %>"></td>
           <td><label class="label">Dropping Time :</label><input name="dropTime"  class="inputLogin" value="<%= busRoute.getDropTime() %>"><br><br></td>
           </tr>
           <tr>
           <td><label class="label">Beginning Point ::</label><input name="beginPoint"  class="inputLogin" value="<%= busList.getBeginPoint() %>"></td>
           <td><label class="label">Destination Point :</label><input name="destinationPoint"  class="inputLogin" value="<%= busList.getDestinationPoint() %>"></td>
           <td><label class="label">Slab For Transport Fee :</label><input name="slabForTransFee"  class="inputLogin" value="<%=busRoute.getSlabForTransFee() %>"><br><br></td>
           </tr>
           <tr>
           <td><label class="label">Contact Number :</label><input name="contactNo"  class="inputLogin" value="<%=busList.getContactNo() %>"></td>
           <td><label class="label">Bus Number :</label><input name="busNo"  class="inputLogin" value="<%=busList.getBusNo() %>"></td>
           </tr>
           </table>
                </fieldset>
                <fieldset class="fieldList">
                <label  class="label"></label><input class="submitLogin" type="reset"/><input class="submitLogin" style="margin-left: 20px;" type="submit" value="Update"  />
                </fieldset>
                </form>
               <% } else{%>
               Please enter a value
               <%} %>    
             </div>
       
        </div>
</body>
</html>