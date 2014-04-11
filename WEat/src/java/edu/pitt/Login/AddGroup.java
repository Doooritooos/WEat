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
                //PrintWriter out= new PrintWriter("try.txt");
//		String hdnParam	=request.getParameter("pagename");
//                if(hdnParam.equals("login")){
			int userID =Integer.parseInt(request.getParameter("userID"));
			String groupname= request.getParameter("groupname");
		
                        Group newGroup = new Group(groupname, userID);
			try{
                             if(newGroup!=null){ 
                                System.out.println("You are successfully add group");
                                RequestDispatcher rd= request.getRequestDispatcher("group.jsp");
                                rd.forward(request,response);
                             }else{
                                System.out.println("Error added!");
                                RequestDispatcher rd= request.getRequestDispatcher("addgroup.jsp");
                                        rd.include(request,response);
                             }
			}catch(Exception ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}

		
  }
}

