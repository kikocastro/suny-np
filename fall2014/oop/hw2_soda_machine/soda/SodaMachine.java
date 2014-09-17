package edu.suny.np.oop.soda;

import java.util.ArrayList;
import java.util.Scanner;

public class SodaMachine {

	public static Transaction transaction;
	private static ArrayList<Transaction> transactions;
	private Scanner scan;
	private Inventory inventory = null;
	private ChangeMechanism changeMechanism;
	private String latestSelection = null;
	
	
	public SodaMachine() {
	}
	
	
	
	public void  processSelection() {
	}
	
	public void resetTransaction() {
	}
	
	public Transaction getTransaction(int t) {
	}
	
	public void advanceTransaction(int tid) {
	}
	
	public void saveSelection(String s) {
	}
	
	public void addTransactions() {

	}
	/**
	 * @param args - the legal inputs in this state
	 * this method gets input, checks it against legal
	 * inputs and returns input if legal; otherwise
	 * it returns the null string.
	 * 
	 */
	public String consumeInput(ArrayList<String> args) {
	}
	
	public void accumulateChange(String s) {
	}
	
	public void displayMachineInfo() {
	}
	
	public void initMachine() {
	}
	
	public void removeMachineReceipts() {
	}
	
	public void addToInventory(String s) {
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SodaMachine sm = new SodaMachine();
		sm.addTransactions();
		
		transaction = transactions.get(Transaction.INIT_TID);
		while(true) {
			SodaMachine.transaction.run();
		}
		

	}

}
