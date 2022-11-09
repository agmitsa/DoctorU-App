<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page errorPage="error_page.jsp"%>   
<%@ page import="DoctorU.*" %>




<!DOCTYPE html>
<html lang="en">
    <head>
		<meta name="viewport" content="width=device-width, initial-scale=1">


		<!-- Website CSS style -->
		<link href="css/bootstrap.min.css" rel="stylesheet">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="style.css">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
		<link rel="shortcut icon" href="images/doctorU.png" type="image/png">


		<meta charset="utf-8">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/regcss.css">









		<title>Register</title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<% if(request.getAttribute("message") != null) { %> 
				<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
				<% } %>
			</div>
		</div>	
		<div class="container">
			<div class="row main">
				<div class="main-login main-center">
				<h3>Εγγραφή Ασθενή</h3>
				
					<form class="" method="post" action="servlet/Register_Controller_pat">

						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">'Ονομα</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="name" id="name"  placeholder="Εισάγετε το όνομά σας"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="surname" class="cols-sm-2 control-label">Επώνυμο</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="surname" id="surname"  placeholder="Εισάγετε το επώνυμό σας"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="conlogin-password" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="conlogin-password" id="conlogin-password"  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="email" id="email"  placeholder="Εισάγετε το e-mail σας"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="phone" class="cols-sm-2 control-label">Τηλέφωνο</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="phone" id="phone"  placeholder="Εισάγετε το τηλέφωνό σας"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="address" class="cols-sm-2 control-label">Διεύθυνση</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="address" id="address"  placeholder="Εισάγετε τη διεύθυνσή σας"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="ssn" class="cols-sm-2 control-label">ΑΜΚΑ</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="ssn" id="ssn"  placeholder="Εισάγετε το ΑΜΚΑ σας"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="birthdate" class="cols-sm-2 control-label">Ημερομηνία Γέννησης</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="birthdate" id="birthdate"  placeholder="dd/mm/yyyy"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="carrier" class="cols-sm-2 control-label">Ταμείο</label>
							<div class="cols-sm-10">
								<select class = "form-control" name="tameio" >
						
									<option value="IKA">"ΙΚΑ"</option>
									<option value="OGA">"ΟΓΑ"</option>
									<option value="OAEE">"ΟΑΕΕ"</option>
									<option value="OPAD">"ΟΠΑΔ"</option>
									<option value="TYDKY">"ΤΥΔΚΥ"</option>
									<option value="NAT">"ΝΑΤ"</option>
									<option value="TAYTEKW">"ΤΑΥΤΕΚΩ"</option>
									<option value="ETAA">"ΕΤΑΑ"</option>
									<option value="ETAP-MME">"ΕΤΑΠ-ΜΜΕ"</option>
									<option value="LIMENIKO">"ΛΙΜΕΝΙΚΟ"</option>
								</select>
							</div>
						</div>

						<div class="form-group ">
							<button type="submit" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</button>
							
						</div>

					</form>
				</div>
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

		 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	</body>
</html>
