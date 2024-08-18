package com.aurionpro;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.entities.Passbook;
import com.aurionpro.model.BankOperations;

/**
 * Servlet implementation class ViewTransactions
 */
@WebServlet("/ViewTransactions")
public class ViewTransactions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			   String tfilter = request.getParameter("tfilter");
			   System.out.println("Inside View Transactions");
			   System.out.println("1"+tfilter);
	     List<Passbook> transactions =  new BankOperations().fetchTransactions();
	     request.setAttribute("filter","all");
	     request.setAttribute("transactions",transactions);
	     RequestDispatcher requestDispatcher = null;
	     requestDispatcher = request.getRequestDispatcher("viewtransactions.jsp");
	     if(tfilter!=null && tfilter.equalsIgnoreCase("credit"))
	     {
	    	  transactions = transactions.stream()
	    			  					 .filter((item) -> item.getTransactionMode().equalsIgnoreCase("CREDIT"))
	    			  					 .collect(Collectors.toList());
	    	   request.setAttribute("transactions",transactions);
	    	   request.setAttribute("filter","credit");
	     }
	     if(tfilter!=null && tfilter.equalsIgnoreCase("debit"))
	     {
	    	  transactions = transactions.stream()
	    			  					 .filter((item)-> item.getTransactionMode().equalsIgnoreCase("debit"))
	    			  					 .collect(Collectors.toList());
	    	  request.setAttribute("transactions",transactions);
	    	  request.setAttribute("filter","debit");
	     }
	      
	     requestDispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
