package com.hms.admit;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AdmitServlet
 */
@WebServlet("/AdmitServlet")
public class AdmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private AdmitDBUtil  AdmitDBUtil;
   
    public AdmitServlet() {
        super();
        this.AdmitDBUtil = new AdmitDBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/patient_new":
                    showNewAdmit(request, response);
                    break;
                case "/patient_insert":
                	insertAdmit(request, response);
                    break;
                case "/patient_delete":
                	deleteAdmit(request, response);
                    break;
                case "/patient_edit":
                    showEditFormAdmit(request, response);
                    break;
                case "/patient_update":
                	updateAdmit(request, response);
                    break;
                default:
                	listAdmit(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}
	
	private void showNewAdmit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("admitPatient.jsp");
			dispatcher.forward(request, response);
		
	}
	
	private void insertAdmit(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String mobile = request.getParameter("mobile");
		String gender = request.getParameter("gender");
		String nic = request.getParameter("nic");
		String disease = request.getParameter("disease");
		String blood = request.getParameter("blood");
	
		Admit newAdmit = new Admit(name, age, mobile, gender, nic, disease, blood);
		AdmitDBUtil.insertAdmit(newAdmit);
		response.sendRedirect("patient_list");
	}
	
	private void deleteAdmit(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
		 AdmitDBUtil.deleteDoctor(id);
		 response.sendRedirect("patient_list");
	
	}
	
	private void showEditFormAdmit(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Admit existingAdmit = AdmitDBUtil.selectAdmit(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admitPatient.jsp");
		request.setAttribute("admit", existingAdmit);
		dispatcher.forward(request, response);
	
	}
	
	private void updateAdmit(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String mobile = request.getParameter("mobile");
		String gender = request.getParameter("gender");
		String nic = request.getParameter("nic");
		String disease = request.getParameter("disease");
		String blood = request.getParameter("blood");
	
		Admit newAdmit = new Admit(id, name, age, mobile, gender, nic, disease, blood);
		AdmitDBUtil.updateAdmit(newAdmit);
	    response.sendRedirect("patient_list");
	    
	}
	
	private void listAdmit(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException, ServletException {
		        List < Admit > listAdmit = AdmitDBUtil.selectAllAdmut();
		        request.setAttribute("listAdmit", listAdmit);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("viewAdmit.jsp");
		        dispatcher.forward(request, response);
		    }
	

}
