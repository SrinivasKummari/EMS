import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.catalina.connector.Request;
import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


public class ServletReadExcel extends HttpServlet {

		
		@SuppressWarnings("deprecation")
		public void doPost(HttpServletRequest request ,HttpServletResponse response) throws IOException{
			
	ServletInputStream inputStream = request.getInputStream();
	
	try {
		Workbook wb = Workbook.getWorkbook(inputStream);
		
		System.out.println(wb.getSheet(0).getName());
	} catch (BiffException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	/*
	
	PrintWriter out =response.getWriter();
	
	DiskFileUpload fu = new DiskFileUpload();
	fu.setSizeMax(DiskFileUpload.MAX_HEADER_SIZE);
	fu.setSizeThreshold(1024);
	fu.setRepositoryPath(System.getProperty("java.io.tmpdir"));
	List<FileItem> fileList = null;
	try {
		System.out.println(ServletFileUpload.isMultipartContent(request));
		fileList = fu.parseRequest(request);
	} catch (FileUploadException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	InputStream uploadedFileStream = null;
	String uploadedFileName = null; // name of file on user's computer
	for (Iterator i = fileList.iterator(); i.hasNext(); )
	{
		FileItem fi = (FileItem)i.next();
		if (fi.isFormField())
		{
			String key = fi.getFieldName();
			String val = fi.getString();
			System.out.println("Form parameter " + key + "=" + val);
		} else
		{
			if (fi.getSize() < 1)
			{
				try {
					throw new Exception("No file was uplaoded");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			uploadedFileName = fi.getName();
			uploadedFileStream = fi.getInputStream();
		}
	}

	try {
		Workbook workbook = Workbook.getWorkbook(uploadedFileStream);
	} catch (BiffException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	

//	DiskFileUpload fu = new DiskFileUpload();   
	
	
		
*/		}
		
	}

	

