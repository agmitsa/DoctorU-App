<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page errorPage="error_page.jsp"%>    
<%@ page import="DoctorU.*" %>


<!DOCTYPE html>
<html lang="en">
  <head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="shortcut icon" href="images/doctorU.png" type="image/png">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/cssback.css">
		<title>Sign in</title>
		
	
	
	</style>
  </head>

  <body id="login">

    <div class="container">
		
		<div class="row">	
			<div class="col-md-6 col-md-offset-3">
			
			<% if(request.getAttribute("message") != null) { %> <%-- wrong username or password, eyresh sth vash an yparxei --%> 
					
			
				<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
			<% } %>
				
			
				<form class="form-signin" action="loginController.jsp" method="post">
					<div class="text-center">
					
					 <img id ="logo" src="images/doctorU.png" width="500" height="300" >
					</div>
					<h2 class="form-signin-heading" style="color:SteelBlue">Please sign in</h2>
					<label for="username" class="sr-only">Username</label>
					<input type="text" name= "username" id="username" class="form-control" placeholder="Username" required>
					<label for="password" class="sr-only">Password</label>
					<input type="password" name="password" id="password" class="form-control" placeholder="Password" required>

					<div class="checkbox">
						<label style="color:SteelBlue">
							<input type="checkbox" value="remember-me"> Remember me
						</label>
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
				</form>
				<br>
				<div class="col-md-6 col-md-offset-3">
			
				<div class="dropdown">
					<button class="btn btn-primary btn-lg dropdown-toggle" type="button" data-toggle="dropdown">Νέος χρήστης; Εγγραφείτε
						<span class="caret"></span>
					</button>
						<ul class="dropdown-menu">
						<li><a href="register_doctor.jsp" name="typeofmember" id="doc">Γιατρός</a></li>
						<li><a href="register_patient.jsp"name="typeofmember" id="pat">Ασθενής</a></li>
						

						</ul>
				</div>
			
			</div>
			</div>
		</div>
		
		
			
		
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<h1></h1>
			</div>
		</div>

	</div>
	<!-- /container -->
	
	<footer class="navbar-default">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center">&copy; Copyright 2017 by ismgroup52</p>
					</div>
				</div>
			</div>
		</footer>


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
