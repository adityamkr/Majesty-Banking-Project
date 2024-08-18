package com.aurionpro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import com.aurionpro.exceptions.*;

import com.aurionpro.entities.Admin;
import com.aurionpro.entities.Customer;
import com.aurionpro.entities.Passbook;
import com.aurionpro.exceptions.DuplicateUserException;
import com.aurionpro.exceptions.InvalidCredentialsException;
import com.aurionpro.exceptions.SomethingWentWrongException;
import com.mysql.cj.xdevapi.Result;

public class CustomerOperations {

	private PreparedStatement preparedStatement;
	private Connection conn = DbConnection.connectToDb();

	public Customer loginCustomer(Customer customer) {

		Customer authenticatedCustomer = null;
		if (conn != null) {
			try {
				preparedStatement = conn.prepareStatement("select * from customers where email_id=? and password= ?");
				preparedStatement.setString(1, customer.getEmailId());
				preparedStatement.setString(2, customer.getPassword());
				ResultSet resultSet = preparedStatement.executeQuery();
				if (!resultSet.next())
					throw new InvalidCredentialsException("Login Failed : Pls enter the Email and Password Correctly");
				authenticatedCustomer = new Customer(resultSet.getInt("customer_id"), resultSet.getString("first_name"),
						resultSet.getString("last_name"), resultSet.getString("email_id"),
						resultSet.getString("password"));

			} catch (SQLException e) {
				// TODO Auto-generated catch block

				e.printStackTrace();
				throw new SomethingWentWrongException("Something Went Wrong Pls try again later");

			}
		}
		return authenticatedCustomer;

	}

	public void saveCustomerToDb(Customer customer) {
		Connection conn = DbConnection.connectToDb();
		if (conn != null) {
			try {
				preparedStatement = conn.prepareStatement("insert into customers values(default,?,?,?,?)");
				preparedStatement.setString(1, customer.getFirstName());
				preparedStatement.setString(2, customer.getLastName());
				preparedStatement.setString(3, customer.getEmailId());
				preparedStatement.setString(4, customer.getPassword());
				preparedStatement.executeUpdate();
				System.out.println("Customer Added Successfully to the Database by Admin");
			} catch (SQLIntegrityConstraintViolationException dup) {
				System.out.println(dup);
				throw new DuplicateUserException(" User Already exists with the emailId. Kindly enter new Email Id");
			} catch (Exception e) {
				System.out.println(e);
				throw new InvalidCredentialsException(" Pls fill all the credentials Correctly");
			}
		}
	}

	public List<Customer> viewAllCustomers() {
		String query = " select c.customer_id,c.first_name,c.last_name,a.account_no,a.balance from customers c left join accounts a using (customer_id)";
		List<Customer> customers = new ArrayList<Customer>();
		try {
			preparedStatement = conn.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Customer customer = new Customer();
				customer.setCustomerId(Integer.parseInt(resultSet.getString("customer_id")));
				customer.setFirstName(resultSet.getString("first_name"));
				customer.setLastName(resultSet.getString("last_name"));
				String accountNumber = resultSet.getString("account_no");
				if (accountNumber == null)
					customer.setAccountNo("N.A.");
				else
					customer.setAccountNo(accountNumber);

				double balance = resultSet.getDouble("balance");

				if (resultSet.wasNull())
					customer.setBalance(0.0);
				else
					customer.setBalance(balance);

				customers.add(customer);
			}
			System.out.println(customers);

		} catch (Exception e) {
			System.out.println(e);
			throw new SomethingWentWrongException("Problem Occured While Fetching Customer Records from Db");
		}
		return customers;
	}

	public List<Customer> filterByFirstNameAndBalance(String fname, double balance) {
		List<Customer> customers = new ArrayList<>();
		String sql;
		try {
			if (balance == -1) {
				sql = "select c.customer_id,c.first_name,c.last_name,a.account_no,a.balance from customers c left join accounts a using (customer_id) where first_name=? and (a.balance>? or a.balance is null)";
			} else {
				sql = "select c.customer_id,c.first_name,c.last_name,a.account_no,a.balance from customers c left join accounts a using (customer_id) where first_name=? and a.balance>?)";
			}
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, fname);
			preparedStatement.setDouble(2, balance);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Customer customer = new Customer();
				customer.setCustomerId(Integer.parseInt(resultSet.getString("customer_id")));
				customer.setFirstName(resultSet.getString("first_name"));
				customer.setLastName(resultSet.getString("last_name"));
				String accountNumber = resultSet.getString("account_no");
				if (accountNumber == null)
					customer.setAccountNo("N.A.");
				else
					customer.setAccountNo(accountNumber);

				double bal = resultSet.getDouble("balance");

				if (resultSet.wasNull())
					customer.setBalance(0.0);
				else
					customer.setBalance(bal);

				customers.add(customer);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return customers;
	}

	public List<Passbook> fetchCustomerPassbook(String emailId) {
		List<Passbook> passbook = new ArrayList<>();
		try {
			preparedStatement = conn.prepareStatement(
"select t.* from accounts a join customers c on a.customer_id = c.customer_id and c.email_id=? join transactions t on t.sender_accountno = a.account_no or t.receiver_accountno = a.account_no");
			//preparedStatement.setString(1, accountNo);
			preparedStatement.setString(1, emailId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				passbook.add(new Passbook(resultSet.getString("sender_accountno"),
						resultSet.getString("receiver_accountno"), resultSet.getString("transaction_mode"),
						resultSet.getDouble("amount"), resultSet.getDate("transaction_date")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
//		try {
//			preparedStatement = conn.prepareStatement("select * from transactions ");
//			ResultSet resultSet = preparedStatement.executeQuery();
//
//			while (resultSet.next()) {
//				passbook.add(new Passbook(resultSet.getString("sender_accountno"),
//						resultSet.getString("receiver_accountno"), resultSet.getString("transaction_mode"),
//						resultSet.getDouble("amount"), resultSet.getDate("transaction_date")));
//
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		return passbook;

	}

	public List<Passbook> fetchPassbookByAccountNo(String accountNo, String emailId) {

		double balance = new BankOperations().getEarlierAccountBalance(accountNo, emailId);
		List<Passbook> passbook = new ArrayList<>();
		if (balance == -1)
			throw new AccountNotFoundException("No Transaction Found for the Account");
		if (balance != -1) {
			try {
				preparedStatement = conn.prepareStatement(
	"select t.* from accounts a join customers c on a.customer_id = c.customer_id and c.email_id=? join transactions t on t.sender_accountno = a.account_no or t.receiver_accountno = a.account_no");
				//preparedStatement.setString(1, accountNo);
				preparedStatement.setString(1, emailId);
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					passbook.add(new Passbook(resultSet.getString("sender_accountno"),
							resultSet.getString("receiver_accountno"), resultSet.getString("transaction_mode"),
							resultSet.getDouble("amount"), resultSet.getDate("transaction_date")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return passbook;
	}
	
	
	
	
}
