package com.logisense.loms.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.logisense.loms.business.*;
import com.logisense.loms.data.*;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import java.util.Date;



/**
 *
 * @author Sajid
 */
public class addStationServlet extends HttpServlet {

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
        
        // get parameters from the request
            int stationID = Integer.parseInt(request.getParameter("stationID"));
            String stationName = request.getParameter("stationName");
            int distance = Integer.parseInt(request.getParameter("distance"));
            int regionCode = Integer.parseInt(request.getParameter("regionCode"));
            String stationZone = request.getParameter("stationZone");
            boolean isSpecial = false;
            String specialCheckbox = request.getParameter("isSpecial");
            String url=null;
            String message="";
            if (specialCheckbox != null){
                isSpecial = true;
            }
        
            // use regular java objects
            if (!StationIO.exist(stationName) & !StationIO.exist(stationID)){
            	Station station=new Station (stationID, stationName, stationZone, regionCode, distance, isSpecial);
                
                StationIO.add(station);
                
            request.setAttribute("stationList", StationIO.listStation());
            url = "/list_stations.jsp";
            }
            else{
            	if(StationIO.exist(stationName)){
            	message="Station already exist in database. ";	
            	}
            	if(StationIO.exist(stationID)){
            		message=message+"ID already exist in database.";
            	}
            	request.setAttribute("message", message);
            	url = "/add_station.jsp";
            }
            
           
                        
        RequestDispatcher dispatcher = 
        		getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
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

