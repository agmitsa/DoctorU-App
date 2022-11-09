<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page errorPage="error_page.jsp"%>    
<%@ page import="DoctorU.*" %>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>



<%
Doctor doctor=(Doctor)(session.getAttribute("member"));

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

		<title>Μενού</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/bootstrap.min.css">		
		<link rel="stylesheet" type="text/css" href="css/cssback.css">
		<link rel="stylesheet" type="text/css" href="css/search.css">
		<link rel="shortcut icon" href="images/doctorU.png" type="image/png">
		<style>
form {
	margin-top: 10px;
	margin-left: 0px;
	 width: 120%;

   
}
</style>
		
		
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
				<li><a href="profile_doctor.jsp">Προφίλ</a></li> 
				<li class="active"><a href="search_patient.jsp">Αρχείο ασθενών</a></li>
				<li><a href="my_list.jsp">Η λίστα μου<span class="glyphicon glyphicon-star" aria-hidden="true"></span></a></li>
			</ul>
	</div>

	<div class="row">
        
            <div class="col-md-4 col-md-offset-1"> 
			 <form method="post" action="display_pat.jsp">
                <div class="input-group stylish-input-group" for="key">
                    <input type="text" class="form-control" name="key" id="key" placeholder="Αναζήτηση με όνομα ή επίθετο ή ΑΜΚΑ(ssn) " >
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