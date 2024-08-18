package com.aurionpro.entities;

public class Customer {

	private int customerId;
	private String firstName;
    private String lastName;
    private String password;
    private String emailId;
    private double balance;
    private String accountNo;
    
     public Customer()
     {
    	 
     }
    
	public Customer(int customerId, String firstName, String lastName,String emailId,String password)
	{	
		this.customerId = customerId;
		this.password =password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailId = emailId;
		
	}
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	
	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", password=" + password + ", emailId=" + emailId + ", balance=" + balance + ", accountNo="
				+ accountNo + "]";
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
    
    	
	
}
