/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.pitt.Login;

import edu.pitt.domain.User;
import java.io.IOException;
import java.io.PrintWriter;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    StringBuilder csvSkills = new StringBuilder();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
//        PrintWriter out = response.getWriter();

        try {
            System.out.println("In the login Servlet");

            String email = request.getParameter("email");
            String password = request.getParameter("password");
//            out.println(email);
//            out.println(password);
            
            User backUser = new User(email, password);
//            out.println(backUser);
//            out.println(backUser.getUserID());
//            out.println(backUser.getEmail());

            if (backUser.isValid()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", backUser);
                response.sendRedirect("viewGroup.jsp");


//                RequestDispatcher rd = request.getRequestDispatcher("group.jsp");
//                rd.forward(request, response);

            } else {
//              HttpSession session = request.getSession(true);
//              session.setAttribute("Login_Wrong","Wrong") ;
//              response.sendRedirect("login.jsp");
                response.sendRedirect("loginFail.jsp");
            }
        } catch (Throwable exc) {

            System.out.println(exc);
        }

    }
}
