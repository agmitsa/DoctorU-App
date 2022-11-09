<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page errorPage="error_page.jsp"%>    
<%@ page import="DoctorU.*" %>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>

<%
Doctor doctor =(Doctor)(session.getAttribute("member"));
String mess = "You are not authorized to access this resource. Please login.";
if (session.getAttribute("member")==null) {
	request.setAttribute("message", mess);
	%>
	<jsp:forward page="login.jsp"/>	
	<%
} else { %>

<!DOCTYPE html>
<html>
	<head>

		<title>Μενού</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/cssback.css">
		<link rel="shortcut icon" href="images/doctorU.png" type="image/png">
	</head>

	<body>

		<nav class="navbar navbar-default">
		<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			<a class="navbar-brand" href="#">DoctorU</a>
		</div>

    <!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span class="glyphicon glyphicon-user"></span>
							<strong><%=doctor.getName()%></strong>
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<div class="navbar-login">
									<div class="row">
										
											<p class="text-center">
												<span class="glyphicon glyphicon-log-out"></span>
												<a href="logout.jsp"><strong style="color:black">Logout</strong></a>
											</p>
										
									</div>
								</div>
							</li>
						</ul>
					</li>
					</ul>



			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
		</nav>




<div class="container">
  <h3><%=doctor.getName()%></h3>
  <ul class="nav nav-tabs">

    <li ><a href="profile_doctor.jsp">Προφίλ</a></li> 
    <li><a href="search_patient.jsp">Αρχείο ασθενών</a></li>
	<li class="active" ><a href="my_list.jsp">Η λίστα μου <span class="glyphicon glyphicon-star" aria-hidden="true"></span></a></li>
  </ul>
  <br>
  <p></p>
</div>
			<div class="container">
				<div class="row">
<% 
		Request req = new Request();
		PatientDAO patdao = new PatientDAO();
		List<String> listfavpat = req.getDocpat(doctor.getDusername());
		String puser=null;
		
			if (!listfavpat.isEmpty()) {
				for (int i = 0; i < listfavpat.size(); i++) {
					puser = listfavpat.get(i);
					
					
					
					Patient pat = patdao.getPatient(puser);
				
				
				%>
				
						<div class="col-sm-4 ">
							<div class="thumbnail" align="center" style="width:60%">
								<div class="icon green">
									<i class="fa fa-file-text-o" style="font-size: 72px; margin-top: 7px;"> <img id="profile-img" class="profile-img-card" src="images/doctor image.png" /></i>
								</div>
								<div class="caption">
									<h3><%= pat.getName()%> <%= pat.getSurname()%> </h3>
									Username: <%= pat.getPusername()%><br>
									Ssn(AMKA): <%= pat.getAmka()%><br>
			
									<span class="glyphicon glyphicon-briefcase" style="width:20px;"></span><%= pat.getTameio()%> <br> 
									<span class="glyphicon glyphicon-phone-alt" style="width:20px;"></span><%= pat.getPhone()%>  <br>
								<span class="glyphicon glyphicon-envelope one" style="width:20px;"></span><%=pat.getEmail()%> <br>

									
									
									<p align="center">
									<button type="button"  class="btn btn-primary"  id = "profbutton" onclick="window.location.href = 'my_exams.jsp?pusername=<%=pat.getPusername()%>&pname=<%=pat.getName()%>&psurname=<%=pat.getSurname()%>'">Μετάβαση στις εξετάσεις <span class="glyphicon glyphicon-chevron-right"></span></button>
									</p>
								</div>
								
							
							</div>
						</div>

                   
					  <%}%>
					  <%} else {
		%>
		<div class="row">               
			<div class="col-md-8 col-md-offset-1">
				<h2>Patients not found</h2>
			</div>
		</div>
		
					  
				<%}%>
				</div>
			</div>


		<footer class="navbar-default">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center">&copy; Copyright 2017 by ismgroup52</p>
					</div>
				</div>
			</div>
		</footer>



		<script src="js/jquery.min.js"></script>
	
	<script src="js/bootstrap.min.js"></script>
		
	</body>


</html>
<%
}
%>