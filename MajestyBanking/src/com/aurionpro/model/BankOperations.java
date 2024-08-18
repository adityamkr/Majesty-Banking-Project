package com.aurionpro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.aurionpro.exceptions.*;

import com.aurionpro.exceptions.InvalidAmountException;
import com.aurionpro.exceptions.NoCustomerFoundException;
import com.aurionpro.entities.Customer;
import com.aurionpro.entities.Passbook;
import com.aurionpro.exceptions.SomethingWentWrongException;

public class BankOperations {

	private PreparedStatement preparedStatement;
	private Connection conn = DbConnection.connectToDb();

	public Customer fetchCustomerByCustomerId(int customerId) {

		Customer customer = null;

		if (conn != null) {
			try {
				preparedStatement = conn.prepareStatement("select * from customers where customer_id=?");
				preparedStatement.setInt(1, customerId);
				ResultSet resultSet = preparedStatement.executeQuery();
				if (resultSet.next()) {
					customer = new Customer();
					customer.setCustomerId(resultSet.getInt("customer_id"));
					customer.setFirstName(resultSet.getString("first_name"));
					customer.setLastName(resultSet.getString("last_name"));
					customer.setBalance(0.0);
					return customer;
				} else {
					throw new NoCustomerFoundException("Customer Does Not Exists ");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new SomethingWentWrongException("Something went wrong pls try again later");
			}

		}
		return customer;
	}

	public String generateAccountNumber() {
		Random random = new Random();
		StringBuilder str = new StringBuilder();
		for (int i = 0; i < 5; i++) {
			int digit = random.nextInt(10);
			str.append(digit);
		}
		String accNo = str.toString();

		return accNo;
	}

	public void saveBankAccount(Customer customer) {
		if (conn != null) {
			try {
				preparedStatement = conn.prepareStatement("insert into accounts values (?,?,?)");
				preparedStatement.setString(1, customer.getAccountNo());
				preparedStatement.setDouble(2, customer.getBalance());
				preparedStatement.setInt(3, customer.getCustomerId());
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new SomethingWentWrongException("Error occured while storing the account details");

			}
		}
	}

	public void createCreditTransactions(String accountNo, double amount, String emailId) {
		if (amount <= 0)
			throw new InvalidAmountException("Amount Should be Only be Positive Integers");
		double earlierAccountBalance = getEarlierAccountBalance(accountNo, emailId);

		if (earlierAccountBalance == -1)
			throw new AccountNotFoundException("Account Not Found");
		try {
			String query = "update accounts set balance = balance + ? where account_no=?";
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setDouble(1, amount);
			preparedStatement.setString(2, accountNo);
			preparedStatement.executeUpdate();
			System.out.println("Amount Added to Account Successfully and balance is updated");
			query = "insert into transactions values (default,?,?,?,?,?)";
			preparedStatement = conn.prepareStatement(query);
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			preparedStatement.setDate(1, sqlDate);
			preparedStatement.setString(2, "CREDIT");
			preparedStatement.setString(3, accountNo);
			preparedStatement.setString(4, accountNo);
			preparedStatement.setDouble(5, amount);
			preparedStatement.executeUpdate();
			System.out.println("Transaction Made Successfully updated transaction");

		} catch (Exception e) {
			System.out.println("hahahahahah");
			// e.printStackTrace();
			throw new com.aurionpro.exceptions.AccountNotFoundException(e.getMessage());
		}
	}

	
	public void createDebitTransactions(String yourAccountNumber, Double amount, String emailId) {
		// TODO Auto-generated method stub
		if (amount <= 0)
			throw new InvalidAmountException("Amount Should be Only be Positive Integers");

		double earlierAccountBalance = getEarlierAccountBalance(yourAccountNumber, emailId);

		if (earlierAccountBalance == -1)
			throw new com.aurionpro.exceptions.AccountNotFoundException("Account Not Found");

		if (earlierAccountBalance - amount < 0)
			throw new InvalidAmountException("Transaction Failed ! Insufficent Balance Found in Account");

		else {
			try {
				System.out.println("Inside try");
				preparedStatement = conn
						.prepareStatement("update accounts set balance = balance - ? where account_no=?");
				preparedStatement.setDouble(1, amount);
				preparedStatement.setString(2, yourAccountNumber);
				preparedStatement.executeUpdate();

				String query = "insert into transactions values (default,?,?,?,?,?)";
				preparedStatement = conn.prepareStatement(query);
				java.util.Date date = new java.util.Date();
				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				preparedStatement.setDate(1, sqlDate);
				preparedStatement.setString(2, "DEBIT");
				preparedStatement.setString(3, yourAccountNumber);
				preparedStatement.setString(4, yourAccountNumber);
				preparedStatement.setDouble(5, amount);
				preparedStatement.executeUpdate();
				System.out.println("Transaction Made Successfully DEBITED");
			} catch (SQLException e) {
				System.out.println(e);
			}

		}

	}

	public double getEarlierAccountBalance(String accountNo, String emailId) {
		String query = "SELECT a.account_no, a.balance, c.first_name, c.last_name " + "FROM accounts a "
				+ "JOIN customers c ON a.customer_id = c.customer_id " + "WHERE c.email_id = ?";
		
		try {

			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, emailId);
			boolean accountFound = false;
			ResultSet resultSet = preparedStatement.executeQuery();
			double earlierAccountBalance = 0;

			while (resultSet.next()) {
				System.out.println(resultSet.getString(1) + " " + resultSet.getString(2));
				if (resultSet.getString("account_no").equalsIgnoreCase(accountNo)) {
					accountFound = true;
					earlierAccountBalance = resultSet.getDouble("balance");
					return earlierAccountBalance;
				}
			}
			System.out.println("returning -1");
			return -1;
		} catch (Exception e) {
			System.out.println(e);
			throw new SomethingWentWrongException(e.getMessage());
		}

	}

