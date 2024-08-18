package com.aurionpro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.aurionpro.entities.Admin;
import com.aurionpro.exceptions.DuplicateUserException;
import com.aurionpro.exceptions.InvalidCredentialsException;
import com.aurionpro.exceptions.SomethingWentWrongException;

public class AdminOperations {

	private PreparedStatement preparedStatement;
	private Connection conn;
	private DbConnection dbConnection;
	
	   
	
		 
	public Admin saveAdmin(Admin admin)
	{
	    Connection conn = DbConnection.connectToDb();
	    if(conn != null)
	    {
	    	try {
				preparedStatement = conn.prepareStatement("insert into admin values(default,?,?)");
				preparedStatement.setString(1,admin.getUsername());
				preparedStatement.setString(2,admin.getPassword());
				preparedStatement.executeUpdate();
				System.out.println("Admin Added Successfully");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				throw new DuplicateUserException(" Kindly Login UserName Already Exists");
			}
	    	
	    }
	    return admin;
	}
	
	public Admin loginAdmin(Admin admin) {
		
		Connection conn  = DbConnection.connectToDb();
		Admin authenticatedAdmin= null;
		 if(conn!= null)
		 {
			  try {
				preparedStatement  = conn.prepareStatement("select * from admin where username=? and password= ?");
				preparedStatement.setString(1,admin.getUsername());
				preparedStatement.setString(2,admin.getPassword());
				ResultSet resultSet = preparedStatement.executeQuery();
				 if(!resultSet.next())
					 throw new InvalidCredentialsException(" Pls enter the Username and Password Correctly");
				 authenticatedAdmin = new Admin(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3));
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				 throw new SomethingWentWrongException("Something Went wrong pls try again later");
			}
		 }
		 return authenticatedAdmin;
	}
	
}
