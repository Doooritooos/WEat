    package edu.pitt.service;

import com.temboo.Library.Yelp.SearchByCategory;
import com.temboo.Library.Yelp.SearchByCategory.SearchByCategoryInputSet;
import com.temboo.Library.Yelp.SearchByCategory.SearchByCategoryResultSet;
import com.temboo.Library.Yelp.SearchByCity;
import com.temboo.Library.Yelp.SearchByCity.SearchByCityInputSet;
import com.temboo.Library.Yelp.SearchByCity.SearchByCityResultSet;
import com.temboo.Library.Yelp.SearchByNeighborhood;
import com.temboo.Library.Yelp.SearchByNeighborhood.SearchByNeighborhoodInputSet;
import com.temboo.Library.Yelp.SearchByNeighborhood.SearchByNeighborhoodResultSet;
import com.temboo.Library.Yelp.SearchForBusiness;
import com.temboo.Library.Yelp.SearchForBusiness.SearchForBusinessResultSet;
import com.temboo.core.TembooException;
import com.temboo.core.TembooSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

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
            throws ServletException, IOException, TembooException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String businessName = null;
            String city = null;
            String category = null;
            String neighborhood = null;
            HttpSession httpSession = request.getSession(true);

            if (request.getParameter("rdoSearchMethod").equals("SearchByBusinessName")) {
                if (request.getParameter("txtBusinessName") != null && request.getParameter("txtCity") != null) {
                    businessName = request.getParameter("txtBusinessName");
                    city = request.getParameter("txtCity");

                    TembooSession session = new TembooSession("huw30", "yelp", "c7d5902f09284726982eeebebeb203ce");
                    SearchForBusiness searchForBusinessChoreo = new SearchForBusiness(session);

                    // Get an InputSet object for the choreo
                    SearchForBusiness.SearchForBusinessInputSet searchForBusinessInputs = searchForBusinessChoreo.newInputSet();

                    searchForBusinessInputs.setCredential("firstTryYelpAPI");
                    // Set inputs
                    searchForBusinessInputs.set_BusinessName(businessName);
                    searchForBusinessInputs.set_City(city);

                    // Execute Choreo
                    SearchForBusinessResultSet searchForBusinessResults = searchForBusinessChoreo.execute(searchForBusinessInputs);

                    httpSession.setAttribute("resultObj", searchForBusinessResults);
                    httpSession.setAttribute("result", "business");
                    response.sendRedirect("search.jsp");

                } else {
                    out.println("<script language = javascript> alert('Please fill out the business name and city!'); </script>");
                }

            } else if (request.getParameter("rdoSearchMethod").equals("SearchByCategory")) {
                if (request.getParameter("txtBusinessName") != null && request.getParameter("txtCity") != null) {
                    category = request.getParameter("txtBusinessName");
                    city = request.getParameter("txtCity");

                    TembooSession session = new TembooSession("huw30", "yelp", "c7d5902f09284726982eeebebeb203ce");
                    SearchByCategory searchByCategoryChoreo = new SearchByCategory(session);

                    SearchByCategoryInputSet searchByCategoryInputs = searchByCategoryChoreo.newInputSet();

                    searchByCategoryInputs.setCredential("firstTryYelpAPI");

                    searchByCategoryInputs.set_Category(category);
                    searchByCategoryInputs.set_Location(city);
                    searchByCategoryInputs.set_Count("20");

                    SearchByCategoryResultSet searchByCategoryResults = searchByCategoryChoreo.execute(searchByCategoryInputs);
                    httpSession.setAttribute("resultObj", searchByCategoryResults);
                    httpSession.setAttribute("result", "category");
                    response.sendRedirect("search.jsp");

                } else {
                    out.println("<script language = javascript> alert('Please fill out the category and location!'); </script>");
                }
            } else if (request.getParameter("rdoSearchMethod").equals("SearchByCity")) {
                if (request.getParameter("txtCity") != null) {
                    city = request.getParameter("txtCity");

                    TembooSession session = new TembooSession("huw30", "yelp", "c7d5902f09284726982eeebebeb203ce");
                    SearchByCity searchByCityChoreo = new SearchByCity(session);

                    SearchByCityInputSet searchByCityInputs = searchByCityChoreo.newInputSet();

                    searchByCityInputs.setCredential("firstTryYelpAPI");

                    searchByCityInputs.set_City(city);
                    searchByCityInputs.set_Count("20");

                    SearchByCityResultSet searchByCityResults = searchByCityChoreo.execute(searchByCityInputs);
                    httpSession.setAttribute("resultObj", searchByCityResults);
                    httpSession.setAttribute("result", "city");
                    response.sendRedirect("search.jsp");

                } else {
                    out.println("<script language = javascript> alert('Please fill out the city!'); </script>");
                }
            } else if (request.getParameter("rdoSearchMethod").equals("SearchByNeighborhood")) {
                if (request.getParameter("txtCity") != null) {
                    neighborhood = request.getParameter("txtCity");

                    TembooSession session = new TembooSession("huw30", "yelp", "c7d5902f09284726982eeebebeb203ce");
                    SearchByNeighborhood searchByNeighborhoodChoreo = new SearchByNeighborhood(session);

                    SearchByNeighborhoodInputSet searchByNeighborhoodInputs = searchByNeighborhoodChoreo.newInputSet();

                    searchByNeighborhoodInputs.setCredential("firstTryYelpAPI");

                    searchByNeighborhoodInputs.set_Neighborhood("pittsburgh");
                    searchByNeighborhoodInputs.set_Count("20");

                    SearchByNeighborhoodResultSet searchByNeighborhoodResults = searchByNeighborhoodChoreo.execute(searchByNeighborhoodInputs);
                    httpSession.setAttribute("resultObj", searchByNeighborhoodResults);
                    httpSession.setAttribute("result", "neighborhood");
                    response.sendRedirect("search.jsp");

                } else {
                    out.println("<script language = javascript> alert('Please fill out the city!'); </script>");
                }

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
        try {
            processRequest(request, response);
        } catch (TembooException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (TembooException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "This servlet get user's query. Including Temboo Yelp library and use it to call Yelp API. Once get the result, send back to the jsp page.";
    }// </editor-fold>

}
