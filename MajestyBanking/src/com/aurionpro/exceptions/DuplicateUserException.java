package com.aurionpro.exceptions;

public class DuplicateUserException extends RuntimeException {

	String message;
	public DuplicateUserException(String message)
	{
		this.message = message;
	}
	
	public String getMessage()
	{
		return this.message;
	}
}
