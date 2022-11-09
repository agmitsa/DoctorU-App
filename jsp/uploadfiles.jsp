<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.io.*, java.util.*,org.apache.common.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*"%>
<%@ page import="DoctorU.*" %>

<%@page import=" org.apache.commons.fileupload.FileItem" %>
<%@page import ="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@page import=" org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import=" java.io.File" %>
<%@page import= "java.io.IOException" %>
<%@page import= "java.io.PrintWriter" %>
<%@page import= "java.util.List"%>


<%
 final int MEMORY_THRESHOLD   = 1024 * 1024 * 3; 
 final int MAX_FILE_SIZE      = 1024 * 1024 * 40; 
 final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; 

final String UPLOAD_DIRECTORY = "uploads";
User user=(User)(session.getAttribute("member"));
session.setAttribute("member",user);

ExamDAO edao = new ExamDAO();

String eid="";
String name="";
String dates="";
String ssn="";
String filePath="";
String puser="";










       DiskFileItemFactory factory = new DiskFileItemFactory();
       
        factory.setSizeThreshold(MEMORY_THRESHOLD);
       
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        
   
        String uploadPath = getServletContext().getRealPath("")+ File.separator + UPLOAD_DIRECTORY;
		String mypath ="";
        try {
       
           
			
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
             
                for (FileItem item : formItems) {
					
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
 
                        item.write(storeFile);
						mypath = UPLOAD_DIRECTORY + "//" + fileName; 
                        request.setAttribute("message",
                            "Upload has been done successfully!");
                    } else {
						if(item.getFieldName().equals("namex")){
							name = item.getString();
						} else if(item.getFieldName().equals("datex")){
							dates = item.getString();
						} else if(item.getFieldName().equals("ssnx")){
							ssn = item.getString();
						} else if(item.getFieldName().equals("puserx")){
							puser = item.getString();
						}
					}
                }
				 
				Exam exam = new Exam(name,dates,ssn,mypath,puser);
				eid = String.valueOf(exam.getEid());
				edao.updateExamBase(eid,name,dates,ssn,mypath,puser);
				request.setAttribute("message",exam.getEid());
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }
      
        getServletContext().getRequestDispatcher("/my_exams.jsp").forward(
                request, response);











%>