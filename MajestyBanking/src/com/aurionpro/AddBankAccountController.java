package com.aurionpro;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.entities.Customer;
import com.aurionpro.exceptions.NoCustomerFoundException;
import com.aurionpro.model.BankOperations;

/**
 * Servlet implementation class AddBankAccountController
 */
@WebServlet("/AddBankAccountController")
public class AddBankAccountController extends HttpServlet {
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 System.out.println("Inside AddbankAccount Controller");
		 RequestDispatcher requestDispatcher = null;
		 String customerId = request.getParameter("customerId");
		 System.out.println("Customer Id is "+customerId);
		 BankOperations bankOperations = new BankOperations();
		 try
		 { 
			 Customer customer =  bankOperations.fetchCustomerByCustomerId(Integer.parseInt(customerId)); 
			 System.out.println("This is real Customer "+customer);
			 request.setAttribute("customer",customer);
			 request.setAttribute("message","Customer Found");
		 }
		 catch(NoCustomerFoundException e)
		 {
			  request.setAttribute("error",e.getMessage());
			  request.setAttribute("data","notfound");
		 }
		 requestDispatcher = request.getRequestDispatcher("addbankaccount.jsp");
		 requestDispatcher.forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
