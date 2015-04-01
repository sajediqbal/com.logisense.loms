package com.logisense.loms.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.QueryResultList;
import com.logisense.loms.data.*;

public class listStationsServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

    	 int page = 1;
         int recordsPerPage = 250;
         int noOfRecords = StationIO.getCount();
         int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
         
         if(request.getParameter("page") != null){
             page = Integer.parseInt(request.getParameter("page"));
             if (page>noOfPages)
            	 page=noOfPages;
         }
         
         

         QueryResultList<Entity> list = StationIO.getStationsResultList((page-1)*recordsPerPage,
                                  recordsPerPage);
         
        
         request.setAttribute("stationList", list);
         request.setAttribute("noOfPages", noOfPages);
         request.setAttribute("currentPage", page);
         RequestDispatcher view = request.getRequestDispatcher("liststations.jsp");
         view.forward(request, response);
            }
  


    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

