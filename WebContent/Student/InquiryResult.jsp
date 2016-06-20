<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.demo.dao.AttendanceDao"%>
<%@page import="com.demo.dao.StudentAddressDao"%>
<%@page import="com.demo.dao.AddressDao"%>
<%@page import="com.demo.dao.ClassRoomDao"%>
<%@page import="com.demo.dao.StudentClassDao"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="com.demo.dao.ParentDao"%>
<%@page import="com.demo.dao.StudentDao"%>
<%@page import="com.demo.dao.FeeDao" %>
<%@page import="com.demo.dao.ExamDao" %>
<%@page import="com.demo.dao.ResultsDao" %>
<%@page import="com.demo.dao.StudentBusDao" %>
<%@page import="com.demo.dao.BusRouteDao" %>
<%@page import="com.demo.dao.BusListDao" %>
<%@page language="java"
import="java.util.*,com.demo.dto.* "
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My WebSite for Schools</title>
<!-- <link rel="stylesheet" type=text/css href="layout.css"/> -->
<link rel="stylesheet" type=text/css href="../css/login.css"/>
<link rel="stylesheet" type=text/css href="../css/test.css"/>
<script  type="text/javascript" src="javascript/JSFX_ImageZoom.js"></script>
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
                   
                    if(request.getParameter("stdid")!=null){
 System.out.println(request.getParameter("stdid"));
                    	Connection conn =ConnectionProvider.getConnection();
                    	 String rollno=request.getParameter("stdid");
                         int i=StudentDao.getStudentId(rollno, conn);
                         System.out.print("id for rollno--"+i);
                    List<Student> list = StudentDao.retriveData(i,conn);
                    if(!list.isEmpty()){
                       
                Student st= list.get(0);
               
                    %>
                       <%session.setAttribute("student", st); %>
                       
                        <fieldset class="fieldHead"><b>Student Inquiry</b></fieldset>
<fieldset class="fieldList">                    
                  
                    <img src="../<%=st.getImgSrc()%>" height="133" width="100" style="border-radius:10px; margin-top:4px; margin-bottom:4px; margin-left: 10px;border: 3px solid white;"><br>
                  <b><label class="label" style="position: absolute;top:50px;left:130px;">Student Name</label><label style="position: absolute;top:50px;left:230px; "> <%= ':'+st.getFname() +' '+st.getLname()%></label></b>
                             <b><label class="label" style="position: absolute;top:90px;left:130px;">Student Id</label><label style="position: absolute;top:90px;left:230px; "> <%= ':'+rollno%></label></b>
 </fieldset>              
<fieldset class="fieldList">    
                       <div style="border-color: black; border-left: 12px;border-right: 12px;">
         <img src="../Images/personal.png" style="cursor: pointer; cursor: hand; border-radius:10px; border:5px solid #1947D1;top: 4px;"  id="img1" title="Personal Information" onclick="ValidatePersonalInfo()"/>
         <img  src="../Images/studies.png" style="cursor: pointer; cursor: hand; border-radius:10px; border:5px solid #1947D1;top: 4px;"  id="img2" title ="Class Information" onclick="ValidateClass()"/>
         <img  src="../Images/house.png" style="cursor: pointer; cursor: hand; border-radius:10px; border:5px solid #1947D1;top: 4px;" id="img3" title="Address Information" onclick="ValidateAddress()"/>
         <img  src="../Images/fee.png" style="cursor: pointer; cursor: hand; border-radius:10px; border:5px solid #1947D1;top: 4px;" id="img4" title="Fee Information"onclick="ValidateFee()">
         <img  src="../Images/attendance.png" style="cursor: pointer; cursor: hand; border-radius:10px; border:5px solid #1947D1;top: 4px; " id="img5" title="Attendance Information"onclick="ValidateAttendance()">
         <img  src="../Images/studies1.png" style="cursor: pointer; cursor: hand; border-radius:10px; border:5px solid #1947D1; top: 4px; " id="img6" title="Marks Information"onclick="ValidateMarks()">
		 <img  src="../Images/bus.png" style="cursor: pointer; cursor: hand; border-radius:10px; border:5px solid #1947D1; top: 4px; " id="img7" title="Transport Information"onclick="ValidateTransport()">                    
               </div> 
               </fieldset>
               
 <div id="personal"  style="position: absolute; visibility: hidden; top: 380px;" >

  <fieldset class="fieldHead"><b>Student Information</b></fieldset>
 <fieldset class="fieldList">
         <label class="label">First Name :</label><label class="label"> <%= st.getFname() %></label>
         <label class="label">Last Name :</label><label class="label"><%= st.getLname() %></label>
         <label class="label">Date of Birth  :</label><label class="label"><%=new SimpleDateFormat("dd-MM-yyyy").format(st.getDOB()) %></label><br><br>
         <label class="label">Date Of Join :</label><label class="label"><%= new SimpleDateFormat("dd-MM-yyyy").format(st.getDOJ()) %></label>
         <label class="label">Gender:</label><label class="label"><%= st.getGender() %></label>
         <label class="label">Religion :</label><label class="label"> <%= st.getReligion() %></label><br></br>
         <label class="label">Caste :</label><label class="label"><%=st.getCaste() %></label>
         <label class="label">Phone :</label><label class="label"> <%= st.getPhone() %></label>
         <label class="label">Email :</label><label class="label"><%= st.getEmail() %></label><br><br>
         </fieldset>
         <% Parent pt= ParentDao.retriveData(st.getParent().getParentId(),conn); %>
            <% Fee fee=FeeDao.retriveData(st.getFee().getFeeId(), conn); %>
          
            
            <fieldset class="fieldHead"><b>Parent/Guardian Information</b></fieldset>   
             <fieldset class="fieldList">
         <label class="label">First Name :</label><label class="label"><%= pt.getFirstName() %></label>
         <label class="label">Last Name :</label><label class="label"><%= pt.getLastName() %></label>
         <label class="label">Occupation :</label><label class="label"><%= pt.getOccupation() %></label><br><br>
         <label class="label">Phone :</label><label class="label"><%= pt.getPhone() %></label>
         <label class="label">Relationship :</label><label class="label"><%= pt.getRelation() %></label>
          <label class="label">Email :</label><label class="label"><%= pt.getEmail() %></label><br><br>
           </fieldset>
      </div>       
      <div id="class" style="position: absolute; visibility: hidden;top: 380px;">
            <fieldset class="fieldHead"><b>Class Details</b></fieldset>
            <% StudentClass class1 = StudentClassDao.retrieveData(i, conn);
             ClassRoom room = ClassRoomDao.retriveData(class1.getClassroom().getId(),conn);
            %>
           
              <fieldset class="fieldList">
            <label class="label">Class :</label><label class="label"><%=room.getGradeId() %></label>
            <label class="label">Section :</label><label class="label"><%= room.getSection() %></label>
			<label class="label">Medium :</label><label class="label"><%=st.getMedium() %></label><br><br>
            <label class="label">Second Lang:</label><label class="label"><%= st.getSecondLang() %></label><br><br>
          </fieldset>
           </div>
           
           <div id="fee" style="position: absolute; visibility: hidden;top: 380px;">
            <fieldset class="fieldHead"><b>Fee Information</b></fieldset>

          
            <fieldset class="fieldList">
              <label class="label">Registration Fee :</label><label class="label"><%= fee.getRegFee() %></label>
			  <label class="label">Fee Paid :</label><label class="label"><%= fee.getFeePaid() %></label>
			  <label class="label">Miscellaneous  Fee :</label><label class="label"><%= fee.getMisFee() %></label><br><br>
              <label class="label">Tuition Fee :</label><label class="label"><%= fee.getTutionFee() %></label>
              <label class="label">Total Fee :</label><label class="label"><%= fee.getTotalFee() %></label><br><br>
            </fieldset>
              </div>
              
           <div id="address" style="visibility: hidden; position: absolute; top: 380px;">    
               
                <fieldset class="fieldHead"><b>Mailing Address</b></fieldset>
                
           
                        <% StudentAddress  saddress = StudentAddressDao.retriveData(i, conn);
                          Address address = AddressDao.retriveData(saddress.getAddress().getAddressId(),conn); %>
             <fieldset class="fieldList">
              <label class="label">House No :</label><label class="label"><%= address.getHouseNo() %></label>
              <label class="label">Street :</label><label class="label"><%= address.getStreet() %></label>
			  <label class="label">Locality :</label><label class="label"> <%= address.getLocality() %></label><br><br>
              <label class="label">city :</label><label class="label"><%= address.getCity() %></label>
              <label class="label">State :</label><label class="label"> <%= address.getState() %></label>
              <label class="label">Country :</label><label class="label"><%=address.getCountry() %></label><br><br>
              <label class="label">Zip Code :</label><label class="label"><%= address.getZipCode() %></label><br><br>
          
              
              </fieldset>
           </div>
           
<div id="attendance" style="position: absolute; visibility: hidden;top: 380px;">
		
		<fieldset class="fieldHead"><b>Attendance Information</b></fieldset>
	<fieldset class="fieldList">
		<label class="label">Present Days</label> 
		<label class="label">Working Days</label> 
		<label class="label">Month</label> 
		<label class="label">Present Percent</label> <br><br>
		<% ResultSet rs=AttendanceDao.retriveAttendance(i, conn);
		%>
		
		<% while(rs.next()){ %>
		<label class="label"><%=rs.getInt(1) %></label>
		<label class="label"><%=rs.getInt(2) %></label>
		<label class="label"><%=rs.getString(3) %></label>
		<label class="label"><%=rs.getString(4) %></label><br>
		<%} %>
  	</fieldset>
</div>

<div id="transport" style="visibility: hidden;position: absolute; top: 380px;">    
               
                <fieldset class="fieldHead"><b>Transport Information</b></fieldset>
                
           
 <%    String stopNo=StudentBusDao.retrieveStopNo(i,conn);
       BusRoute  busRoute = BusRouteDao.retrieveBusInfo(stopNo, conn);
       String routeNo=busRoute.getRouteNo();
       BusList busList=BusListDao.retrieveBusInfo(routeNo, conn);
 %>
 <fieldset class="fieldList">
           <table>
           <tr>
           <td><label class="label">Route Number :</label><label class="label"><%= busRoute.getRouteNo() %></label></td>
           <td><label class="label">Stop Number :</label><label class="label"><%=stopNo %></label></td>
           <td><label class="label">Pickup Time :</label><label class="label"><%= busRoute.getPickTime() %></label><br><br></td>
           </tr>
           <tr>
           <td> <label class="label">Route Name :</label><label class="label"><%= busList.getRouteName() %></label></td>
           <td><label class="label">Stop Name :</label><label class="label"><%=busRoute.getStopName() %></label></td>
           <td><label class="label">Dropping Time :</label><label class="label"> <%= busRoute.getDropTime() %></label><br><br></td>
           </tr>
           <tr>
           <td><label class="label">Beginning Point :</label><label class="label"><%= busList.getBeginPoint() %></label></td>
           <td><label class="label">Destination Point :</label><label class="label"> <%= busList.getDestinationPoint() %></label></td>
           <td><label class="label">Slab For Transport Fee :</label><label class="label"><%=busRoute.getSlabForTransFee() %></label><br><br></td>
           </tr>
           <tr>
           <td><label class="label">Contact Number :</label><label class="label"><%=busList.getContactNo() %></label></td>
           <td><label class="label">Bus Number :</label><label class="label"><%=busList.getBusNo() %></label></td>
           </tr>
           </table>
                 </fieldset>
</div>


		<div id="Marks" style="position: absolute; visibility: hidden;top: 380px;">
		<fieldset class="fieldHead"><b>Marks Information</b></fieldset><br>
<%Integer studentId=i; //(Integer)request.getAttribute("stdId");
Integer classId=room.getGradeId(); //(Integer)request.getAttribute("classId");
/*Connection conn = ConnectionProvider.getConnection();*/
List<Exam> exams = ExamDao.retrieveExamsOfClass(classId, conn);
if(!(exams.isEmpty())){
for(Exam exam: exams){
%>  
<fieldset class="fieldList">
 <a><%=exam.getDesc() %></a> <br/>
 <table>
 <tr><td>Subject</td>
 <td>Max Marks</td>
 <td>Marks Secured</td> </tr>
 
 <% ResultSet rs1= ResultsDao.retriveDataByStudentExamId(studentId, exam.getExamId(), conn); 
 if(!(rs1.wasNull())){
 while(rs1.next()){
//	 out.print("in resultset");
	%>
	<tr>
	<td><%=rs1.getString(1)%></td>
	<td><%=rs1.getInt(2) %></td>
     <td><%=rs1.getInt(3) %></td>
	
	
	 </tr>
	 <%
 }
 }else{
 %>
 </table>
 </fieldset>
 Results not found for this student
 
 <%} }
}else{ %>Exams not found related to this class students

<%} %>
     
<%conn.close(); %>

		
		</div>

                  
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
  
  <script type="text/javascript"> 

var personal=document.getElementById("personal");

var clas=document.getElementById("class");
var fee=document.getElementById("fee");
var address=document.getElementById("address");
var attendance=document.getElementById("attendance");
var marks=document.getElementById("Marks");
var transport=document.getElementById("transport");

var imgcolor1=document.getElementById("img1");
var imgcolor2=document.getElementById("img2");
var imgcolor3=document.getElementById("img3");
var imgcolor4=document.getElementById("img4");
var imgcolor5=document.getElementById("img5");
var imgcolor6=document.getElementById("img6");
var imgcolor7=document.getElementById("img7");
function ValidatePersonalInfo() {
	
	
	clas.style.visibility="hidden";
	fee.style.visibility="hidden";
	address.style.visibility="hidden";
	marks.style.visibility="hidden";
	attendance.style.visibility="hidden";
	transport.style.visibility="hidden";
	
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	imgcolor7.style.border="5px solid #1947D1";
	
	if(personal.style.visibility == "hidden") {
        personal.style.visibility = "visible";
        imgcolor1.style.border="5px solid #33AD33";
}
else if(personal.style.visibility=="visible") {
    personal.style.visibility = "hidden";
    imgcolor1.style.border="5px solid #1947D1";
}

}


function ValidateClass() {
	personal.style.visibility="hidden";
	fee.style.visibility="hidden";
	address.style.visibility="hidden";
	attendance.style.visibility="hidden";
	marks.style.visibility="hidden";
	transport.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	imgcolor7.style.border="5px solid #1947D1";
	
	if(clas.style.visibility == "hidden") {
		clas.style.visibility = "visible";
		imgcolor2.style.border="5px solid #33AD33";
	}
else if(clas.style.visibility=="visible") {
	clas.style.visibility = "hidden";
	imgcolor2.style.border="5px solid #1947D1";
  }
}
function ValidateAddress() {
	
	clas.style.visibility="hidden";
	fee.style.visibility="hidden";
	personal.style.visibility="hidden";
	attendance.style.visibility="hidden";
	marks.style.visibility="hidden";
	transport.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	imgcolor7.style.border="5px solid #1947D1";
	
	if(address.style.visibility == "hidden") {
		address.style.visibility = "visible";
		imgcolor3.style.border="5px solid #33AD33";
}
else if(address.style.visibility=="visible") {
	address.style.visibility = "hidden";
	imgcolor3.style.border="5px solid #1947D1";
}
	
}
function ValidateFee() {
	
	clas.style.visibility="hidden";
	personal.style.visibility="hidden";
	address.style.visibility="hidden";
	attendance.style.visibility="hidden";
	marks.style.visibility="hidden";
	transport.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	imgcolor7.style.border="5px solid #1947D1";
	
	if(fee.style.visibility == "hidden") {
		fee.style.visibility = "visible";
		imgcolor4.style.border="5px solid #33AD33";
}
else if(fee.style.visibility=="visible") {
	fee.style.visibility = "hidden";
	imgcolor4.style.border="5px solid #1947D1";
}
	
}
function ValidateAttendance() {
	clas.style.visibility="hidden";
	personal.style.visibility="hidden";
	address.style.visibility="hidden";
	fee.style.visibility="hidden";
	marks.style.visibility="hidden";
	transport.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	imgcolor7.style.border="5px solid #1947D1";
	
	
	if(attendance.style.visibility == "hidden") {
		attendance.style.visibility = "visible";
		imgcolor5.style.border="5px solid #33AD33";
	}
else if(attendance.style.visibility=="visible") {
	attendance.style.visibility = "hidden";
	imgcolor5.style.border="5px solid #1947D1";
}
	
}

function ValidateMarks() {
	clas.style.visibility="hidden";
	personal.style.visibility="hidden";
	address.style.visibility="hidden";
	fee.style.visibility="hidden";
	attendance.style.visibility="hidden";
	transport.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor7.style.border="5px solid #1947D1";
	
	if(marks.style.visibility == "hidden") {
		marks.style.visibility = "visible";
		imgcolor6.style.border="5px solid #33AD33";
}
else if(marks.style.visibility=="visible") {
	marks.style.visibility = "hidden";
	imgcolor6.style.border="5px solid #1947D1";
}
	
}
function ValidateTransport() {
	clas.style.visibility="hidden";
	personal.style.visibility="hidden";
	address.style.visibility="hidden";
	fee.style.visibility="hidden";
	attendance.style.visibility="hidden";
	marks.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	
	if(transport.style.visibility == "hidden") {
		transport.style.visibility = "visible";
		imgcolor7.style.border="5px solid #33AD33";
}
else if(transport.style.visibility=="visible") {
	transport.style.visibility = "hidden";
	imgcolor7.style.border="5px solid #1947D1";
}
	
}

   
</script>       
</body>
   
  
   

</html>