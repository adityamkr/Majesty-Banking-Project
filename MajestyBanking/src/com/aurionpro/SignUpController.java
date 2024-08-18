package com.aurionpro;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.entities.Admin;
import com.aurionpro.model.AdminOperations;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet("/SignUpController")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String signupRole =  request.getParameter("signupRole");
		  String username = request.getParameter("username");
		  String password = request.getParameter("password");
		  RequestDispatcher requestDispatcher = null;
		  
		  System.out.println(signupRole+" "+username+" "+password);
		  if(signupRole!=null && username!=null && username.length()>0 && password!=null && password.length()>0)
		  {
			     AdminOperations adminOperations = new AdminOperations();
			     Admin admin  = new Admin();
			     admin.setUsername(username);
			     admin.setPassword(password);
			     try
			     {
			    	 	admin = adminOperations.saveAdmin(admin);
				    	System.out.println("Admin Sign Up Successfull");
				    	requestDispatcher = request.getRequestDispatcher("login.jsp");
				    	request.setAttribute("message","SignUp Successfull");
					    
			     }
			     catch(Exception e)
			     {
			    	 System.out.println(e.getMessage());
			    	 requestDispatcher =request.getRequestDispatcher("signup.jsp");
			    	 request.setAttribute("error",e.getMessage());
			     }
			         
		  }
		  else
		  {
			  request.setAttribute("error","Pls Enter all the fields Correctly");
			  requestDispatcher = request.getRequestDispatcher("signup.jsp");
		  }
		  requestDispatcher.forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
