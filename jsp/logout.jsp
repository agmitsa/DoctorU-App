<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page errorPage="error_page.jsp"%>    
<%@ page import="DoctorU.*" %>


<%

User user=(User)(session.getAttribute("member"));
	session.invalidate();
%>
	

<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta http-equiv="refresh" content="1;url=login.jsp" />
	<link rel="shortcut icon" href="images/doctorU.png" type="image/png">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="log out page">

	
	<title>logout-page</title>
	
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">

	<!-- Custom styles for this template -->
	<link href="css/cssback.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	</head>
<body>

	<!-- Fixed navbar -->
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

	<div class="container theme-showcase position-absolute" role="main">
	
		<div class="row"><p></p>
		</div>
		<div class="row"><p></p>
		</div>
		<div class="row"><p></p>
		</div>
		<div class="row"><p></p>
		</div>
		<div class="row"><p></p>
		</div>
		<div class="row">
			<div class="alert alert-success text-center" role="alert">Η έξοδος πραγματοποιηθηκε με επιτυχία</div>		
		</div>
	</div>
	<!-- /container -->

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

	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script	src="js/bootstrap.min.js"></script>
	
</body>
</html>
