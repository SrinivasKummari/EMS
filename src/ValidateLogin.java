

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.catalina.Session;

import java.sql.Connection;

/**
 * Servlet implementation class ValidateLogin
 */

public class ValidateLogin extends HttpServlet {
	
	Connection conn;
	ResultSet res;
	
	String username,password,query,userType;
	
	DatabaseConnection dbconn;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String var = request.getParameter("validate");
		try{
			userType=request.getParameter("sel");
			username=request.getParameter("username");
			password=request.getParameter("pass");
			
			System.out.println(username+"------"+password+"--------"+userType);
			
			query="select * from users where user_name='"+username+"' and password='"+password+"' and user_type='"+userType+"'";
			dbconn=new DatabaseConnection();
			conn=dbconn.setConnection();
			res=dbconn.getResultSet(query, conn);
			System.out.println(res);
		//	System.out.println(res.next());
			HttpSession session=request.getSession(true);
			if(res.next()){
				
				
				
				//System.out.println(res.getString(1));
				session.setAttribute("uname", username);
				session.setAttribute("uType", userType);
				System.out.println("uname--"+session.getAttribute("uname"));
				//RequestDispatcher rd=request.getRequestDispatcher("Common/Home.jsp");
				//rd.forward(request, response);
				System.out.println(request.getContextPath());
				
					response.sendRedirect(request.getContextPath()+"/Common/Home.jsp");
				
			}
			else{
				session.setAttribute("error","username or password is invalid");
				/*RequestDispatcher rd=request.getRequestDispatcher("/Login/Index.jsp");
				rd.forward(request, response);*/
				response.sendRedirect(request.getContextPath()+"/Login/Index.jsp");
			}
			
		}catch(Exception e){
			
			/*RequestDispatcher rd=request.getRequestDispatcher("Common/error.jsp");
			rd.forward(request, response);*/
			response.sendRedirect(request.getContextPath()+"/Common/error.jsp");
		}
		finally{
			out.close();
		}
	}
	


}
