package com.hms.receptionist;

public class Doctor {
	
	private int id;
	private String name;	
	private String email;
	private String mobile;	
	private String dob;
	private String nic;
	private String qualification;	
	private String specialization;
	
	
	
	public Doctor(int id, String name, String email, String mobile, String dob, String nic, String qualification,
			String specialization) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.dob = dob;
		this.nic = nic;
		this.qualification = qualification;
		this.specialization = specialization;
	}
	
	
	
	public Doctor(String name, String email, String mobile, String dob, String nic, String qualification, String specialization) {
		super();
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.dob = dob;
		this.nic = nic;
		this.qualification = qualification;
		this.specialization = specialization;
	}



	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getMobile() {
		return mobile;
	}
	public String getDob() {
		return dob;
	}
	public String getNic() {
		return nic;
	}
	public String getQualification() {
		return qualification;
	}
	public String getSpecialization() {
		return specialization;
	}

}


