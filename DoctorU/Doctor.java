package DoctorU;
import java.lang.String;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Doctor extends User{

	 private String dusername ;
	 private String specialization;
	 private String hospital;
	 private String hos_address;
	 private String fax;
	 private static int did = 0;


	public Doctor (String amka, String name, String surname, String tameio, String birthdate, String phone, String email, String password, String specialization, String hospital, String hos_address, String fax) {
		super(amka, name, surname,tameio,birthdate, phone, email, password);
		did++;
		dusername = 'd' + String.valueOf(this.did);
		this.dusername = dusername;
		this.specialization = specialization;
		this.hospital = hospital;
		this.hos_address = hos_address;
		this.fax = fax;


	}
	public Doctor (){}

	public void setDid(int did) {
				this.did = did;
	}

	public void setDusername(String dusername) {

			this.dusername = dusername;
	}

	public void setSpecialization(String specialization) {
			this.specialization = specialization;
	}


	public void setHospital(String hospital) {
			this.hospital = hospital;
	}
	public void setHos_address(String hos_address) {
			this.hos_address = hos_address;
	}

	public void setFax(String fax) {
			this.fax = fax;
	}


	public String getDusername(){

			return this.dusername;
	}

	public String getSpecialization(){

			return this.specialization;
	}


	public String getHospital(){

			return this.hospital;
	}

	public String getHos_address(){

			return this.hos_address;
	}

	public String getFax(){

			return this.fax;
	}

	public int getDid(){

			return this.did;
	}

	public void authenticate(String username, String password) throws Exception {

		Connection con = null;

		String sqlquery= "SELECT * FROM Doctor  WHERE (dusername=? AND psswrd=? );";

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