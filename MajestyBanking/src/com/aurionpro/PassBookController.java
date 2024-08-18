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
import javax.servlet.http.HttpSession;

import com.aurionpro.entities.Passbook;
import com.aurionpro.model.CustomerOperations;

/**
 * Servlet implementation class PassBookController
 */
@WebServlet("/PassBookController")
public class PassBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String accountNo = request.getParameter("accountNo");
		String accountNoFilter = request.getParameter("accountNoFilter");
		String emailId = (String) session.getAttribute("emailId");
		String applyFilters = request.getParameter("applyFilters");
		System.out.println(accountNo + " " + accountNoFilter + " " + applyFilters + " " + emailId);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("viewpassbook.jsp");

		if (applyFilters != null && request.getParameter("applyFilters").equalsIgnoreCase("true") && accountNo != null
				&& accountNo.length() > 0 && accountNoFilter != null && emailId != null) {
			try {
				List<Passbook> accounts = new CustomerOperations().fetchPassbookByAccountNo(accountNo, emailId);
				if (accountNoFilter.equalsIgnoreCase("0")) {

					request.setAttribute("passbook", accounts);

				}
				if (accountNoFilter.equalsIgnoreCase("credit")) {
					List<Passbook> accountWithOnlyCredits = accounts.stream()
							.filter(account -> account.getTransactionMode().equalsIgnoreCase("CREDIT") == true)
							.collect(Collectors.toList());
					request.setAttribute("passbook", accountWithOnlyCredits);
				}
				if (accountNoFilter.equalsIgnoreCase("debit")) {
					List<Passbook> accountWithOnlyCredits = accounts.stream()
							.filter(account -> account.getTransactionMode().equalsIgnoreCase("DEBIT") == true)
							.collect(Collectors.toList());
					request.setAttribute("passbook", accountWithOnlyCredits);
				}
				requestDispatcher.forward(request, response);
				return;
			} catch (Exception e) {

				System.out.println("Yo" + e.getMessage());
				request.setAttribute("error", "Sorry No Account Found");

			}
		}

		List<Passbook> passbook = new CustomerOperations().fetchCustomerPassbook(emailId);
		request.setAttribute("passbook", passbook);

		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
