package DoctorU;

import java.lang.String;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Patient extends User{

	 private String pusername ;
	 private String address;

	 private static int pid = 0;

	public Patient() {}

	public Patient (String amka, String name, String surname, String tameio, String birthdate, String phone, String email, String password, String address) {
			super(amka, name, surname, tameio, birthdate, phone, email, password);
			pid++;
			pusername= 'p'+ String.valueOf(this.pid);
			this.pusername = pusername;
			this.address = address;


	}
	public void setPid(int pid) {
			this.pid = pid;
	}

	public void setPusername(String pusername) {

		this.pusername = pusername;
	}

	public void setAddress(String address) {
						this.address = address;
	}


	public String getAddress(){

		 return this.address;
	}


	public String getPusername(){

		 return this.pusername;
	}



	public int getPid(){

				 return this.pid;
		}


	public void authenticate(String username, String password) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM Patient  WHERE (pusername =? and psswrd=?);";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setString( 1, username );
			stmt.setString( 2, password );

			ResultSet rs = stmt.executeQuery();

			if(!rs.next()) {
				rs.close();
				stmt.close();
				db.close();

				throw new Exception("Wrong username or password");
			}

			rs.close();
			stmt.close();
			db.close();

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {
				//no need to do anything...
			}

		}
	}





}