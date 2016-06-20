

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/StudentInfo")
public class StudentInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html");
		
		//hardcoded  values for stuent ids and names
		ArrayList< Integer> ids = new ArrayList<Integer>();
		ids.add(1);
		ids.add(2);
		ids.add(3);
		
		ArrayList<String> names = new ArrayList<String>();
		names.add("rajasekhar");
		names.add("Srinivas");
		names.add("rajesh");
		
		HashMap<Integer, String> student = new HashMap<>();
		
		student.put(1, "rajasekhar");
		student.put(2, "srinivas");
		student.put(3, "rajesh");

		
		
		String sname= request.getParameter("name");

		String sid= request.getParameter("stdid");
		
		if(sname.length()<3&&sid==null){
			
			out.print("<body background=\"emoticons-sad.jpg\">");
			
			out.print("<b>Insufficient data enter id or atleast 3 char name<b>");
		}
		else if(sid!=null||sname.length()>=3){
			
			if(sid!=null){
				if(ids.contains(Integer.parseInt(sid))){
					out.print("<body >");

					out.print("Name:<u>"+student.get(Integer.parseInt(sid))+"</u><br>");
					out.print("ID:<b>"+sid+"</b><br>");
					out.print("Gender:Male<br>");
				}
				else {
					out.print("<body background=\"emoticons-sad.jpg\">");
					
					out.print("<b>No such student<b>");
				}
			}
			else {
		        if(names.contains(sname)){
		        	out.print("Name:<u>"+sname+"</u><br>");
					out.print("ID:<b> 1</b><br>");
					out.print("Gender:Male<br>");
		        }
			}
			
		}
		
	}
/*public static void main(String[] args) throws ServletException, IOException {
	//StudentInfo info = new StudentInfo();
	
	//info.doPost(null, null);
	
}*/
}
