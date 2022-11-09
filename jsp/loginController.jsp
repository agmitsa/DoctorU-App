<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "DoctorU.*" %>
<%@ page errorPage="error_page.jsp"%>   

	
	<%
String username = request.getParameter("username");
String password = request.getParameter("password");

User user = new User();

try {
	if(username.startsWith("p")){
		Patient patient = new Patient();
		PatientDAO patdao = new PatientDAO();
		patient.authenticate(username, password);
		Patient pat = patdao.getPatient(username);
		session.setAttribute("member", pat);
		
		
%>
<jsp:forward page="profile_patient.jsp"/>
<%
	}else if(username.startsWith("d")){
		Doctor doctor = new Doctor();
		DoctorDAO doctordao = new DoctorDAO();
		doctor.authenticate(username, password);
		Doctor doc=doctordao.getDoctor(username);
		
		session.setAttribute("member",doc);
	
	%>	
		


	 <jsp:forward page="profile_doctor.jsp"/> 
	<%}else {
		String mess="Username is not valid";
		request.setAttribute("message",mess);
			%>
				<jsp:forward page="login.jsp"/>
				<%
	}%>

	<%} catch(Exception e) {
	
			request.setAttribute("message", e.getMessage());
			%>
				<jsp:forward page="login.jsp"/>
				<%
	}%>
		


 