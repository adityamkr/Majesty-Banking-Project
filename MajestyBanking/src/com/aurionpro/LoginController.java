package com.aurionpro;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aurionpro.entities.Admin;
import com.aurionpro.entities.Customer;
import com.aurionpro.model.AdminOperations;
import com.aurionpro.model.CustomerOperations;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Inside Lofin Controller");
		// TODO Auto-generated method stub
		String loginRole = request.getParameter("loginRole");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String emailId = request.getParameter("email");
		System.out.println(loginRole+" "+username+" "+password+" "+emailId);
		HttpSession session = null;
		RequestDispatcher requestdispatcher = null;
		session = request.getSession();
		if (loginRole.equalsIgnoreCase("Adminlogin") && username != null && username.length()>0 && password != null && password.length()>0) {
			System.out.println("Inside Admin Login");
			Admin admin = new Admin();
			admin.setUsername(username);
			admin.setPassword(password);
			try {
					admin = new AdminOperations().loginAdmin(admin);
					System.out.println("AdminLogin Successfully");
					session.setAttribute("role", "admin");
					session.setAttribute("adminName",username);
					request.setAttribute("greetAdmin","true");
					requestdispatcher = request.getRequestDispatcher("admindashboard.jsp");
					requestdispatcher.forward(request, response);
					return;
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				requestdispatcher = request.getRequestDispatcher("login.jsp");
				request.setAttribute("role", "unknown");
				request.setAttribute("error", e.getMessage());
				requestdispatcher.forward(request, response);
				return;
			}
		}
		if(loginRole.equalsIgnoreCase("Customerlogin") && emailId != null && emailId.length()>0 && password!=null && password.length()>0)
		{
			System.out.println("Inside Customer login");
			System.out.println(emailId+" "+password);
			System.out.println("Username "+username);
			Customer customer = new Customer();
			
			customer.setEmailId(emailId);
			customer.setPassword(password);
			customer.setFirstName(username);
		
			try
			{
				customer = new CustomerOperations().loginCustomer(customer);
				System.out.println("Customer Logged in Successfully");
				session.setAttribute("emailId",emailId);
				session.setAttribute("role","customer");
				requestdispatcher = request.getRequestDispatcher("PassBookController");
				requestdispatcher.forward(request,response);
				return;
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
				requestdispatcher = request.getRequestDispatcher("login.jsp");
				request.setAttribute("role", "unknown");
				request.setAttribute("error", e.getMessage());
				requestdispatcher.forward(request, response);
				return;
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
