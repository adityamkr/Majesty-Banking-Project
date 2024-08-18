package com.aurionpro.exceptions;

public class SomethingWentWrongException extends RuntimeException {

	 String message;
	  public SomethingWentWrongException(String message)
	  {
		  this.message = message;
	  }
	  
	  public String getMessage()
	  {
		  return this.message;
	  }
}
