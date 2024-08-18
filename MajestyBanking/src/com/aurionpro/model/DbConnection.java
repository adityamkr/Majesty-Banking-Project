package com.aurionpro.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class DbConnection {

	private static Connection con = null;
	private static Statement statement = null;


	public static  Connection connectToDb() {
		if(con == null)
		{
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/majestybanking", "root", "root");
				statement = con.createStatement();
				System.out.println("Connection Successful");
				
			} catch (Exception e) {
				System.out.println(e);
			}

		}
		return con;
		
	}

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public Statement getStatement() {
		return statement;
	}

	public void setStatement(Statement statement) {
		this.statement = statement;
	}

	
	
	
	
	
	
	

}
