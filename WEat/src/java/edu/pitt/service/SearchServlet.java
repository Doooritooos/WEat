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
            String userID = request.getParameter("userID");
            String groupID = request.getParameter("groupID");
            HttpSession httpSession = request.getSession(true);

            if (request.getParameter("rdoSearchMethod").equals("SearchByBusinessName")) {
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
                try {
                    System.out.println("*********" + "try");
                    // Execute Choreo
                    SearchForBusinessResultSet searchForBusinessResults = searchForBusinessChoreo.execute(searchForBusinessInputs);
                    System.out.println("*********" + "try2");
                    request.setAttribute("resultObj", searchForBusinessResults);
                    request.setAttribute("result", "business");
                    request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.getRequestDispatcher("search.jsp").forward(request, response);

                } catch (Exception e) {
                    System.out.println("*********" + "try3");
                    request.setAttribute("error", "noresult");
                    request.setAttribute("result", "business");
                    request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                }
            } else if (request.getParameter("rdoSearchMethod").equals("SearchByCategory")) {

                category = request.getParameter("txtBusinessName");
                city = request.getParameter("txtCity");

                TembooSession session = new TembooSession("huw30", "yelp", "c7d5902f09284726982eeebebeb203ce");
                SearchByCategory searchByCategoryChoreo = new SearchByCategory(session);

                SearchByCategoryInputSet searchByCategoryInputs = searchByCategoryChoreo.newInputSet();

                searchByCategoryInputs.setCredential("firstTryYelpAPI");

                searchByCategoryInputs.set_Category(category);
                searchByCategoryInputs.set_Location(city);
                searchByCategoryInputs.set_Count("20");
                try {
                    SearchByCategoryResultSet searchByCategoryResults = searchByCategoryChoreo.execute(searchByCategoryInputs);
                    request.setAttribute("resultObj", searchByCategoryResults);
                    request.setAttribute("result", "category");
                    request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                } catch (Exception e) {
                    request.setAttribute("error", "noresult");
                    request.setAttribute("result", "category");
                    request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                }
            } else if (request.getParameter("rdoSearchMethod").equals("SearchByCity")) {

                city = request.getParameter("txtCity");

                TembooSession session = new TembooSession("huw30", "yelp", "c7d5902f09284726982eeebebeb203ce");
                SearchByCity searchByCityChoreo = new SearchByCity(session);

                SearchByCityInputSet searchByCityInputs = searchByCityChoreo.newInputSet();

                searchByCityInputs.setCredential("firstTryYelpAPI");

                searchByCityInputs.set_City(city);
                searchByCityInputs.set_Count("20");
                try {
                    SearchByCityResultSet searchByCityResults = searchByCityChoreo.execute(searchByCityInputs);
                    request.setAttribute("resultObj", searchByCityResults);
                    request.setAttribute("result", "city");
                    request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                } catch (Exception e) {
                    request.setAttribute("error", "noresult");
                    request.setAttribute("result", "city");
                    request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                }
            } else if (request.getParameter("rdoSearchMethod").equals("SearchByNeighborhood")) {

                neighborhood = request.getParameter("txtCity");

                TembooSession session = new TembooSession("huw30", "yelp", "c7d5902f09284726982eeebebeb203ce");
                SearchByNeighborhood searchByNeighborhoodChoreo = new SearchByNeighborhood(session);

                SearchByNeighborhoodInputSet searchByNeighborhoodInputs = searchByNeighborhoodChoreo.newInputSet();

                searchByNeighborhoodInputs.setCredential("firstTryYelpAPI");

                searchByNeighborhoodInputs.set_Neighborhood("pittsburgh");
                searchByNeighborhoodInputs.set_Count("20");
                try {
                    SearchByNeighborhoodResultSet searchByNeighborhoodResults = searchByNeighborhoodChoreo.execute(searchByNeighborhoodInputs);
                    request.setAttribute("resultObj", searchByNeighborhoodResults);
                    request.setAttribute("result", "neighborhood");
                    request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                } catch (Exception e) {
                    request.setAttribute("error", "noresult");
                    request.setAttribute("result", "neighborhood");
                    request.setAttribute("userID", userID);
                    request.setAttribute("groupID", groupID);
                    request.getRequestDispatcher("search.jsp").forward(request, response);
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
