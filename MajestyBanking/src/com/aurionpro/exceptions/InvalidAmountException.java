package com.aurionpro.exceptions;

public class InvalidAmountException extends  RuntimeException {

	  String message;
	  
	   public InvalidAmountException(String message)
	   {
		   this.message = message;
	   }
	   
	   public String getMessage()
	   {
		   return this.message;
	   }
}
