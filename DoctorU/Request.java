package DoctorU;

import java.lang.String;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.applet.Applet;


public class Request {

		public void insertRequest(String pusername, String dusername) throws SQLException{

			DB db = new DB();
			PreparedStatement stmt	= null;
			Connection con = null;

			String query1 = "INSERT INTO Pat_Doc (pusername, dusername, is_accepted) VALUES ( ? , ?, ?);";
					try{
						db.open();
						con = db.getConnection();
						stmt = con.prepareStatement(query1);

						stmt.setString(1, pusername);
						stmt.setString(2, dusername);
						stmt.setString(3, "0");

						stmt.executeUpdate();

						con.close();
						stmt.close();


					} catch (Exception e){
						System.out.println("Error: " + e.getMessage());
					}finally{
						db.close();
		}
			}

		public void acceptRequest(String pusername, String dusername) throws SQLException{

			DB db = new DB();
			PreparedStatement stmt	= null;
			Connection con = null;

			String query1 = "UPDATE Pat_Doc SET is_accepted = ? WHERE pusername = ? AND dusername = ?";
					try{
						db.open();
						con = db.getConnection();
						stmt = con.prepareStatement(query1);

						stmt.setString(1, "1");
						stmt.setString(2, pusername);
						stmt.setString(3, dusername);

						stmt.executeUpdate();

						con.close();
						stmt.close();


					} catch (Exception e){
						System.out.println("Error: " + e.getMessage());
					}finally{
						db.close();
		}


			}

		public void deleteRequest(String pusername, String dusername) throws SQLException{

			DB db = new DB();

			PreparedStatement stmt	= null;
			Connection con = null;

			String query1 = "DELETE FROM Pat_Doc WHERE pusername = ? AND dusername = ?";
			try{
				db.open();
				con = db.getConnection();
				stmt = con.prepareStatement(query1);

				stmt.setString(1, pusername);
				stmt.setString(2, dusername);

				stmt.executeUpdate();

				con.close();
				stmt.close();


			} catch (Exception e){
				System.out.println("Error: " + e.getMessage());
			}finally{
				db.close();
			}


			}

			public ArrayList<String> getPatdoc(String username)throws Exception{

				DB db = new DB();
				ArrayList<String> listdoc = new ArrayList<String>()  ;
				Connection con = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				String sql = "SELECT dusername FROM Pat_Doc WHERE pusername = ? AND is_accepted = ?;";

				try {
					db.open();
					con = db.getConnection();

					stmt = con.prepareStatement(sql);
					stmt.setString(1,username);
					stmt.setString(2,"0");
					rs = stmt.executeQuery();

					while(rs.next()) {

						String dusername = rs.getString("dusername");
						listdoc.add(dusername);


					}


					rs.close();
					stmt.close();
				} catch (Exception e) {
					System.out.println("Error: " + e.getMessage());
				}
				finally {
					db.close();

				}

			return listdoc;



}

		public ArrayList<String> getDocpat(String username)throws Exception{

			DB db = new DB();
			ArrayList<String> listfavpat = new ArrayList<String>()  ;
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String sql = "SELECT pusername FROM Pat_Doc WHERE dusername = ? AND is_accepted = ?;";

			try {
				db.open();
				con = db.getConnection();

				stmt = con.prepareStatement(sql);
				stmt.setString(1,username);
				stmt.setString(2,"1");
				rs = stmt.executeQuery();

				while(rs.next()) {

					String pusername = rs.getString("pusername");
					listfavpat.add(pusername);


				}


				rs.close();
				stmt.close();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
			finally {
				db.close();

			}

		return listfavpat;



		}





}