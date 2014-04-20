/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pitt.service;

import edu.pitt.utilities.DbUtilities;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author huanwang
 */
@WebServlet(name = "ShareServlet", urlPatterns = {"/ShareServlet"})
public class ShareServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            if (request.getParameter("resultId") != null && request.getParameter("resultName") != null) {
                String id = request.getParameter("resultId");
                String name = request.getParameter("resultName");
                String userID = request.getParameter("userID");
                String groupID = request.getParameter("groupID");

                String sql = "INSERT INTO result (resultID,resultName,userID,`groupID`) values ('" + id + "','" + name + "'," + userID + ",'" + groupID + "');";
                System.out.println(sql);
                DbUtilities db = new DbUtilities();

                if (db.executeUpdate(sql)) {
                   request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.setAttribute("share", "Shared successfully");
                    request.getRequestDispatcher("search.jsp").forward(request, response);

                } else {
                    db.closeDbConnection();
                    request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.setAttribute("share", "You have already shared this result");
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                }

            } else {
                out.println("<p>sorry</p>");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
