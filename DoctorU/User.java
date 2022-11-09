package DoctorU;

import java.lang.String;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class User{

	protected String amka;
	protected String name;
	protected String surname;
	protected String tameio;
	protected String birthdate;
	protected String phone;
	protected String email;
	protected String password;

	public User (String amka, String name, String surname, String tameio, String birthdate, String phone, String email, String password){
		this.amka = amka;
		this.name = name;
		this.surname = surname;
		this.tameio = tameio;
		this.birthdate = birthdate;
		this.phone = phone;
		this.email = email;
		this.password = password;
	}

	public User(){}

	public void setAmka(String amka) {
		this.amka = amka;
	}

	public String getAmka(){
		return this.amka;
	}

	public void setName(String name) {
			this.name = name;
	}

	public void setSurname(String surname) {
				this.surname = surname;
	}

	public void setTameio(String tameio) {
				this.tameio = tameio;
	}

	public void setBirthdate(String birthdate) {
				this.birthdate = birthdate;
	}

	public void setPhone(String phone) {
				this.phone = phone;
	}

	public void setEmail(String email) {
				this.email = email;
	}

	public void setPassword(String password) {
				this.password = password;
	}

	public String getName() {
			return name;
	}

	public String getSurname() {
				return surname;
	}

	public String getTameio() {
				return tameio;
	}

	public String getBirthdate() {
				return birthdate;
	}

	public String getPhone() {
				return phone;
	}

	public String getEmail() {
				return email;
	}

	public String getPassword() {
				return password;
	}




}