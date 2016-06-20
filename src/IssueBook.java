

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.apache.catalina.Session;

import com.demo.dao.ConnectionProvider;
import com.demo.dao.LibraryDao;
import com.demo.dto.Library;


/**
 * Servlet implementation class IssueBook
 */
@WebServlet("/IssueBook")
public class IssueBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IssueBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String bookCode=request.getParameter("bookCode");
		String bookName=request.getParameter("bookName");
		String issueDate=request.getParameter("issueDate");
		String noOfDays=request.getParameter("noOfDays");
		String submissionStatus=request.getParameter("submissionStatus");
		HttpSession session=new HttpSession() {
			
			@Override
			public void setMaxInactiveInterval(int arg0) {
				// TODO Auto-generated method stub
				
			}
			@Override
			public int getMaxInactiveInterval() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public long getLastAccessedTime() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public String getId() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public long getCreationTime() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public Enumeration<String> getAttributeNames() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object getAttribute(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			@Override
			public ServletContext getServletContext() {
				// TODO Auto-generated method stub
				return null;
			}
			@Override
			public HttpSessionContext getSessionContext() {
				// TODO Auto-generated method stub
				return null;
			}
			@Override
			public Object getValue(String arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			@Override
			public String[] getValueNames() {
				// TODO Auto-generated method stub
				return null;
			}
			@Override
			public void invalidate() {
				// TODO Auto-generated method stub
				
			}
			@Override
			public boolean isNew() {
				// TODO Auto-generated method stub
				return false;
			}
			@Override
			public void putValue(String arg0, Object arg1) {
				// TODO Auto-generated method stub
				
			}
			@Override
			public void removeAttribute(String arg0) {
				// TODO Auto-generated method stub
				
			}
			@Override
			public void removeValue(String arg0) {
				// TODO Auto-generated method stub
				
			}
			@Override
			public void setAttribute(String arg0, Object arg1) {
				// TODO Auto-generated method stub
				
			}
		};
		Library library=new Library();
	library.setStudentId(Integer.valueOf(session.getAttribute("studentId").toString()));
	library.setBookCode(bookCode);
	library.setBookName(bookName);
	
	SimpleDateFormat df= new  SimpleDateFormat("dd-mm-yyyy");
	
	try {
		library.setIssueDate(df.parse(issueDate));
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	library.setNoOfDays(Integer.valueOf(noOfDays));
	library.setSubmissionStatus(Integer.valueOf(submissionStatus));
	int values=0;
	try {
		 values=LibraryDao.insertBook(library, conn);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(values!=0){
		try {
			conn.commit();
			   session.setAttribute("msg", "Book added successfully");
			   response.sendRedirect(request.getContextPath()+"/Common/Success.jsp");
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}else{
		try {
			System.out.println("no book inserted");
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}

}
