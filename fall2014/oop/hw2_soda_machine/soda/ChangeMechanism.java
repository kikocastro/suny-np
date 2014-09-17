package edu.suny.np.oop.soda;

public class ChangeMechanism {
	private int cust_q = 0, cust_d = 0 , cust_n = 0;
	private final int MAX_Q = 3;
	private final int MAX_D = 3;
	private final int MAX_N = 3;
	private int changeBox = 0;
	private int amountEntered = 0;
	
	public ChangeMechanism() {
	}
	
	public void resetAmountEntered() {
	}
	
	public void init(){
	}
	

	
	
	public String emptyCashBox() {
		
	}
	
	public String toString() {
	}
	/**
	 * 
	 * @param c must be 5, 10 or 25
	 * 
	 * Accepts change into the change mechanism. If 
	 */
	public void addChange(int c) {
	}
	
	public void addChange(String s) {
	}
	
	private String buildChangeString(int amountReturned) { 
	}
	
	/**
	 * method called to calculate the  amount of change coming back to the 
	 * machine user. Assumes coins have already been added.
	 * @param cost cost of current selection (Use 0 for lack of inventory)
	 * @return
	 */
	public String getChange(int cost) {
	}
	public int getAmountEntered () {
	}
	
	
	
}
