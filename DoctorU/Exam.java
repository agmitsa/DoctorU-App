package DoctorU;
import java.lang.String;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;


public class Exam{

	private String type;
	private String date;
	private static int id=0;
	private String ssn;
	private String eid;
	private String puser;
private String path;
	public Exam (String type, String date, String ssn, String path, String puser) {
			id++;
			this.ssn = ssn;
			this.type = type;
			this.date = date;
			eid = String.valueOf(this.id);

			this.path=path;
			this.puser=puser;


	}
	public Exam () {

	}

	public void setType(String type) {
			this.type = type;
	}
	public void setSsn(String ssn) {
				this.ssn = ssn;
	}

	public void setDate(String date) {
			this.date = date;
	}
public void setPath(String path) {
			this.path = path;
	}
	public void setEid(String eid) {
				this.eid = eid;
	}
	public void setPuser(String puser) {
					this.puser = puser;
	}

	public String getType(){

		 return this.type;
	}
	public String getSsn(){

			 return this.ssn;
	}
	public String getDate(){

		 return this.date;
	}

	public String getEid(){

		 return this.eid;
	}

	public String getPath() {
			return this.path;
		}
		public String getPuser() {
					return this.puser;
		}

}//end class