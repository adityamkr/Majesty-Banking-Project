package com.aurionpro.exceptions;

public class AccountNotFoundException  extends RuntimeException{

	String message;
	
	 public AccountNotFoundException(String message)
	 {
		 this.message = message;
	 }
	 
	 public String getMessage()
	 {
		 return this.message;
	 }
}
