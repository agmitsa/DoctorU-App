import DoctorU.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Register_Controller_doc extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

	response.setContentType("text/html; charset=ISO-8859-7");
    PrintWriter out = new PrintWriter(response.getWriter(), true);
    HttpSession session = request.getSession();

    RequestDispatcher errorCaseDispatcher = request.getRequestDispatcher("../register_doctor.jsp");
	RequestDispatcher successCaseDispatcher = request.getRequestDispatcher("../profile_doctor.jsp");


     String name = request.getParameter("name");
     String surname = request.getParameter("surname");

     String password = request.getParameter("password");
     String conpassword = request.getParameter("conlogin-password");
     String email = request.getParameter("email");
     String amka= request.getParameter("amka");
     String phone= request.getParameter("phone");
     String tameio= request.getParameter("tameio");
     String haddress=request.getParameter("haddress");
     String birthdate= request.getParameter("birthdate");
     String fax= request.getParameter("fax");
	 String special= request.getParameter("special");
	 String hospital= request.getParameter("hospital");

		//DataValidation dv = new DataValidation();

     String errormsg = "";
     String fullname = name + " " + surname;

     try {

				if(!fullname.matches("^[\\p{L} .'-]+$")) {
					errormsg += "Τα στοιχεία που εισάγατε στο πεδίο Ονοματεπώνυμο δεν είναι έγκυρα<br>";
		      	}

		      if(fullname == null || name.length() == 0) {

		      	errormsg +=  " Δεν έχετε συμπληρώσει το πεδίο Ονοματεπώνυμο<br>";

		      }


		      if(fullname.matches(".*\\d+.*")) {
		      errormsg += " Το Ονοματεπώνυμο δεν πρέπει να περιέχει αριθμούς<br>";
		      }

		     if(!email.matches("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$")) {
		      errormsg += "Τα στοιχεία που εισάγατε στο πεδίο email δεν είναι έγκυρα<br>";
		      }
		      if(email == null || email.length() == 0) {

		      errormsg +=  " Δεν έχετε συμπληρώσει το πεδίο Ηλεκτρονική Διεύθυνση<br>";

		      }



		      if(password == null || password.length() == 0) {

		      errormsg += " Δεν έχετε συμπληρώσει το πεδίο Κωδικός Πρόσβασης<br>";

		      }


		      if(!(password.matches("[A-Za-z0-9_]+"))&&(!(password.matches(".*\\d+.*")))&&(!(password == null || password.length() == 0))) {
		      errormsg += " Τα στοιχεία που εισάγατε στο πεδίο Κωδικός Πρόσβασης δεν είναι έγκυρα<br>";
		      }

		      if(conpassword == null || conpassword.length() == 0) {

		      errormsg +=  " Δεν έχετε συμπληρώσει το πεδίο Επιβεβαίωση Κωδικού Πρόσβασης<br>";

		      }


		      if(!(conpassword.equals(password))||(password == null || password.length() == 0)||(conpassword == null || conpassword.length() == 0)) {

		      errormsg += " Οι κωδικοί πρόσβασης δεν συμπίπτουν<br>";

		      }

		      if(!(conpassword.matches("[A-Za-z0-9_]+"))&&(!(conpassword.matches(".*\\d+.*")))&&(!(conpassword == null || conpassword.length() == 0))) {
		      errormsg +=  " Τα στοιχεία που εισάγατε στο πεδίο Επιβεβαίωση Κωδικού Πρόσβασης δεν είναι έγκυρα<br>";
		      }



		   		if ( (amka.length() !=11) || (amka == null)) {
		   			errormsg +=  " Δεν έχετε συμπληρώσει το πεδίο AMKA/ To πεδίο ΑΜΚΑ πρέπει να περιέχει 11 ψηφία<br>";

		   		}

		   		if(!phone.matches("[0-9]{10}")) {
		      errormsg += "Τα στοιχεία που εισάγατε στο πεδίο τηλέφωνο δεν είναι έγκυρα<br>";
		      }

		      if(phone == null || phone.length() == 0) {

		      errormsg +=  " Δεν έχετε συμπληρώσει το πεδίο Τηλέφωνο<br>";

		      }
		      if(tameio == null ) {

		      errormsg +=  " Δεν έχετε επιλέξει ταμείο<br>";

		      }

		   		if(!birthdate.matches("^(0?[1-9]|[12][0-9]|3[01])(\\/|-|\\.)(0?[1-9]|1[012])(\\/|-|\\.)((19|20)\\d\\d)$")) {
		      errormsg += "Τα στοιχεία που εισάγατε στο πεδίο Ημερομηνία Γέννησης δεν είναι έγκυρα<br>";
		      }

		      if(birthdate == null || birthdate.length() == 0) {

		      errormsg +=  " Δεν έχετε συμπληρώσει το πεδίο Ημερομηνία Γέννησης<br>";

		      }




		   	  /*^([Ά-Ώά-ώ]?|[Α-Ωα-ω]?)+$ αυτο είναι για μια λεξη με τονους και κενο χωρις αριθμους και συμβολα
		   	  ^([Ά-Ώά-ώ]+?[ ]?|[Α-Ωα-ω]?)+$ αυτο ειναι για δυο λεξεις με τονους και κενο χωρις αριθμους και συμβολα
		   	  if(!special.matches("^([Ά-Ώά-ώ]+?|[Α-Ωα-ω]?)+$")) {

		   			errormsg +=  " Τα στοιχεία που εισάγατε στο πεδίο Ειδικότητα δεν είναι έγκυρα<br>";
		   		}*/

		   		if(special == null || special.length() == 0) {

		   			errormsg +=  " Δεν έχετε συμπληρώσει το πεδίο Ειδικότητα<br>";


		   		}

		   	   if(hospital.matches(" ^([Ά-Ώά-ώ]+?[ ]?|[Α-Ωα-ω]?)+$")) {

		   			errormsg +=  " Τα στοιχεία που εισάγατε στο πεδίο Νοσοκομείο/Κλινική δεν είναι έγκυρα<br>";
		   		}

		   		if(hospital == null || hospital.length() == 0) {

		   			errormsg +=  " Δεν έχετε συμπληρώσει το πεδίο Νοσοκομείο/Κλινική<br>";

		   		}
				//^[Ά-ώ]+\s\d+\s[Ά-ώ] αντιστοιχει διευθυνση με input πχ Αρήτης 25 Βύρωνας
		   	    if(haddress.matches("/^[Ά-ώ]+\\s\\d+\\s[Ά-ώ]/")) {

		   			errormsg += " Η διεύθυνση του νοσοκομείου δεν είναι εγκυρη<br>";
		   		}
		   		if(haddress == null || haddress.length() == 0) {

		   			errormsg +=  " Δεν έχετε συμπληρώσει το πεδίο Διεύθυνση Νοσοκομείου<br>";

		   		}
				if(errormsg != ""){
				  			//request.setAttribute("message", errormsg);
							//request.getAttribute("message");
							//out.println("errormsg: " + errormsg);

							//response.sendRedirect("../register_doctor.jsp");
							//errorCaseDispatcher.forward(request, response);
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
		 				DoctorDAO doctordao = new DoctorDAO();
		 				Doctor doctor = new Doctor(amka, name,surname, tameio, birthdate, phone, email, password, special, hospital, haddress, fax);
		 				doctordao.updateDoctorBase(doctor);
		 				session.setAttribute("member", doctor) ;

		 				//out.println("errormsg: " + errormsg);

						response.sendRedirect("../profile_doctor.jsp");
						//successCaseDispatcher.forward(request, response);
					}catch (Exception e){
							out.println( "ERROR: " + e.getMessage() );

					}

				}

			} catch(Exception e) {
				out.println( "ERROR: " + e.getMessage() );
			}

	}
}