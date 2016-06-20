

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str=request.getParameter("login");
		String str1=request.getParameter("password");
		List<String> list=new ArrayList<String>();
		list.add("srinivas");
		list.add("Srini@34");
		PrintWriter out=response.getWriter();
		if(list.contains(str) &&list.contains(str1)){
			out.print("<a href="+"\"http://localhost:8080/SchoolProject/SimpleWebsite.html\">submit</a>");
			
		}
	
	}

}
