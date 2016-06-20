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
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	
	<div id="content"  class="content" >
			
			
			<form action="../FileUploadServlet" method="post" enctype="multipart/form-data" >
			
		
        	<div><input size="200" type="file" class="inputs" name="spreadsheet" value="select" />
        	<%session.setAttribute("marks", "marksupload");
        
        	%>
        	<br/><br/>
          <div><input type="submit" class="submit" style="margin-left: 50px;" value="Upload File"><br/></div></div>
        </form><br /><br>
			
			</div> <!-- content div ending-->
	

	
	<!-- footer div starting -->
			


	 <!-- footer div ending -->
	</div> <!-- container div ending-->
   

</body>
</html>