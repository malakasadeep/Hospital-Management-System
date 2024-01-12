package com.hms.receptionist;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.user.AppDBUtil;
import com.hms.user.Appointment;

/**
 * Servlet implementation class DoctorServlet
 */
@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DoctorDBUtil DoctorDBUtil;
    
	  
    public DoctorServlet() {
        super();
        this.DoctorDBUtil = new DoctorDBUtil();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			doGet(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/doc_new":
                    showNewDoctor(request, response);
                    break;
                case "/doc_insert":
                	insertDoctor(request, response);
                    break;
                case "/doc_delete":
                	deleteDoctor(request, response);
                    break;
                case "/doc_edit":
                    showEditFormDoctor(request, response);
                    break;
                case "/doc_update":
                	updateDoctor(request, response);
                    break;
                default:
                	listDoctor(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}
	
	private void showNewDoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("addDoctor.jsp");
		dispatcher.forward(request, response);
	
	}
	
	 private void insertDoctor(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String dob = request.getParameter("dob");
		String nic = request.getParameter("nic");
		String qualification = request.getParameter("quil");
		String specialization = request.getParameter("specil");

		Doctor newDoctor = new Doctor(name, email, mobile, dob, nic, qualification, specialization);
		DoctorDBUtil.insertDoctor(newDoctor);;
		response.sendRedirect("doc_list");
	}
	 
	 private void deleteDoctor(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
		 DoctorDBUtil.deleteDoctor(id);
		 response.sendRedirect("doc_list");

	}
	 
	 private void showEditFormDoctor(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Doctor existingDoctor = DoctorDBUtil.selectDoctor(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("addDoctor.jsp");
		request.setAttribute("doctor", existingDoctor);
		dispatcher.forward(request, response);

	}
	 
	 private void updateDoctor(HttpServletRequest request, HttpServletResponse response)
	    	    throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String dob = request.getParameter("dob");
		String nic = request.getParameter("nic");
		String qualification = request.getParameter("quil");
		String specialization = request.getParameter("specil");

		Doctor newDoctor = new Doctor(id, name, email, mobile, dob, nic, qualification, specialization);
	    DoctorDBUtil.updateDoctor(newDoctor);
	    response.sendRedirect("doc_list");
	    
	}
	 
	 private void listDoctor(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, IOException, ServletException {
			        List < Doctor > listDoctor = DoctorDBUtil.selectAllDoctors();
			        request.setAttribute("listDoctor", listDoctor);
			        RequestDispatcher dispatcher = request.getRequestDispatcher("viewDoc.jsp");
			        dispatcher.forward(request, response);
			    }



	

}
