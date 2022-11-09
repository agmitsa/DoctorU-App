create table Patient(
  	ssn VARCHAR(11),
  	pusername VARCHAR(30),
 	psswrd VARCHAR(50),
  	name VARCHAR(30),
  	surname VARCHAR(50),
  	insurance VARCHAR(10),
  	birthdate VARCHAR(10),
  	phone VARCHAR(10),
  	email VARCHAR(30),
  	address VARCHAR(50),
  	PRIMARY KEY(pusername) );


create table Doctor(
	ssn VARCHAR(11),
  	dusername VARCHAR(30),
  	psswrd VARCHAR(30),
  	name VARCHAR(30),
  	surname VARCHAR(50),
  	carrier VARCHAR(10),
  	birthdate VARCHAR(10),
  	special VARCHAR(40),
  	fax VARCHAR(10),
  	hospital VARCHAR(30),
  	hos_address VARCHAR(30),
  	phone VARCHAR(10),
  	email VARCHAR(30),
  	PRIMARY KEY(dusername) );


create table Pat_Doc(
  	pusername VARCHAR(30),
  	dusername VARCHAR(30),
	is_accepted int,
  	PRIMARY KEY(dusername,pusername),
  	CONSTRAINT FOREIGN KEY(pusername) References Patient (pusername) ON DELETE CASCADE ON UPDATE CASCADE ,
  	CONSTRAINT FOREIGN KEY(dusername)References Doctor (dusername) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Exams(
  	eid VARCHAR(20),
  	etype VARCHAR(20),
  	edate VARCHAR(10),
  	ssn VARCHAR(30),
	path VARCHAR(600),
	puser VARCHAR(30),
  	PRIMARY KEY(eid),
	CONSTRAINT FOREIGN KEY(puser) References Patient (pusername) ON DELETE CASCADE ON UPDATE CASCADE 
);


