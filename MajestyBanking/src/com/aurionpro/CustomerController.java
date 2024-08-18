package com.aurionpro;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aurionpro.entities.Customer;
import com.aurionpro.model.CustomerOperations;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Inside Customer Servlet");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String emailId = request.getParameter("emailId");
		String password  =request.getParameter("password");
		
		RequestDispatcher requestDispatcher = null;
		System.out.println(firstName+" "+lastName+" "+emailId+" "+password);
		 if(firstName.length()>0 && lastName.length()>0 && emailId.length()>0 && password.length()>0)
		 {
			 Customer newCustomer = new Customer();
			 newCustomer.setFirstName(firstName);
			 newCustomer.setLastName(lastName);
			 newCustomer.setEmailId(emailId);
			 newCustomer.setPassword(password);
			 try
			 {
				 new CustomerOperations().saveCustomerToDb(newCustomer);
				 
				 request.setAttribute("message","Customer Added Successfully");
				 requestDispatcher = request.getRequestDispatcher("addcustomer.jsp");
			 }
			 catch(Exception e)
			 {
				 request.setAttribute("error",e.getMessage());
				 requestDispatcher = request.getRequestDispatcher("addcustomer.jsp");
				 
			 }
			 requestDispatcher.forward(request,response);
			 return;
		 }
		 requestDispatcher = request.getRequestDispatcher("addcustomer.jsp");
		 request.setAttribute("message","Something Went Wrong Pls Enter All the Credentials Correctly");
		 requestDispatcher.forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
