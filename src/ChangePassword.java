

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.demo.dao.ConnectionProvider;
import com.demo.dao.UsersDao;
import com.demo.dto.Users;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		String oldPassword=request.getParameter("oldpassword");
		String newPassword=request.getParameter("newpassword");
		String confirmPassword=request.getParameter("confirmpassword");
		String username,query;
		HttpSession session=request.getSession();
		username=session.getAttribute("uname")!=null?session.getAttribute("uname").toString():null;
		/*query="select user_name,password where user_name='"+username+"' and password='"+oldPassword+"'";*/
		System.out.println("user name from session object--->"+username);
		try {
			Users users=UsersDao.retrieveData(username,conn);
			if(users!=null){
				
			
			if(oldPassword.equals(users.getPassword())){
				if(newPassword.equals(confirmPassword)){
				users.setPassword(newPassword);
				/*users.setUserName(username);
				String userType=users.getUserType();
				users.setUserType(userType);*/
				UsersDao.update(users,conn);
				/*RequestDispatcher rd=request.getRequestDispatcher("/Common/Success.jsp");
				rd.forward(request, response);*/
				response.sendRedirect(request.getContextPath()+"/Common/Success.jsp");
				conn.commit();
				}else{
					session.setAttribute("error", "password doesn't match");
					/*RequestDispatcher rd=request.getRequestDispatcher("Common/ChangePassword.jsp");
					rd.forward(request, response);*/
					response.sendRedirect(request.getContextPath()+"/Common/ChangePassword.jsp");
					conn.rollback();
				/*out.println("<b>password doesn't match</b>");*/
				}
				
				
			}
			else{
				session.setAttribute("error", "Current  password wrong try again");
				/*out.println("<b> Current  password wrong try again</b>");*/
				/*RequestDispatcher rd=request.getRequestDispatcher("Common/ChangePassword.jsp");
				rd.forward(request, response);*/
				response.sendRedirect(request.getContextPath()+"/Common/ChangePassword.jsp");
			}
		}else {
			session.setAttribute("error", "not a valid user");
			/*RequestDispatcher rd=request.getRequestDispatcher("Common/ChangePassword.jsp");
			rd.forward(request, response);*/
			response.sendRedirect(request.getContextPath()+"/Common/ChangePassword.jsp");
			/*out.println("You are not a valid user");*/
		}
	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.commit();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
