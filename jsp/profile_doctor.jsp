<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="DoctorU.*" %>
<%@ page errorPage="error_page.jsp"%>  
<%@ page import ="javax.servlet.http.*"%>

<%--HttpServletResponse httpResponse = (HttpServletResponse) response; sto back den epitrepei na emfanistei h selida--%>
<%--httpResponse.setHeader("Pragma", "no-cache");--%>
<%
Doctor doctor=(Doctor)(session.getAttribute("member"));



String mess = "You are not authorized to access this resource. Please login."+session.getAttribute("member") ;

	
if (session.getAttribute("member")==null) {
	request.setAttribute("message", mess);
	%>
	<jsp:forward page="login.jsp"/>

<% } else {%>

<!DOCTYPE html>
<html>
	<head>
		
		<title>Μενού</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="shortcut icon" href="images/doctorU.png" type="image/png">
		<link rel="stylesheet" type="text/css" href="css/cssback.css">
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

    <li class="active"><a href="profile_doctor.jsp">Προφίλ</a></li>
    <li><a href="search_patient.jsp">Αρχείο ασθενών</a></li>
	<li><a href="my_list.jsp">Η λίστα μου <span class="glyphicon glyphicon-star" aria-hidden="true"></span></a></li>
  </ul>
  <br>
  <p></p>
</div>

<div class="container">
      <div class="row">
    
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >


          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title"><%=doctor.getName()%>  <%=doctor.getSurname()%></h3>
            </div>
            <div class="panel-body">
              <div class="row">

               
                <div class=" col-md-9 col-lg-9 ">
                  <table class="table table-user-information">
                    <tbody>
					<tr>
                        <td>username: </td>
                        <td><%=doctor.getDusername()%></td>
                      </tr>
					<tr>
                        <td>Ημ. γέννησης:</td>
                        <td><%=doctor.getBirthdate()%></td>
                      </tr>
					  <tr>
							<td>AMKA:</td>
							<td><%=doctor.getAmka()%></td>
						</tr>
                      <tr>
                        <td>Ταμείο:</td>
                        <td><%=doctor.getTameio()%></td>
                      </tr>
					  <tr>
                        <td>Νοσοκομείο/Κλινική:</td>
                        <td><%=doctor.getHospital()%></td>
                      </tr>
					  <tr>
							<td>Διεύθυνση Νοσοκομείου:</td>
							<td><%=doctor.getHos_address()%></td>
						</tr>
						<tr>
                        <td>Ειδικότητα:</td>
                        <td><%=doctor.getSpecialization()%></td>
                      </tr>
					  
                      <tr>
                        <td>E-mail:</td>
                        <td><%=doctor.getEmail()%></td>
                      </tr>
                      

                      <tr>
						
                        
						
                        <td>Τηλέφωνο</td>
                        <td><%=doctor.getPhone()%></td>

                      </tr>
					  <tr>
                        <td>Fax:</td>
                        <td><%=doctor.getFax()%></td>
                      </tr>
					  		  

                    </tbody>
                  </table>

                </div>
              </div>
            </div>
                 

          </div>
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


		<script src="js/jquery.min.js"></script>
	
	<script src="js/bootstrap.min.js"></script>

	</body>


</html>
<%
}
%>