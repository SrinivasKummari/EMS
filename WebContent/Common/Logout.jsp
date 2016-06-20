<%@page import="java.util.*"  %>
<% session.invalidate();%>

<%response.sendRedirect("../Login/Index.jsp") ;%>