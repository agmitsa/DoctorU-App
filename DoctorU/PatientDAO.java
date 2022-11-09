package DoctorU;
import java.lang.String;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class PatientDAO {

	public PatientDAO (){}

	public void updatePatientBase(Patient patient)throws SQLException{ //kataxwrhsh newn asthenwn

			DB db = new DB();
			PreparedStatement stmt	= null;
			Connection con = null;

			String query1 = "INSERT INTO Patient(ssn,pusername,psswrd, name, surname, insurance, birthdate, phone, email, address) VALUES (?, ? ,?, ?, ?, ?, ?, ?, ?, ?);";

			try{
				db.open();
				con = db.getConnection();
				stmt = con.prepareStatement(query1);

				stmt.setString(1, patient.getAmka());
				stmt.setString(2, patient.getPusername());
				stmt.setString(3, patient.getPassword());
				stmt.setString(4, patient.getName());
				stmt.setString(5, patient.getSurname());
				stmt.setString(6, patient.getTameio());
				stmt.setString(7, patient.getBirthdate());
				stmt.setString(8, patient.getPhone());
				stmt.setString(9, patient.getEmail());
				stmt.setString(10, patient.getAddress());

				stmt.executeUpdate();

				stmt.close();
				con.close();
				} catch (Exception e){
					System.out.println("Error: " + e.getMessage());
				}finally{
					db.close();
				}


		}
		public Patient getPatient(String username)throws Exception{
					Patient patient= null;
					DB db = new DB();
					Connection con = null;
					PreparedStatement stmt = null;
					ResultSet rs = null;
					String sql = "SELECT * FROM Patient WHERE pusername = ?";

					try {
						db.open();
						con = db.getConnection();


						stmt = con.prepareStatement(sql);
						stmt.setString(1,username);
						rs = stmt.executeQuery();
						while (rs.next()) {

							String ssn = rs.getString("ssn");
							String name  = rs.getString("name");
							String surname = rs.getString("surname");
							String insurance = rs.getString("insurance");
							String birthdate = rs.getString("birthdate");
							String phone = rs.getString("phone");
							//String password = rs.getString("psswrd");
							String email = rs.getString("email");
							String address = rs.getString("address");
							String pusername =  rs.getString("pusername");

							patient=new Patient();
							patient.setAmka(ssn);
							patient.setTameio(insurance);
							patient.setName(name);
							patient.setSurname(surname);
							patient.setBirthdate(birthdate);
							patient.setPhone(phone);
							patient.setEmail(email);
							patient.setPusername(pusername);
							patient.setAddress(address);


						}


						rs.close();
						stmt.close();
					} catch (Exception e) {
						System.out.println("Error: " + e.getMessage());
					}
					finally {
						db.close();

					}
					return patient;

			}


}