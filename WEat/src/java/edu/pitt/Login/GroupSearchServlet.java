/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.pitt.Login;

import edu.pitt.domain.Group;
import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/GroupSearchServlet")
public class GroupSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	StringBuilder csvSkills	=	new  StringBuilder();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                response.setContentType("text/html;charset-UTF-8");
                //PrintWriter out= new PrintWriter("try.txt");
//		String hdnParam	=request.getParameter("pagename");
//                if(hdnParam.equals("login")){
			try{
                                   System.out.println("In the Group Search Servlet");
                                    
                                   int groupID= Integer.parseInt(request.getParameter("getGroupID"));
                                   int userID= Integer.parseInt(request.getParameter("getUserID"));
//                                    String password= request.getParameter("password");
                                   Group newSearchGroup = new Group(userID, groupID);
                                   
                                    if(newSearchGroup.isValid()){
                                        HttpSession session = request.getSession(true);
                                        session.setAttribute("currentSearchGroup", newSearchGroup);
//                                        response.sendRedirect("loginSuccess.jsp");
                                       
                                        RequestDispatcher rd= request.getRequestDispatcher("search.jsp");
                                        rd.forward(request,response);
                  
                                    }else{
                                        RequestDispatcher rd= request.getRequestDispatcher("group.jsp");
                                        rd.include(request,response);
                                    }
                                }catch(Throwable exc){

                                    System.out.println(exc);
                                }    
				
		
  }
}
