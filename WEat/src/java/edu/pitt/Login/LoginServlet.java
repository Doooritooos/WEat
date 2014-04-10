/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.pitt.Login;

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


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	StringBuilder csvSkills	=	new  StringBuilder();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
                                    System.out.println("In the login Servlet");
                                    
                                    String email= request.getParameter("email");
                                    String password= request.getParameter("password");
                                    User backUser= new User(email, password);
                                   
                                    if(backUser.isValid()){
                                        HttpSession session = request.getSession(true);
                                        session.setAttribute("currentSessionUser", backUser);
//                                        response.sendRedirect("loginSuccess.jsp");
                                       
                                        RequestDispatcher rd= request.getRequestDispatcher("loginSuccess.jsp");
                                        rd.forward(request,response);
                  
                                    }else{
                                        RequestDispatcher rd= request.getRequestDispatcher("loginFail.jsp");
                                        rd.include(request,response);
                                    }
                                }catch(Throwable exc){

                                    System.out.println(exc);
                                }    
				
		
  }
}
