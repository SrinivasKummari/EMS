<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My WebSite for Schools</title>
<link rel="stylesheet" type=text/css href="../css/login.css" href="../css/content.css"/>
<link rel="stylesheet" type=text/css href="../css/messages.css"/>
<!-- <script type="text/javascript" src="messages.js"></script> -->

<script type="text/javascript" src="../defaulttext.js">
</script>

<script type="text/javascript">
var currentEnabled = null;
function enableElement(elem) {
if (currentEnabled) {
currentEnabled.disabled = true;
}
elem.disabled = false;
currentEnabled = elem;
}
</script>

<script  type="text/javascript">
function validateForm()
{
	 var stdid = document.myForm.stdid;
	 if (stdid.value == "")
	 {
	     window.alert("Please enter your name.");
	     stdid.focus();
	     return false;
	 }
}
</script>

</head>
<body style="background-image: url('../images/schools7.jpg');">
 	<!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	
	<div id="InquiryContent"  class="content" >
    <form  action="InquiryResult.jsp" method="post" name="myForm" onsubmit="return validateForm()"><br/><br/>
 <!--  <input type="radio" name="sel" value="2" onclick="enableElement(this.form.elements['stdid'])"/>  -->       
<fieldset class="fieldHead"><b>Enter student id to inquiry.</b></fieldset> 
<fieldset class="fieldList"><label class="label">Student id :</label><input type="text" name="stdid" class="inputs" placeholder="12345"   ><br/><br/>
</fieldset>
<fieldset class="fieldList">
   <label  class="label"></label><input class="submitLogin" type="reset"/><input class="submitLogin" style="margin-left: 20px;" type="submit" value="Submit"  />

</fieldset></form>

<br />


        
        <div class="contentTitle" style="color:white;"><h2>Feel free to reach us, if you have any queries.<img src="smiley.jpg"/></h2></div>
            <div class="contentText"><p></p><br />
        <p></p><br />
          <p></p></div>
        
        </div>
      
        </div>


    
       
</body>
</html>
