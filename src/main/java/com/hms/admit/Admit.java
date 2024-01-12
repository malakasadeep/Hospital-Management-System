package com.hms.admit;

public class Admit {
	
	private int id;
	private String name;	
	private String age;
	private String mobile;	
	private String gender;
	private String nic;
	private String disease;	
	private String blood;
	
	public Admit(int id, String name, String age, String mobile, String gender, String nic, String disease,
			String blood) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.mobile = mobile;
		this.gender = gender;
		this.nic = nic;
		this.disease = disease;
		this.blood = blood;
	}

	public Admit(String name, String age, String mobile, String gender, String nic, String disease, String blood) {
		super();
		this.name = name;
		this.age = age;
		this.mobile = mobile;
		this.gender = gender;
		this.nic = nic;
		this.disease = disease;
		this.blood = blood;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getAge() {
		return age;
	}

	public String getMobile() {
		return mobile;
	}

	public String getGender() {
		return gender;
	}

	public String getNic() {
		return nic;
	}

	public String getDisease() {
		return disease;
	}

	public String getBlood() {
		return blood;
	}
	
	

	
}
