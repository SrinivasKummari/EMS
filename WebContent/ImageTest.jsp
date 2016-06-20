<%@page import="com.demo.dao.StudentDao"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ImageTest.jsp" method="post"><br>
                  <label class="label" for="id"><span>*</span> Student Id : </label><input type="text" class="inputLogin" name="id"><br><br>
                    <input type="submit" class="submitLogin" style="margin-left: 190px;" value="Go">
                    </form>
                ${pageContext.request.contextPath} rajasekhar    
                     <% if(request.getParameter("id")!=null){
                        Connection conn =ConnectionProvider.getConnection();
                Integer i=Integer.valueOf(request.getParameter("id"));
                String imgSrc = StudentDao.retrieveImage(i,conn);
                System.out.print(imgSrc);%>
                
                   <img src="<%=imgSrc%>"/> <%} %>
                    
                   
               <img src="${pageContext.request.contextPath}Images/sri.jpg">
</body>
</html>