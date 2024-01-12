package com.hms.admit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.hms.user.DBConnect;

public class AdmitDBUtil {
	
	private static final String INSERT_USERS_SQL = "INSERT INTO admitpatien" + "  ( name, age, mobile, gender, nic, disease, blood) VALUES " +
	        " (?, ?, ?, ?, ?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "select id, name, age, mobile, gender, nic, disease, blood from admitpatien where id =?";
	private static final String SELECT_ALL_USERS = "select * from admitpatien";
	private static final String DELETE_USERS_SQL = "delete from admitpatien where id = ?;";
	private static final String UPDATE_USERS_SQL = "update admitpatien set name = ?, age = ?, mobile = ?, gender = ?, nic = ?, disease = ?, blood = ? where id = ?;";


	public void insertAdmit(Admit admit) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        
        try (Connection conn = DBConnect.getconnection();PreparedStatement preparedStatement = conn.prepareStatement(INSERT_USERS_SQL)) {
        	
            preparedStatement.setString(1, admit.getName());
            preparedStatement.setString(2, admit.getAge());
            preparedStatement.setString(3, admit.getMobile());
            preparedStatement.setString(4, admit.getGender());
            preparedStatement.setString(5, admit.getNic());
            preparedStatement.setString(6, admit.getDisease());
            preparedStatement.setString(7, admit.getBlood());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();;
        }
    }
	
	public boolean updateAdmit(Admit admit) throws SQLException {
        boolean rowUpdated;
        try (Connection conn = DBConnect.getconnection(); PreparedStatement statement = conn.prepareStatement(UPDATE_USERS_SQL);) {
        	 statement.setString(1, admit.getName());
             statement.setString(2, admit.getAge());
             statement.setString(3, admit.getMobile());
             statement.setString(4, admit.getGender());
             statement.setString(5, admit.getNic());
             statement.setString(6, admit.getDisease());
             statement.setString(7, admit.getBlood());
             statement.setInt(8, admit.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
	
	public Admit selectAdmit(int id) {
    	
		Admit admit = null;
        
        try (Connection conn = DBConnect.getconnection();
        		
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_USER_BY_ID);) {
        	
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            

            while (rs.next()) {
                String name = rs.getString("name");
                String age = rs.getString("age");
                String mobile = rs.getString("mobile");
                String gender = rs.getString("gender");
                String nic = rs.getString("nic");
                String disease = rs.getString("disease");
                String blood = rs.getString("blood");

                admit = new Admit(id, name, age, mobile, gender, nic, disease, blood);
            }
        } catch (SQLException e) {
            e.printStackTrace();;
        }
        return admit;
    }
	
	public List < Admit > selectAllAdmut() {
		
		
	     List < Admit > admits = new ArrayList < > ();
	
	     try (Connection conn = DBConnect.getconnection();
	
	         PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_USERS);) {
	         System.out.println(preparedStatement);
	
	         ResultSet rs = preparedStatement.executeQuery();
	
	         
	         while (rs.next()) {
	             int id = rs.getInt("id");
	             String name = rs.getString("name");
	             String age = rs.getString("age");
	             String mobile = rs.getString("mobile");
	             String gender = rs.getString("gender");
	             String nic = rs.getString("nic");
	             String disease = rs.getString("disease");
	             String blood = rs.getString("blood");
	
	             admits.add(new Admit(id, name, age, mobile, gender, nic, disease, blood));
	         }
	     } catch (SQLException e) {
	         e.printStackTrace();
	     }
	     return admits;
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
