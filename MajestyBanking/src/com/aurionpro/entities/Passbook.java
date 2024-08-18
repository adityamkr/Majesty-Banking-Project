package com.aurionpro.entities;

import java.util.Date;

public class Passbook {
	private String senderAccountNo;
	private String receiverAccountNo;
	private String transactionMode;
	private double amount;
	private Date date;
	
	public Passbook(String senderAccountNo, String receiverAccountNo, String transactionMode, double amount,
			Date date) {
		super();
		this.senderAccountNo = senderAccountNo;
		this.receiverAccountNo = receiverAccountNo;
		this.transactionMode = transactionMode;
		this.amount = amount;
		this.date = date;
	}

	public String getSenderAccountNo() {
		return senderAccountNo;
	}

	public void setSenderAccountNo(String senderAccountNo) {
		this.senderAccountNo = senderAccountNo;
	}

	public String getReceiverAccountNo() {
		return receiverAccountNo;
	}

	public void setReceiverAccountNo(String receiverAccountNo) {
		this.receiverAccountNo = receiverAccountNo;
	}

	public String getTransactionMode() {
		return transactionMode;
	}

	public void setTransactionMode(String transactionMode) {
		this.transactionMode = transactionMode;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	   

}