	public void performTransfer(String yourAccountNumber, String receiverAccountNo, String emailId,double amount){
		// TODO Auto-generated method stub
		boolean foundReceiverAccountNo = false;
		if (amount <= 0)
			throw new InvalidAmountException("Amount Should be Only be Positive Integers");
		
		double earlierAccountBalance = getEarlierAccountBalance(yourAccountNumber, emailId);
	    if(earlierAccountBalance ==-1)
	    	 throw new com.aurionpro.exceptions.AccountNotFoundException("Account Not Found");
		
	    try {
			preparedStatement = conn.prepareStatement("select * from accounts where account_no =?");
			preparedStatement.setString(1,receiverAccountNo);
			ResultSet resultSet = preparedStatement.executeQuery();
			double receiverAccountBalance=-1;
			while(resultSet.next())
			{
				if(resultSet.getString("account_no").equalsIgnoreCase(receiverAccountNo)) {
					foundReceiverAccountNo = true;
					receiverAccountBalance= resultSet.getDouble("balance");
					break;
				}
			}
			if(!foundReceiverAccountNo) {
				throw new com.aurionpro.exceptions.AccountNotFoundException("Receiver Account Not Found");
			}
			 if(earlierAccountBalance - amount < 0)
			 {
				 throw new InvalidAmountException("Balance is too less to transfer amount");
			 }
			 
			
			
			 preparedStatement = conn.prepareStatement("update accounts set balance = balance - ? where account_no =?");
			 preparedStatement.setDouble(1,amount);
			 preparedStatement.setString(2,yourAccountNumber);
			 preparedStatement.executeUpdate();
			 
		     preparedStatement = conn.prepareStatement("update accounts set balance = balance + ? where account_no=?");
		     preparedStatement.setDouble(1,amount);
		     preparedStatement.setString(2,receiverAccountNo);
		     preparedStatement.executeUpdate();
		     
		     String query = "insert into transactions values (default,?,?,?,?,?)";
				preparedStatement = conn.prepareStatement(query);
				java.util.Date date = new java.util.Date();
				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				preparedStatement.setDate(1, sqlDate);
				preparedStatement.setString(2, "DEBIT");
				preparedStatement.setString(3, yourAccountNumber);
				preparedStatement.setString(4, receiverAccountNo);
				preparedStatement.setDouble(5, amount);
				preparedStatement.executeUpdate();
				System.out.println("Transaction Made Successfully DEBIT");
				
				
		     	 query = "insert into transactions values (default,?,?,?,?,?)";
				preparedStatement = conn.prepareStatement(query);
				 date = new java.util.Date();
				 sqlDate = new java.sql.Date(date.getTime());
				preparedStatement.setDate(1, sqlDate);
				preparedStatement.setString(2, "CREDIT");
				preparedStatement.setString(3, yourAccountNumber);
				preparedStatement.setString(4, receiverAccountNo);
				preparedStatement.setDouble(5, amount);
				preparedStatement.executeUpdate();
				System.out.println("Transaction made Successfully CREDIT");
				
				
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new SomethingWentWrongException(e.getMessage());
			
		}
	}
	
	public List<Passbook> fetchTransactions()
	{
		List<Passbook> passbook = new ArrayList<>();
		try {
		preparedStatement = conn.prepareStatement("select * from transactions ");
		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			passbook.add(new Passbook(resultSet.getString("sender_accountno"),
			resultSet.getString("receiver_accountno"), 
			resultSet.getString("transaction_mode"),
			resultSet.getDouble("amount"), 
			resultSet.getDate("transaction_date")));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return passbook;
	}

}
