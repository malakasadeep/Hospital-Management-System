package com.hms.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.user.Appointment;
import com.hms.user.AppDBUtil;

/**
 * Servlet implementation class AppointmentServlet
 */
@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AppDBUtil AppDBUtil;
       
  
    public AppointmentServlet() {
        super();
        this.AppDBUtil = new AppDBUtil();
    }

    
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
	 
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                	insertAppointment(request, response);
                    break;
                case "/delete":
                	deleteAppointment(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                	updateAppointment(request, response);
                    break;
                default:
                	listAppointment(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
        
   
    }
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("add_appointment.jsp");
		dispatcher.forward(request, response);
	
	}
	
	 private void insertAppointment(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, IOException {
		String department = request.getParameter("dept");
		String docName = request.getParameter("doctor");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String sage = request.getParameter("age");
		int age = Integer.parseInt(sage);
		String diseases = request.getParameter("diseases");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		Appointment newAppointment = new Appointment(department, docName, name, email, age, diseases, date, time);
		AppDBUtil.insertAppointment(newAppointment);;
		response.sendRedirect("list");
	}
	 
	 private void deleteAppointment(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
		 AppDBUtil.deleteAppointment(id);
		 response.sendRedirect("list");

	}
	 
	 private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Appointment existingAppointmentr = AppDBUtil.selectAppointment(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("add_appointment.jsp");
		request.setAttribute("appointment", existingAppointmentr);
		dispatcher.forward(request, response);

	}
	 
	private void updateAppointment(HttpServletRequest request, HttpServletResponse response)
	    	    throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String department = request.getParameter("dept");
		String docName = request.getParameter("doctor");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String sage = request.getParameter("age");
		int age = Integer.parseInt(sage);
		String diseases = request.getParameter("diseases");
		String date = request.getParameter("date");
		String time = request.getParameter("time");

		Appointment newAppointment = new Appointment(id, department, docName, name, email, age, diseases, date, time);
	    AppDBUtil.updateAppointment(newAppointment);
	    response.sendRedirect("list");
	    
	}
	
	  private void listAppointment(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, IOException, ServletException {
			        List < Appointment > listAppointment = AppDBUtil.selectAllAppointment();
			        request.setAttribute("listAppointment", listAppointment);
			        RequestDispatcher dispatcher = request.getRequestDispatcher("view_app.jsp");
			        dispatcher.forward(request, response);
			    }

	
	

}
