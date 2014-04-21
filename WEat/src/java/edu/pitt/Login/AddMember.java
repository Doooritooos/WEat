/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.pitt.Login;

/**
 *
 * @author Liu
 */
import edu.pitt.domain.Group;
import edu.pitt.domain.User;
import java.io.IOException;
import java.io.PrintWriter;
//import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddMember")
public class AddMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	StringBuilder csvSkills	=	new  StringBuilder();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMember() {
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
                PrintWriter out= response.getWriter();
                int userID = Integer.parseInt(request.getParameter("userID"));
//                String newEmail=request.getParameter("newEmail");
		String groupID =request.getParameter("groupID");
                String groupName=request.getParameter("groupName");
                int newUserID = Integer.parseInt(request.getParameter("newUserID"));
                        
                        Group newGroup = new Group(groupID, newUserID, groupName);
                        
//                        User curUser=new User(userID);
                        
			try{
                             if(newGroup!=null){ 
                                
                                System.out.println("You are successfully add the member");
                                out.println("<script language = javascript> alert('You have succeessfully add the member'); </script>");
//                                HttpSession session = request.getSession(true);
//                                session.setAttri("currentSessionUser", curUser);
                                HttpServletRequest httpRequest = (HttpServletRequest) request;
        
                                httpRequest.getRequestDispatcher("memberList.jsp?userID&groupID").forward(request,response);  
                                
//                                response.sendRedirect("memberList.jsp");
                               
                             }else{
                                System.out.println("Error added!");
                                response.sendRedirect("addMember.jsp");
                             }
			}catch(Exception ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}

                       
                   

		
  }
}

