package com.aurionpro;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.entities.Customer;
import com.aurionpro.model.CustomerOperations;

/**
 * Servlet implementation class ViewCustomersController
 */
@WebServlet("/ViewCustomersController")
public class ViewCustomersController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("viewcustomers.jsp");
		System.out.println("Inside viewcustomers");
		String applyFilters = request.getParameter("applyFilters");
		System.out.println(applyFilters);
		if(applyFilters== null)
		{
			applyFilters="false";
		}
		
		System.out.println("applyFilters Value "+applyFilters);
		try
		{
			if(applyFilters.equalsIgnoreCase("true"))
			{
				System.out.println("Apply Filters are true Now");
				String firstName = request.getParameter("firstName");
				String balanceFilter = request.getParameter("balanceFilter");
				
				Double balance = Double.parseDouble(balanceFilter);
				System.out.println(firstName+" "+balanceFilter);
				
				List<Customer> customers = new CustomerOperations().filterByFirstNameAndBalance(firstName,balance);
				  request.setAttribute("customers",customers);
				  request.setAttribute("filter",balanceFilter);
				  request.setAttribute("firstName",firstName);
				
			}
			if(!applyFilters.equalsIgnoreCase("true"))
			{
				System.out.println("Apply Filters are not true");
				List<Customer> customers = new CustomerOperations().viewAllCustomers();
				request.setAttribute("customers",customers);
			}
		   
		}
		catch(Exception e)
		{
			request.setAttribute("error",e.getMessage());
		    System.out.println(e);
		}
		requestDispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
