<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  
<%@ page import="DoctorU.*" %>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>


<%
Patient pat=(Patient)(session.getAttribute("member"));
String mess = "You are not authorized to access this resource. Please login.";
if (session.getAttribute("member")==null) {
	request.setAttribute("message", mess);
	%>
	
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
							<strong><%=pat.getName()%></strong>
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
  <h3><%=pat.getName()%></h3>
  <ul class="nav nav-tabs">
    
    <li><a href="profile_patient.jsp">Προφίλ</a></li>
    <li><a href="my_exams.jsp">Eξετάσεις</a></li>
	<li  class="active"><a href="request.jsp">Aιτήματα</a></li>

  </ul>
  <br>
  <p></p>
</div>


	<% 
		Request req = new Request();
		DoctorDAO doctordao = new DoctorDAO();
		List<String> listdoc = req.getPatdoc(pat.getPusername());
		String duser=null;
		
			if (!listdoc.isEmpty()) {
				for (int i = 0; i < listdoc.size(); i++) {
					duser = listdoc.get(i);
					
					
					
					Doctor doc = doctordao.getDoctor(duser);
				
				
				%>
		

<div class="container">
	<div class="row">
       <p></p>
		<div class="stats-buttons-grid">
       <div class="row">
			<div class="col-sm-4 ">
                <div class="thumbnail" align="center">
			
                    <div class="icon green">
                        <i class="fa fa-file-text-o" style="font-size: 72px; margin-top: 7px;"> <img id="profile-img" class="profile-img-card" src="images/doctor image.png" /></i>
                    </div>
                    <div class="caption">
                        <h3><%= doc.getName()%></h3>
                        <p><%= doc.getSpecialization()%></p>
						<p><%= doc.getHospital()%></p>
						
						
						
                        <p align="center">
						
						
						<button type="button" data-quantity-field="<%=pat.getPusername() %>"
							data-product-quantity="1" data-product-name="<%=doc.getDusername()%>"						
							class="btn btn-primary btn-info tip accept" id="firebutton"><i class="fa fa-cloud-download"></i>Accept</button>
							
							
						<button type="button" data-quantity-field="<%=pat.getPusername() %>"
							data-product-quantity="0" data-product-name="<%=doc.getDusername()%>"						
							class="btn btn btn-danger tip delete-action delete" id="deletebutton"><i class="fa fa-cloud-download"></i>Delete</button>
						
						
							
                            
                        </p>
                    </div>
					
				
                </div>
            </div>
    
    </div>
</div>
	</div>
</div>

				<%}
			}else{%>
			
			<div class="row">               
				<div class="col-md-8 col-md-offset-1">
					<h2>No new requests</h2>
				</div>
			</div>
		
				<%}%>


		<!-- footer -->
	<footer class="navbar-default">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center">&copy; Copyright 2017 by ismgroup52</p>
					</div>
				</div>
			</div>
		</footer>
	<!-- End footer -->
		
	
	<script src="js/jquery.min.js"></script>
	
	<script src="js/bootstrap.min.js"></script>
	
	<script src="statusReq.js"></script>
	
	</body>
		
		
</html>
<%
}
%>