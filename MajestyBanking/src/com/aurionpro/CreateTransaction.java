package com.aurionpro;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aurionpro.model.BankOperations;

/**
 * Servlet implementation class CreateTransaction
 */
@WebServlet("/CreateTransaction")
public class CreateTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	     HttpSession session = request.getSession();
		String transactionType = request.getParameter("TransactionType");
		String yourAccountNumber = request.getParameter("yourAccountNumber");
		String accountNo = request.getParameter("accountNo");
		Double  amount = Double.parseDouble(request.getParameter("amount"));
		String emailId = (String) session.getAttribute("emailId");
		String receiverAccountNo = request.getParameter("receiveraccountNo");
		RequestDispatcher requestDispatcher = null;
		
		System.out.println(transactionType+" "+yourAccountNumber+" "+accountNo+" "+amount+" "+emailId);
		 requestDispatcher = request.getRequestDispatcher("createtransaction.jsp");
		
		if(transactionType.equalsIgnoreCase("CREDIT") && yourAccountNumber!= null && yourAccountNumber.length()>0)
		{ 
			System.out.println("IN CREDIT "+emailId+" "+yourAccountNumber);
			try
			{
				if(emailId!= null && emailId.length()>0)
				new BankOperations().createCreditTransactions(yourAccountNumber, amount, emailId);
				request.setAttribute("message","Transaction Success : Amount CREDITED Successfully");
				 requestDispatcher.forward(request,response);
			    return;
			}
			catch(Exception e)
			{
				System.out.println("yoyou");
				System.out.println(e);
				request.setAttribute("error","Transaction FAILURE :"+e.getMessage());
				requestDispatcher.forward(request, response);
				return;
			}
			
		}
		if(transactionType.equalsIgnoreCase("DEBIT") && yourAccountNumber!= null && yourAccountNumber.length()>0)
		{
			System.out.println("In DEBIT");
			try
			{
				 if(emailId!=null && emailId.length()>0)
				 {
					 new BankOperations().createDebitTransactions(yourAccountNumber,amount,emailId);
					 request.setAttribute("message","Transaction Success : Amount Debited Successfully");
					 requestDispatcher.forward(request,response);
					 return;
				 }
			}
			catch(Exception e)
			{
				System.out.println("debit controller handler");
				System.out.println(e);
				request.setAttribute("error","Transaction FAILURE :"+e.getMessage());
				requestDispatcher.forward(request, response);
				return;
			}
			
		}
		if(transactionType.equalsIgnoreCase("TRANSFER") && yourAccountNumber!=null && yourAccountNumber.length()>0 && receiverAccountNo!= null && receiverAccountNo.length()>0 )
		{
			System.out.println("Transferring Amount");
			
			try
			{
				new BankOperations().performTransfer(yourAccountNumber,receiverAccountNo,emailId,amount);
				request.setAttribute("message","Transaction Success : Amount Transfered Successfully");
				 requestDispatcher.forward(request,response);
				 return;
				
			}
			catch(Exception e)
			{
				System.out.println("Transfer exception");
				System.out.println(e);
				request.setAttribute("error","Transaction FAILURE :"+e.getMessage());
				requestDispatcher.forward(request, response);
				
			}
		}
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
