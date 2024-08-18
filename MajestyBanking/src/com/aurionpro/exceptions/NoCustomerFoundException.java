package com.aurionpro.exceptions;

public class NoCustomerFoundException extends RuntimeException {

	String message;
	public NoCustomerFoundException(String message)
	{
		this.message = message;
	}
	
	public String getMessage()
	{
		return this.message;
	}
}
