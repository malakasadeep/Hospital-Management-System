package com.hms.user;

public class Appointment {
	
	private int id;
	private String department;
	private String docName;
	private String name;	
	private String email;
	private int age;
	private String diseases;
	private String date;
	private String time;
	
	public Appointment(int id, String department, String docName, String name, String email, int age, String diseases,
			String date, String time) {
		super();
		this.id = id;
		this.department = department;
		this.docName = docName;
		this.name = name;
		this.email = email;
		this.age = age;
		this.diseases = diseases;
		this.date = date;
		this.time = time;
	}

	public Appointment(String department, String docName, String name, String email, int age, String diseases,
			String date, String time) {
		super();
		this.department = department;
		this.docName = docName;
		this.name = name;
		this.email = email;
		this.age = age;
		this.diseases = diseases;
		this.date = date;
		this.time = time;
	}

	public int getId() {
		return id;
	}

	public String getDepartment() {
		return department;
	}

	public String getDocName() {
		return docName;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public int getAge() {
		return age;
	}

	public String getDiseases() {
		return diseases;
	}

	public String getDate() {
		return date;
	}

	public String getTime() {
		return time;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
