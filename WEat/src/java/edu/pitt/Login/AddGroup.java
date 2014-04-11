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


@WebServlet("/AddGroup")
public class AddGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	StringBuilder csvSkills	=	new  StringBuilder();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGroup() {
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
//		String hdnParam	=request.getParameter("pagename");
//                if(hdnParam.equals("login")){
			int userID =Integer.parseInt(request.getParameter("userID"));
			String groupname= request.getParameter("groupname");
                        out.println(userID);
                        out.println(groupname);
                        Group newGroup = new Group(groupname, userID);
//			try{
//                             if(newGroup!=null){ 
//                                System.out.println("You are successfully add group");
//                                response.sendRedirect("group.jsp");
//                               
//                             }else{
//                                System.out.println("Error added!");
//                                response.sendRedirect("addGroup.jsp");
//                             }
//			}catch(Exception ex) {
//				// TODO Auto-generated catch block
//				ex.printStackTrace();
//			}

		
  }
}

