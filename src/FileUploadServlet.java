

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.catalina.Session;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



import com.demo.dao.StudentDao;


/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text");
		HttpSession session = request.getSession();
		
		System.out.println(session.getAttribute("marks"));
		if(request.getParameter("admissionfile")=="admission"){
		//Boolean isMultiPart= ServletFileUpload.isMultipartContent(request);
		//if(isMultiPart){
			//ServletFileUpload upload=new ServletFileUpload();
			try{
				
				System.out.println("request--->"+request);
				//FileItemIterator itr= upload.getItemIterator(request);
				//while(itr.hasNext()){
					
					//System.out.println("item iterator-----"+itr.hasNext());
					//FileItemStream item=itr.next();
					//if(item.isFormField()){
						
						//System.out.println("is not a file field");					
					//}else{
						String path= getServletContext().getRealPath("/");
				System.out.println(path);		
				
				CallTalend.getmasterjob();
				/*request.getRequestDispatcher("Common/Success.jsp").forward(request, response);*/
				response.sendRedirect(request.getContextPath()+"/Common/Success.jsp");
			//	MasterStudent masterstudent = new MasterStudent();
/*				Workbook wb= Workbook.getWorkbook(item.openStream());
				
				
				System.out.println(wb.getSheet(0).getName());
				
				int noOfSheets = wb.getNumberOfSheets();

			int 	studentcount =0;
				PrintWriter out = response.getWriter();
				
				out.println("<body> file contains"+noOfSheets+"  no of sheets");

				
				System.out.println("no of sheets---"+noOfSheets);
				
				System.out.println("rows----------"+wb.getSheet(0).getRows());
				System.out.println("colss----------"+wb.getSheet(0).getColumns());
				for(int i=0;i<noOfSheets;i++){
					Sheet sheet = wb.getSheet(i);
					for(int j=0;j<sheet.getRows();j++){
						StudentDto studentDto = new StudentDto();
						
						List<String> list = new ArrayList<String>();
						
						
						for(int k=0;k<sheet.getColumns();k++){
							Cell cell = sheet.getCell(k,j);
				
							System.out.println("cell "+k+","+j+" contents--"+cell.getContents());
							list.add(cell.getContents());
						
						}
						studentDto .setStudentId(Integer.valueOf(list.get(0)));
						studentDto.setFname(list.get(1));
						studentDto.setLname(list.get(2));
						studentDto.setDOB(null);
						studentDto.setPhone(list.get(0));

						StudentDao.insert(studentDto);
				//		StudentDao dao = new StudentDao(studentDto);
						studentcount++;
					
					}
				}
				
out.println(studentcount+" <br>student details are inserted");
				studentDto.setStudentId(Integer.valueOf(list.get(0)));
				studentDto.setFname(list.get(1));
				studentDto.setLname(list.get(2));
				studentDto.setDOB(null);
				studentDto.setCourseId(Integer.valueOf(list.get(0)));
				
				
				//StudentDao studentDao = new StudentDao(studentDto);
				*/	//}
				//}
				
				
			}catch(Exception fue){
				fue.printStackTrace();
			}
			
			System.out.println("file uploaded successfully");
		}
		else if(session.getAttribute("marks").equals("marksupload")){
			try{
				System.out.println("in marksupload part");
				CallTalend.getmarksupload();
				/*request.getRequestDispatcher("Common/Success.jsp").forward(request, response);*/
				response.sendRedirect(request.getContextPath()+"Common/Success.jsp");
			}
			catch(Exception e){
				e.printStackTrace();
				/*request.getRequestDispatcher("Common/error.jsp").forward(request, response);*/
				response.sendRedirect(request.getContextPath()+"Common/error.jsp");
			}
		}
	}
}
