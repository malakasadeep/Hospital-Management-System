package com.hms.receptionist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.hms.user.DBConnect;

public class DoctorDBUtil {
	
	private static final String INSERT_USERS_SQL = "INSERT INTO doctor" + "  (name, email, mobile, dob, nic, qualification, specialization) VALUES " +
	        " (?, ?, ?, ?, ?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "select id, name, email, mobile, dob, nic, qualification, specialization from doctor where id =?";
	private static final String SELECT_ALL_USERS = "select * from doctor";
	private static final String DELETE_USERS_SQL = "delete from doctor where id = ?;";
	private static final String UPDATE_USERS_SQL = "update doctor set name = ?, email = ?, mobile = ?, dob = ?, nic = ?, qualification = ?, specialization = ? where id = ?;";

	
	public void insertDoctor(Doctor doctor) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        
        try (Connection conn = DBConnect.getconnection();PreparedStatement preparedStatement = conn.prepareStatement(INSERT_USERS_SQL)) {
        	
            preparedStatement.setString(1, doctor.getName());
            preparedStatement.setString(2, doctor.getEmail());
            preparedStatement.setString(3, doctor.getMobile());
            preparedStatement.setString(4, doctor.getDob());
            preparedStatement.setString(5, doctor.getNic());
            preparedStatement.setString(6, doctor.getQualification());
            preparedStatement.setString(7, doctor.getSpecialization());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();;
        }
    }
	
    public boolean updateDoctor(Doctor doctor) throws SQLException {
        boolean rowUpdated;
        try (Connection conn = DBConnect.getconnection(); PreparedStatement statement = conn.prepareStatement(UPDATE_USERS_SQL);) {
        	 statement.setString(1, doctor.getName());
             statement.setString(2, doctor.getEmail());
             statement.setString(3, doctor.getMobile());
             statement.setString(4, doctor.getDob());
             statement.setString(5, doctor.getNic());
             statement.setString(6, doctor.getQualification());
             statement.setString(7, doctor.getSpecialization());
             statement.setInt(8, doctor.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
	 public Doctor selectDoctor(int id) {
	    	
	    	Doctor doctor = null;
	        
	        try (Connection conn = DBConnect.getconnection();
	        		
	            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_USER_BY_ID);) {
	        	
	            preparedStatement.setInt(1, id);
	            System.out.println(preparedStatement);
	
	            ResultSet rs = preparedStatement.executeQuery();
	            
	
	            while (rs.next()) {
	                String name = rs.getString("name");
	                String email = rs.getString("email");
	                String mobile = rs.getString("mobile");
	                String dob = rs.getString("dob");
	                String nic = rs.getString("nic");
	                String qualification = rs.getString("qualification");
	                String specialization = rs.getString("specialization");
	
	                doctor = new Doctor(id, name, email, mobile, dob, nic, qualification, specialization);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();;
	        }
	        return doctor;
	    }
	 
 
	 public List < Doctor > selectAllDoctors() {
	
	
	     List < Doctor > doctors = new ArrayList < > ();
	
	     try (Connection conn = DBConnect.getconnection();
	
	         PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_USERS);) {
	         System.out.println(preparedStatement);
	
	         ResultSet rs = preparedStatement.executeQuery();
	
	         
	         while (rs.next()) {
	             int id = rs.getInt("id");
	             String name = rs.getString("name");
	             String email = rs.getString("email");
	             String mobile = rs.getString("mobile");
	             String dob = rs.getString("dob");
	             String nic = rs.getString("nic");
	             String qualification = rs.getString("qualification");
	             String specialization = rs.getString("specialization");
	
	             doctors.add(new Doctor(id, name, email, mobile, dob, nic, qualification, specialization));
	         }
	     } catch (SQLException e) {
	         e.printStackTrace();
	     }
	     return doctors;
	 }
 
	 
	 public boolean deleteDoctor(int id) throws SQLException {
	        boolean rowDeleted;
	        try (Connection conn = DBConnect.getconnection(); PreparedStatement statement = conn.prepareStatement(DELETE_USERS_SQL);) {
	            statement.setInt(1, id);
	            rowDeleted = statement.executeUpdate() > 0;
	        }
	        return rowDeleted;
	    }
 

}
