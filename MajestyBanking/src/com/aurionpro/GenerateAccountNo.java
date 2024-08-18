package com.aurionpro;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.entities.Customer;
import com.aurionpro.exceptions.SomethingWentWrongException;
import com.aurionpro.model.BankOperations;

/**
 * Servlet implementation class GenerateAccountNo
 */
@WebServlet("/GenerateAccountNo")
public class GenerateAccountNo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		  String customerId = request.getParameter("customerId");
		  String firstName = request.getParameter("firstName");
		  String lastName = request.getParameter("lastName");
		  String balance = request.getParameter("balance");
		
	  
		  RequestDispatcher  requestDispatcher = request.getRequestDispatcher("addbankaccount.jsp");
		 System.out.println("Customer info "+customerId+" "+firstName+" "+lastName+" "+balance);
		  
		 if(customerId.length()>0 && firstName.length()>0 && lastName.length()>0 && balance.length()>0)
		 {
			 
			  	System.out.println("Inside Generate Account Number");
			    String accNumber =  new BankOperations().generateAccountNumber();
			    System.out.println("Generated Account Number "+accNumber);
			    Customer customer = new Customer();
			    customer.setCustomerId(Integer.parseInt(customerId));
			    customer.setFirstName(firstName);
			    customer.setLastName(lastName);
			    customer.setBalance(Double.parseDouble(balance));
			    customer.setAccountNo(accNumber);
			    try
			    {
			    	new BankOperations().saveBankAccount(customer);
				    request.setAttribute("accno",customer);    	
			    }
			    catch(Exception e)
			    {
			    	System.out.println(e);
			    }
			    
		 }
		 else
		 {
			 request.setAttribute("error",new SomethingWentWrongException("Something Went Wrog while generating accno pls try again later"));
		 }
		 
		 requestDispatcher.forward(request,response);
		    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
