package DoctorU;
import java.lang.String;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class DoctorDAO {

public DoctorDAO (){}

	public void updateDoctorBase(Doctor doctor) throws SQLException {

		DB db = new DB();
		PreparedStatement stmt	= null;
		Connection con = null;

		String query1 = "INSERT INTO Doctor (ssn, dusername, psswrd, name, surname, carrier, birthdate, special, fax, hospital, hos_address, phone, email) VALUES ( ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try{
			db.open();
			con = db.getConnection();
			stmt = con.prepareStatement(query1);

			stmt.setString(1, doctor.getAmka());
			stmt.setString(2, doctor.getDusername());
			stmt.setString(3, doctor.getPassword());
			stmt.setString(4, doctor.getName());
			stmt.setString(5, doctor.getSurname());
			stmt.setString(6, doctor.getTameio());
			stmt.setString(7, doctor.getBirthdate());
			stmt.setString(8, doctor.getSpecialization());
			stmt.setString(9, doctor.getFax());
			stmt.setString(10, doctor.getHospital());
			stmt.setString(11, doctor.getHos_address());
			stmt.setString(12, doctor.getPhone());
			stmt.setString(13, doctor.getEmail());

			stmt.executeUpdate();

			con.close();
			stmt.close();


		} catch (Exception e){
			System.out.println("Error: " + e.getMessage());
		}finally{
			db.close();
		}

	}


		public Doctor getDoctor(String username)throws Exception{
			Doctor doctor = null;
			DB db = new DB();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM Doctor WHERE dusername = ?";

			try {
				db.open();
				con = db.getConnection();


				stmt = con.prepareStatement(sql);
				stmt.setString(1,username);
				rs = stmt.executeQuery();

				while(rs.next()) {

					String ssn = rs.getString("ssn");
					String name  = rs.getString("name");
					String surname = rs.getString("surname");
					String birthdate = rs.getString("birthdate");
					String phone = rs.getString("phone");
					//String password = rs.getString("psswrd");
					String specialization = rs.getString("special");
					String carrier = rs.getString("carrier");
					String hospital = rs.getString("hospital");
					String hos_address = rs.getString("hos_address");
					String fax = rs.getString("fax");
					String email = rs.getString("email");
					String dusername =  rs.getString("dusername");

					doctor=new Doctor();
					doctor.setAmka(ssn);
					doctor.setName(name);
					doctor.setSurname(surname);
					doctor.setBirthdate(birthdate);
					doctor.setPhone(phone);
					doctor.setSpecialization(specialization);
					doctor.setTameio(carrier);
					doctor.setHospital(hospital);
					doctor.setHos_address(hos_address);
					doctor.setFax(fax);
					doctor.setEmail(email);
					doctor.setDusername(dusername);




				}


				rs.close();
				stmt.close();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
			finally {
				db.close();

			}

		return doctor;



		}

		public ArrayList<Patient> searchPat(String inputforsearch) throws Exception{
			DB db = new DB();

			PreparedStatement stmt	= null;
			ArrayList<Patient> listpat = new ArrayList<Patient>()  ;
			ResultSet rs= null;
			Patient patient = null;
			Connection con = null;
			String name1 = null;
			String surname1 = null;

			if(inputforsearch.contains(" ")){
				String[] splited = inputforsearch.split(" ");
				name1=splited[0];
				surname1=splited[1] ;
			}

			if (name1!=null && surname1!=null) {
				String query1 = "SELECT * FROM Patient  WHERE name = ? and surname =?;";
				try{
					db.open();
					con = db.getConnection();
					stmt = con.prepareStatement(query1);
					stmt.setString(1,name1);
					stmt.setString(2,surname1);

					rs = stmt.executeQuery();
					while(rs.next()){

						String ssn = rs.getString("ssn");
						String name  = rs.getString("name");
						String surname = rs.getString("surname");
						String insurance = rs.getString("insurance");
						String birthdate = rs.getString("birthdate");
						String phone = rs.getString("phone");
						String password = rs.getString("psswrd");
						String email = rs.getString("email");
						String address = rs.getString("address");

						patient = new Patient(ssn,name, surname, insurance, birthdate, phone, email, password,address);
						listpat.add(patient);

					}
						rs.close();
						stmt.close();
						db.close();
					} catch (Exception e){
						e.getMessage();
					}finally{
						return listpat;
					}
				}else {
						String query1 = "SELECT * FROM Patient  WHERE ssn = ? or name = ? or surname = ?; ";
						try{
							db.open();

							String inputforsearch1=inputforsearch;
							String inputforsearch2=inputforsearch;
							String inputforsearch3=inputforsearch;

							con = db.getConnection();

							stmt = con.prepareStatement(query1);

							stmt.setString(1,inputforsearch1);

							stmt.setString(2,inputforsearch2);

							stmt.setString(3,inputforsearch3);


							rs = stmt.executeQuery();

							while(rs.next()){

								String ssn = rs.getString("ssn");
								System.out.println(ssn);
								String name  = rs.getString("name");
								System.out.println(name);
								String surname = rs.getString("surname");
								System.out.println(surname);
								String insurance = rs.getString("insurance");
								System.out.println(insurance);
								String birthdate = rs.getString("birthdate");
								System.out.println(birthdate);
								String phone = rs.getString("phone");
								System.out.println(phone);
								String password = rs.getString("psswrd");
								System.out.println(password);
								String email = rs.getString("email");
								System.out.println(email);
								String address = rs.getString("address");
								System.out.println(address);

								patient = new Patient(ssn,name, surname, insurance, birthdate, phone, email, password,address);
								listpat.add(patient);

							}


							rs.close();
							stmt.close();
							db.close();
						} catch (Exception e){
							e.getMessage();
						}finally{


								return listpat;

						}



				}
	}
}