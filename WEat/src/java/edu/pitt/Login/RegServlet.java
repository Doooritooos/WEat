/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.pitt.Login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/RegisterServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	StringBuilder csvSkills	=	new  StringBuilder();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
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

			String email	= request.getParameter("email");
			String password	= request.getParameter("password");
			String username	= request.getParameter("username");
                        User newUser = new User(email, password, username);
			try{
                             if(newUser!=null){ 
                                System.out.println("You are successfully registered");
                                RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
                                        rd.forward(request,response);
                             }else{
                                System.out.println("Error registered!");
                                RequestDispatcher rd= request.getRequestDispatcher("register.jsp");
                                        rd.include(request,response);
                             }
			}catch(Exception ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}

                
  }
}

