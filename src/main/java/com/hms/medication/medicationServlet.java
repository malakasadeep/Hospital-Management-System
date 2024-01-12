package com.hms.medication;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





@WebServlet("/medicationServlet")
public class medicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private meditationDBUtil meditationDBUtil;
       
    
    public medicationServlet() {
        super();
        this.meditationDBUtil = new meditationDBUtil();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/med_new":
                    showNewMed(request, response);
                    break;
                case "/med_insert":
                	insertMed(request, response);
                    break;
                case "/med_delete":
                	deleteMed(request, response);
                    break;
                case "/med_edit":
                    showEditFormMed(request, response);
                    break;
                case "/med_update":
                	updateMed(request, response);
                    break;
                default:
                	listMed(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}
	
	private void showNewMed(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("addMedication.jsp");
		dispatcher.forward(request, response);
	
	}
	
	private void insertMed(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException {
		String name = request.getParameter("name");
		String dosage = request.getParameter("dosage");
		String qty = request.getParameter("qty");
		String expdate = request.getParameter("exd");
		String type = request.getParameter("type");
		String notes = request.getParameter("notes");
	
		medication newmed = new medication(name, dosage, qty, expdate, type, notes);
		meditationDBUtil.insertMed(newmed);
		response.sendRedirect("med_list");
	}
	
	private void deleteMed(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
		 meditationDBUtil.deleteMed(id);
		 response.sendRedirect("med_list");
	
	}
	
	private void showEditFormMed(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		medication existingMed = meditationDBUtil.selectMed(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("addMedication.jsp");
		request.setAttribute("med", existingMed);
		dispatcher.forward(request, response);
	
	}
	
	private void updateMed(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String dosage = request.getParameter("dosage");
		String qty = request.getParameter("qty");
		String expdate = request.getParameter("exd");
		String type = request.getParameter("type");
		String notes = request.getParameter("notes");
	
		medication newMed = new medication(id, name, dosage, qty, expdate, type, notes);
		meditationDBUtil.updateMed(newMed);
	    response.sendRedirect("med_list");
	    
	}
	
	private void listMed(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException, ServletException {
		        List < medication > listMed = meditationDBUtil.selectAllMed();
		        request.setAttribute("listMed", listMed);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("viewMedication.jsp");
		        dispatcher.forward(request, response);
	}

	
}
