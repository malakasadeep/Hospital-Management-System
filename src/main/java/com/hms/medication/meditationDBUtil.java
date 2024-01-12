package com.hms.medication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.hms.user.DBConnect;

public class meditationDBUtil {
	
	private static final String INSERT_USERS_SQL = "INSERT INTO medication" + "  ( name, dosage, qty, expdate, type, notes) VALUES " +
	        " (?, ?, ?, ?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "select id, name, dosage, qty, expdate, type, notes from medication where id =?";
	private static final String SELECT_ALL_USERS = "select * from medication";
	private static final String DELETE_USERS_SQL = "delete from medication where id = ?;";
	private static final String UPDATE_USERS_SQL = "update medication set name = ?, dosage = ?, qty = ?, expdate = ?, type = ?, notes = ? where id = ?;";
	
	public void insertMed(medication med) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        
        try (Connection conn = DBConnect.getconnection();PreparedStatement preparedStatement = conn.prepareStatement(INSERT_USERS_SQL)) {
        	
            preparedStatement.setString(1, med.getName());
            preparedStatement.setString(2, med.getDosage());
            preparedStatement.setString(3, med.getQty());
            preparedStatement.setString(4, med.getExpdate());
            preparedStatement.setString(5, med.getType());
            preparedStatement.setString(6, med.getNotes());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();;
        }
    }
	
	public boolean updateMed(medication med) throws SQLException {
        boolean rowUpdated;
        try (Connection conn = DBConnect.getconnection(); PreparedStatement statement = conn.prepareStatement(UPDATE_USERS_SQL);) {
        	 statement.setString(1, med.getName());
             statement.setString(2, med.getDosage());
             statement.setString(3, med.getQty());
             statement.setString(4, med.getExpdate());
             statement.setString(5, med.getType());
             statement.setString(6, med.getNotes());
             statement.setInt(7, med.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
	
	public medication selectMed(int id) {
    	
		medication med = null;
        
        try (Connection conn = DBConnect.getconnection();
        		
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_USER_BY_ID);) {
        	
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            

            while (rs.next()) {
                String name = rs.getString("name");
                String dosage = rs.getString("dosage");
                String qty = rs.getString("qty");
                String expdate = rs.getString("expdate");
                String type = rs.getString("type");
                String notes = rs.getString("notes");

                med = new medication(id, name, dosage, qty, expdate, type, notes);
            }
        } catch (SQLException e) {
            e.printStackTrace();;
        }
        return med;
    }
	
	public List < medication > selectAllMed() {
		
		
	     List < medication > meds = new ArrayList < > ();
	
	     try (Connection conn = DBConnect.getconnection();
	
	         PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_USERS);) {
	         System.out.println(preparedStatement);
	
	         ResultSet rs = preparedStatement.executeQuery();
	
	         
	         while (rs.next()) {
	             int id = rs.getInt("id");
	             String name = rs.getString("name");
	             String dosage = rs.getString("dosage");
	             String qty = rs.getString("qty");
	             String expdate = rs.getString("expdate");
	             String type = rs.getString("type");
	             String notes = rs.getString("notes");
	
	             meds.add(new medication(id, name, dosage, qty, expdate, type, notes));
	         }
	     } catch (SQLException e) {
	         e.printStackTrace();
	     }
	     return meds;
	 }
	
	public boolean deleteMed(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection conn = DBConnect.getconnection(); PreparedStatement statement = conn.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
	


}
