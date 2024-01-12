package com.hms.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hms.user.Appointment;

public class AppDBUtil {
	
	private static final String INSERT_USERS_SQL = "INSERT INTO appointment" + "  (department, docName, name, email, age, diseases, date, time) VALUES " +
	        " (?, ?, ?, ?, ?, ?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "select id, department, docName, name, email, age, diseases, date, time from appointment where id =?";
	private static final String SELECT_ALL_USERS = "select * from appointment";
	private static final String DELETE_USERS_SQL = "delete from appointment where id = ?;";
	private static final String UPDATE_USERS_SQL = "update appointment set department = ?, docName = ?, name = ?, email = ?, age = ?, diseases = ?,  date = ?, time = ? where id = ?;";

	
	public AppDBUtil() {}
	
	public void insertAppointment(Appointment appointment) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        
        try (Connection conn = DBConnect.getconnection();PreparedStatement preparedStatement = conn.prepareStatement(INSERT_USERS_SQL)) {
        	
            preparedStatement.setString(1, appointment.getDepartment());
            preparedStatement.setString(2, appointment.getDocName());
            preparedStatement.setString(3, appointment.getName());
            preparedStatement.setString(4, appointment.getEmail());
            preparedStatement.setInt(5, appointment.getAge());
            preparedStatement.setString(6, appointment.getDiseases());
            preparedStatement.setString(7, appointment.getDate());
            preparedStatement.setString(8, appointment.getTime());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();;
        }
    }
	
	
    public boolean updateAppointment(Appointment appointment) throws SQLException {
        boolean rowUpdated;
        try (Connection conn = DBConnect.getconnection(); PreparedStatement statement = conn.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, appointment.getDepartment());
            statement.setString(2, appointment.getDocName());
            statement.setString(3, appointment.getName());
            statement.setString(4, appointment.getEmail());
            statement.setInt(5, appointment.getAge());
            statement.setString(6, appointment.getDiseases());
            statement.setString(7, appointment.getDate());
            statement.setString(8, appointment.getTime());
            statement.setInt(9, appointment.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public Appointment selectAppointment(int id) {
    	
    	Appointment appointment = null;
        
        try (Connection conn = DBConnect.getconnection();
        		
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_USER_BY_ID);) {
        	
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();


            while (rs.next()) {
                String department = rs.getString("department");
                String docName = rs.getString("docName");
                String name = rs.getString("name");
                String email = rs.getString("email");
                int age = rs.getInt("age");
                String diseases = rs.getString("diseases");
                String date = rs.getString("date");
                String time = rs.getString("time");
                appointment = new Appointment(id, department, docName, name, email, age, diseases, date, time);
            }
        } catch (SQLException e) {
            e.printStackTrace();;
        }
        return appointment;
    }
	
    public List < Appointment > selectAllAppointment() {


        List < Appointment > appointments = new ArrayList < > ();

        try (Connection conn = DBConnect.getconnection();

            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            
            while (rs.next()) {
                int id = rs.getInt("id");
                String department = rs.getString("department");
                String docName = rs.getString("docName");
                String name = rs.getString("name");
                String email = rs.getString("email");
                int age = rs.getInt("age");
                String diseases = rs.getString("diseases");
                String date = rs.getString("date");
                String time = rs.getString("time");
                appointments.add(new Appointment(id, department, docName, name, email, age, diseases, date, time));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }
	
    public boolean deleteAppointment(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection conn = DBConnect.getconnection(); PreparedStatement statement = conn.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	