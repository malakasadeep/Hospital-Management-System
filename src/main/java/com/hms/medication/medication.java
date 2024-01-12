package com.hms.medication;

public class medication {
	
	private int id;
	private String name;	
	private String dosage;
	private String qty;	
	private String expdate;
	private String type;
	private String notes;
	
	public medication(int id, String name, String dosage, String qty, String expdate, String type, String notes) {
		super();
		this.id = id;
		this.name = name;
		this.dosage = dosage;
		this.qty = qty;
		this.expdate = expdate;
		this.type = type;
		this.notes = notes;
	}

	public medication(String name, String dosage, String qty, String expdate, String type, String notes) {
		super();
		this.name = name;
		this.dosage = dosage;
		this.qty = qty;
		this.expdate = expdate;
		this.type = type;
		this.notes = notes;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDosage() {
		return dosage;
	}

	public String getQty() {
		return qty;
	}

	public String getExpdate() {
		return expdate;
	}

	public String getType() {
		return type;
	}

	public String getNotes() {
		return notes;
	}
	
	
	
	

}
