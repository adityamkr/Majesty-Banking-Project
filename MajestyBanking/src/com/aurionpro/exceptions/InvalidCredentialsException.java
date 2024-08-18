package com.aurionpro.exceptions;

public class InvalidCredentialsException extends RuntimeException {

	private String message;
	public InvalidCredentialsException(String message)
	{
		this.message= message;
	}
	
	public String getMessage()
	{
		return message;
	}
}
