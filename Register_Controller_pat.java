import DoctorU.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;


public class Register_Controller_pat extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

	response.setContentType("text/html; charset=ISO-8859-7");
    PrintWriter out = new PrintWriter(response.getWriter(), true);
    HttpSession session = request.getSession();

	RequestDispatcher errorCaseDispatcher = request.getRequestDispatcher("../register_patient.jsp");
	RequestDispatcher successCaseDispatcher = request.getRequestDispatcher("../profile_patient.jsp");

     String name = request.getParameter("name");
     String surname = request.getParameter("surname");
     String email = request.getParameter("email");
     String password = request.getParameter("password");
     String conpassword = request.getParameter("conlogin-password");
     String amka= request.getParameter("ssn");
     String phone= request.getParameter("phone");
     String tameio= request.getParameter("tameio");
     String birthdate= request.getParameter("birthdate");
      String address = request.getParameter("address");


     String errormsg = "";
     String fullname = name + " " + surname;
     if(!fullname.matches("^[\\p{L} .'-]+$")) {
     errormsg += "�� �������� ��� �������� ��� ����� ������������� ��� ����� ������<br>";
     }

     if(fullname == null || name.length() == 0) {

     errormsg +=  " ��� ����� ����������� �� ����� �������������<br>";

     }


     if(fullname.matches(".*\\d+.*")) {
     errormsg += " �� ������������� ��� ������ �� �������� ��������<br>";
     }

     if(!email.matches("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$")) {
     errormsg += "�� �������� ��� �������� ��� ����� email ��� ����� ������<br>";
     }
     if(email == null || email.length() == 0) {

     errormsg +=  " ��� ����� ����������� �� ����� ����������� ���������<br>";

     }

     if(password == null || password.length() == 0) {

     errormsg += " ��� ����� ����������� �� ����� ������� ���������<br>";

     }


     if(!(password.matches("[A-Za-z0-9_]+"))&&(!(password.matches(".*\\d+.*")))&&(!(password == null || password.length() == 0))) {
     errormsg += " �� �������� ��� �������� ��� ����� ������� ��������� ��� ����� ������<br>";
     }

     if(conpassword == null || conpassword.length() == 0) {

     errormsg +=  " ��� ����� ����������� �� ����� ����������� ������� ���������<br>";

     }


     if(!(conpassword.equals(password))&&(!(password == null || password.length() == 0))&&(!(conpassword == null || conpassword.length() == 0))) {

     errormsg += " �� ������� ��������� ��� ����������<br>";

     }

     if(!(conpassword.matches("[A-Za-z0-9_]+"))&&(!(conpassword.matches(".*\\d+.*")))&&(!(conpassword == null || conpassword.length() == 0))) {
     errormsg +=  " �� �������� ��� �������� ��� ����� ����������� ������� ��������� ��� ����� ������<br>";
     }


  	if ( (amka.length() !=11) || (amka == null)) {
			   			errormsg +=  " ��� ����� ����������� �� ����� AMKA/ To ����� ���� ������ �� �������� 11 �����<br>";

		   		}
  	if(!phone.matches("[0-9]{10}")) {
     errormsg += "�� �������� ��� �������� ��� ����� �������� ��� ����� ������<br>";
     }

     if(phone == null || phone.length() == 0) {

     errormsg +=  " ��� ����� ����������� �� ����� ��������<br>";

     }
     if(tameio == null ) {

     errormsg +=  " ��� ����� �������� ������<br>";

     }
  		if(!birthdate.matches("^(0?[1-9]|[12][0-9]|3[01])(\\/|-|\\.)(0?[1-9]|1[012])(\\/|-|\\.)((19|20)\\d\\d)$")) {
     errormsg += "�� �������� ��� �������� ��� ����� ���������� �������� ��� ����� ������<br>";
     }

     if(birthdate == null || birthdate.length() == 0) {

     errormsg +=  " ��� ����� ����������� �� ����� ���������� ��������<br>";

     }



  	   if(address.matches("/^[�-�]+\\s\\d+\\s[�-�]/")) {

  			errormsg +=  " �� �������� ��� �������� ��� ����� ��������� ��� ����� ������<br>";
  		}

  		if(address == null || address.length() == 0) {

  			errormsg +=  " ��� ����� ����������� �� ����� ���������<br>";

  		}

		//out.println("errormsg: " + errormsg);

  	if(errormsg != ""){
  			//request.setAttribute("message", errormsg);
			//request.getAttribute("message");
			//out.println("errormsg: " + errormsg);

			//response.sendRedirect("../register_patient.jsp");
			out.println("<!DOCTYPE html>");
			out.println("<html lang='en'>");
			out.println("    <head>");
			out.println("		<meta name='viewport' content='width=device-width, initial-scale=1'>");
			out.println("");
			out.println("");
			out.println("		<!-- Website CSS style -->");
			out.println("		<link href='css/bootstrap.min.css' rel='stylesheet'>");
			out.println("");
			out.println("		<!-- Website Font style -->");
			out.println("	    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css'>");
			out.println("		<link rel='stylesheet' href='style.css'>");
			out.println("		<!-- Google Fonts -->");
			out.println("		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>");
			out.println("		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>");
			out.println("");
			out.println("");
			out.println("");
			out.println("		<meta charset='utf-8'>");
			out.println("");
			out.println("		<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>");
			out.println("		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("		<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>");
			out.println("		<link rel='stylesheet' type='text/css' href='../css/cssback.css'>");
			out.println("	</head>");
			out.println("	<body>");
			out.println("	<div class='alert alert-danger' role='alert'>" + errormsg +" </div>");
			out.println("			<div class='col-sm-offset-5 col-sm-10'>");
			out.println("				<a href=../register_doctor.jsp>");
			out.println("					<button type='button' class='btn btn-primary btn-lg'><span class='glyphicon glyphicon-chevron-left'></span>Back to the Register page</button><br><br><br>");
			out.println("				</a>");
			out.println("			</div>");
			out.println("<footer class='navbar-default'>");
			out.println("			<div class='container'>");
			out.println("				<div class='row'>");
			out.println("					<div class='col-xs-12'>");
			out.println("						<p class='text-center'>&copy; Copyright 2017 by ismgroup52</p>");
			out.println("					</div>");
			out.println("				</div>");
			out.println("			</div>");
			out.println("		</footer>");
			out.println("");
			out.println("		 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->");
			out.println("    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>");
			out.println("    <!-- Include all compiled plugins (below), or include individual files as needed -->");
			out.println("    <script src='js/bootstrap.min.js'></script>");

			out.println("	</body>");
			out.println("</html>");

		}else{
			try{
				Patient patient = new Patient(amka, name, surname,  tameio, birthdate, phone, email, password,  address);
				PatientDAO patdao = new PatientDAO();
				patdao.updatePatientBase(patient);
				session.setAttribute("member", patient);
				response.sendRedirect("../profile_patient.jsp");
				//successCaseDispatcher.forward(request, response);
				}catch (Exception e){
					out.println( "ERROR: " + e.getMessage() );

				}




		}
	}
}