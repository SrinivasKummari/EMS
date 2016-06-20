<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Faculty Admission</title>
<script  type="text/javascript" src="../datetimepicker.js"></script>
<link rel="stylesheet" type="text/css" href="/css/login.css">
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
<body style="background-image: url('../Images/schools7.jpg');">
	<!--container div starting  -->
		<div id="container" class="container">
		<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>
		
		<!--content div starting  -->
		<div id="content" class="content">
					<fieldset class="fieldHead">Faculty personal Information</fieldset>
					<form action="../SubmitFacultyAdmission" id="form" name="form"   method="post">
		<fieldset class="fieldList">
			<label class="label" for="fname"><span>*</span>First Name :</label>
			<input id="fname" name="fname"  type="text" class="inputLogin" required="required"></input>
			 <label class="label" for="lname"><span>*</span>Last Name :</label>
			 <input id="lname" name="lname"  type="text" class="inputLogin" required="required"></input>
			 <label class="label"><span>*</span>Birth Date :</label>
			 <input id="dob" type="text" class="inputLogin" name="dob"></input>
			 <a href="javascript:NewCal('dob','ddmmyyyy')"><img src="../Images/calen.png" style=" width: 20px; height: 20px ;float: right; "  alt="Pick a date"></a><br/><br/>
			<label class="label" for="phone"><span>*</span>Phone :</label>
		    <input id="phone" name="phone"  type="text" class="inputLogin" required="required"></input>
			<label class="label" for="email"><span>*</span>Email :</label>
			<input id="email" name="email"  type="text" class="inputLogin" required="required"></input>
			<label  class="label" for="doj" ><span>*</span>Date Of Join :</label>
			<input id="doj" name="doj"  type="text" class="inputLogin" ></input>
			<a href="javascript:NewCal('doj','ddmmyyyy')"><img src="../Images/calen.png" style=" width: 20px; height: 20px ; margin-left: 2px;float: right; "  alt="Pick a date"></a><br><br>
						<label class="label"><span>*</span>Gender :</label>
			<select id="gender" class="inputs"  name="gender" >
                                                                   <option>---Select---</option>
                                                                   <option>Male</option>
                                                                   <option>Female</option>	
                                                                   </select>
           <label class="label" for="imgSrc">Image Path :</label><input id="imgSrc" name="imgSrc"  type="text" class="inputLogin" required="required"></input><br/><br>
			
			</fieldset>
			
			
			<fieldset class="fieldHead">faculty Professional Information</fieldset>
			
			  <fieldset class="fieldList">
			<label  class="label"><span>*</span>Qualification :</label>
			<input id="qualification" name="qualification"  type="text" class="inputLogin" required="required"></input>
			<label  class="label"><span>*</span>Experience :</label>
			<input id="experience" name="experience"  type="text" class="inputLogin" required="required"></input>
			<label  class="label"><span>*</span>Previous CTC :</label>
			<input id="previousctc" name="previousctc"  type="text" class="inputLogin" required="required"></input><br><br>
			<label  class="label"><span>*</span>Current CTC :</label>
			<input id="currentctc" name="currentctc"  type="text" class="inputLogin" required="required"></input>
			<label  class="label"><span>*</span>Previous School :</label>
			<input id="previousschool" name="previousschool"  type="text" class="inputLogin" required="required"></input>
			<label  class="label"><span>*</span>Subject :</label>
			<input id="subject" name="subject" type="text" class="inputLogin" required="required"></input><br><br>
		
			</fieldset>
			
			
			<fieldset class="fieldHead">Address For Correspondence</fieldset>
			
						
			<fieldset class="fieldList">
			  <label  class="label"><span>*</span>House No :: </label>
			  <input  type="text" class="inputLogin" name="hno"></input>
			  <label  class="label"><span>*</span>Street :: </label>
			  <input  type="text" class="inputLogin" name="street"></input>
              <label  class="label"><span>*</span>Locality :: </label>
              <input type="text" class="inputLogin" name="locality"></input><br/><br/>
              <label  class="label"><span>*</span>city :: </label>
              <input  type="text" class="inputLogin" name="city"></input>			
			  <label  class="label"><span>*</span>State :: </label>
			  <input type="text" class="inputLogin" name="state"></input>
			  <label  class="label"><span>*</span>Country :: </label> 
			  <select id="sectionList" class="inputs"  name="country">
			                                                    <option>---Select---</option>
			                                                    <option>INDIA</option>
			                                                    </select><br/><br/>
			  
			  
			  <label  class="label"><span>*</span>Zip Code :: </label><input  type="text" class="inputLogin" name="zip"></input><br><br>
              </fieldset>
			
		<fieldset class="fieldHead">			
			 <label  class="label"></label><input class="submitLogin"  type="reset"/><input class="submitLogin" style="margin-left: 20px;" type="submit" value="Submit"  />
		</fieldset>
			 </form>                                                                   
		
		</div>
		<!--content div ending  -->
		</div>
	<!--container div ending  -->
</body>
</html>
