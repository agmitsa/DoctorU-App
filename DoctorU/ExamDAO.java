package DoctorU;
import java.lang.String;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class ExamDAO {

	public ExamDAO (){}

		public void updateExamBase(String eid,String etype,String edate, String ssn, String path, String puser) throws Exception{

						//enhmerwnei thn bash otan prostithetai mia exam

						DB db = new DB();

						PreparedStatement stmt	= null;

						Connection con = null;

						String query1 = "INSERT INTO Exams(eid,etype,edate,ssn,path,puser) VALUES ( ? ,?, ?, ?, ?,?);";

						try{
							db.open();
							con = db.getConnection();
							stmt = con.prepareStatement(query1);

							stmt.setString(1, eid);
							stmt.setString(2, etype);
							stmt.setString(3, edate);
							stmt.setString(4, ssn);
							stmt.setString(5, path);
							stmt.setString(6, puser);
							stmt.executeUpdate();
							stmt.close();

						} catch (Exception e){
							System.out.println("Error: " + e.getMessage());
						}finally{
							db.close();
						}

								//anoigei th bash kai kanei ena executequery kai emfanizei tis eksetaseis tou asthenh
								//tha dhmiourgei antikeimeno Patient

		}




		public ArrayList<Exam> searchExams(String inputforsearch, String ssn){
			//anoigei th bash kai psaxnei tis exetaseiw me ta key pou edwse o xrhsths

			DB db = new DB();

			PreparedStatement stmt	= null;
			ArrayList<Exam> listexam = new ArrayList<Exam>()  ;
			ResultSet rs= null;

			Connection con = null;
			String eid=null;
			String etype, edate, path, puser=null;

			//if(inputforsearch.contains(" ")){
				//String[] splited = inputforsearch.split(" ");
			//}


				String query1 = "SELECT * FROM Exams  WHERE  (eid = ? or etype = ?  or edate=? or puser=?) AND ssn=?;";
				try{
					db.open();
					con = db.getConnection();
					stmt = con.prepareStatement(query1);
					stmt.setString(1,inputforsearch);
					stmt.setString(2,inputforsearch);
					stmt.setString(3,inputforsearch);
					stmt.setString(4,inputforsearch);
					stmt.setString(5,ssn);

					rs = stmt.executeQuery();
					while(rs.next()){

						eid = rs.getString("eid");
						etype  = rs.getString("etype");
						edate = rs.getString("edate");
						path = rs.getString("path");
						puser = rs.getString("puser");

						Exam exam = new Exam();
						exam.setEid(eid);
						exam.setType(etype);
						exam.setDate(edate);
						exam.setSsn(ssn);
						exam.setPath(path);
						exam.setPuser(puser);
						listexam.add(exam);
					}

					//}else{
					//	throw new Exception("Could not find Patient with type or date:" + inputforsearch );
					//}

					rs.close();
					stmt.close();
					db.close();
				} catch (Exception e){
					e.getMessage();
				}finally{
					return listexam;
				}
			}//end searchexam


				public ArrayList<Exam> getExams(String ssn){
					//anoigei th bash kai psaxnei oles tis exetaseiw tou asthenh

					DB db = new DB();

					PreparedStatement stmt	= null;
					ArrayList<Exam> listexam = new ArrayList<Exam>()  ;
					ResultSet rs= null;

					Connection con = null;
					String eid=null;
					String etype, edate, path, puser=null;

					//if(inputforsearch.contains(" ")){
						//String[] splited = inputforsearch.split(" ");
					//}


					String query1 = "SELECT * FROM Exams  WHERE  ssn=?;";
					try{
						db.open();
						con = db.getConnection();
						stmt = con.prepareStatement(query1);
						stmt.setString(1,ssn);


						rs = stmt.executeQuery();
						while(rs.next()){

							eid = rs.getString("eid");
							etype  = rs.getString("etype");
							edate = rs.getString("edate");
							path = rs.getString("path");
							puser = rs.getString("puser");

							Exam exam = new Exam();
							exam.setEid(eid);
							exam.setType(etype);
							exam.setDate(edate);
							exam.setSsn(ssn);
							exam.setPath(path);
							exam.setPuser(puser);
							listexam.add(exam);
						}



						rs.close();
						stmt.close();
						db.close();
					} catch (Exception e){
						e.getMessage();
					}finally{
						return listexam;
					}
		}//end searchexam
	//getexamlist() methodos return olh thn lista twn ejetasevn



}
