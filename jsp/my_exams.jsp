<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
<%@ page import="DoctorU.*" %>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@page import=" java.io.File" %>
<%


ExamDAO edao = new ExamDAO();

User user=(User)(session.getAttribute("member"));
String ssn="";
	
String mess = "You are not authorized to access this resource. Please login." + session.getAttribute("member") ;
if (session.getAttribute("member")==null) {
	request.setAttribute("message", mess);
	%>
	<jsp:forward page="login.jsp"/>	
	<%} else {

String mem = (session.getAttribute("member").getClass().getName());%>
<!DOCTYPE html>
<html>
	<head>
	
		<title>Μενού</title>	
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/cssback.css">
		<link rel="stylesheet" type="text/css" href="css/search.css">
		<link rel="stylesheet" type="text/css" href="css/dragndrop.css">
		<link rel="stylesheet" type="text/css" href="css/modal.css">
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
								<strong><%=user.getName()%></strong>
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
		
		
			
		<% if (mem=="DoctorU.Patient") {%>
		<div class="container">
			<h3><%=user.getName()%> </h3> 
		<%} else {%>
			
			<div class="container">
			<h3><%=request.getParameter("pname")%> <%=request.getParameter("psurname")%>    <%=request.getParameter("pusername")%></h3>
			
		<%}%>
			
			<ul class="nav nav-tabs">
   
				<% if (mem=="DoctorU.Patient") {%><li><a href=profile_patient.jsp>Προφίλ</a></li><%}%>
				<li class="active"><a href="#">Εξετάσεις</a></li>
				<% if (mem=="DoctorU.Patient") {%><li><a href=request.jsp>Αιτήματα</a></li> <%}%>
			</ul>
			<br>
			<p></p>
		</div>
		<% if (mem=="DoctorU.Doctor") {%>	
		<div class="row">
            <div class="col-md-8 col-md-offset-1">
			<form method="POST" action="display_exams.jsp?pusername=<%=request.getParameter("pusername")%>">
                <div class="input-group stylish-input-group" for="key">
                    <input type="search" class="form-control" name="key" id="key" placeholder="Αναζητήστε τύπο εξετάσεων ή ημ/νια" >
                    <span class="input-group-addon">
                        <button type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>  
                    </span>
                </div>
			</form>	
			</div>
			
			
		</div>
		<br>
		<% }else{
		Patient pat = (Patient)user;	
			%>	
		
		<div class="row">
            <div class="col-md-8 col-md-offset-1">
			<form method="POST" action="display_exams.jsp?pusername=<%=pat.getPusername()%>">
                <div class="input-group stylish-input-group" for="key">
                    <input type="search" class="form-control" name="key" id="key" placeholder="Αναζητήστε τύπο εξετάσεων ή ημ/νια" >
                    <span class="input-group-addon">
                        <button type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>  
                    </span>
                </div>
			</form>	
			</div>
			
			
		</div>
		<br>
		<% }%>	
		

		
		<div class="row">               
			<div class="col-md-8 col-md-offset-1">
				<button type="button" id="btn-request-exam" class="btn btn-primary btn-lg " aria-hidden="true" data-toggle="modal" data-target="#modal-request-exam"><strong>+ </strong>Καταχώρηση νέας εξέτασης</button>
			</div>
		</div>
	
		<div id="modal-request-exam" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title">Νέα Εξέταση</h4>
					</div>
					<div class="modal-body form-horizontal">

			            <div id="endorsement-form-container" class="">

							<form class="form-horizontal" role="form" method="post" action="uploadfiles.jsp" enctype="multipart/form-data" id="js-upload-form">
								<div class="form-group">
									<div class="input-group">
									    <label for="namex">Τύπος εξέτασης</label>
									    <input type="text" class="form-control"  id="namex" name="namex" placeholder="πχ Αιματολογικές εξετάσεις"/>
									</div>
								</div>	
								<div class="form-group">
									<div class="input-group">
										<label for="datex">Ημ/νια έκδοσης εξέτασης</label>
									    <input type="text" class="form-control" name="datex" id="datex" placeholder="DD/MM/YYYY"/>
									</div>
								</div>	
								<div class="form-group">
									<div class="input-group">
									    <label for="ssnx">ΑΜΚΑ Ασθενή</label>
									    <input type="text" class="form-control" name="ssnx" id="ssnx" placeholder="AMKA"/>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
									    <label for="puserx">Username Ασθενή</label>
									    <input type="text" class="form-control" name="puserx" id="puserx" placeholder="PUsername"/>
									</div>
								</div>
								
								
										<!-- Standar Form -->
								<h4>Select files from your computer</h4>

									<div class="form-inline">
										<div class="form-group">
										<div class="input-group">
											<input type="file" name="file" id="file" />
										</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary" >Καταχώρηση</button>
											
											
										</div>
									</div>
								
							</form>
							
						</div>
					</div>
					
					
					
				</div>
			</div>
		</div>
		<br>

		<% if (mem=="DoctorU.Doctor") {	
			String pusername = request.getParameter("pusername");
			Patient patient = new Patient();
			PatientDAO pdao = new PatientDAO();
			patient = pdao.getPatient(pusername);
			ssn = patient.getAmka();
		}else{
			ssn = user.getAmka();
		}
			List<Exam> exams = edao.getExams(ssn);
			Exam ex;
			if (!exams.isEmpty()) {
				for (int i = 0; i < exams.size(); i++) {
					ex = exams.get(i);
		%>	
			<div class="list-group">
						<div class="row">
							
							<div class="col-sm-8">
								<div class="container" >
									
									<a href="#" class = "list-group-item" onclick="window.location.href = '<%=ex.getPath()%>'"><%=ex.getEid()%>  <strong><%=ex.getType()%></strong> <%=ex.getDate()%>  <span style="color:Gray"> AMKA: <%=ex.getSsn()%></span></a>
								</div>
							</div>
									
							

						</div>
					</div>
					<%
			}
					%>
					<%
					}
							%>	
			

			
		<% if (mem=="DoctorU.Doctor") {%>	
		<div class="row"> 
		<div class="col-sm-offset-5 col-sm-10">
				<a href="profile_doctor.jsp">
					<button type='button' class='btn btn-primary btn-lg'><span class='glyphicon glyphicon-chevron-left'></span>Back to my profile</button><br><br>
				</a>
		</div>
		</div>
		<%}%>
		
		
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