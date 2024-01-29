package sub1;

public class Account {

	private String bank;
	private String id;
	private String name;
	private int balance;
	
	public Account(String bank, String id, String name, int balance) {
		this.bank = bank;
		this.id = id;
		this.name = name;
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "Account [bank=" + bank + ", id=" + id + ", name=" + name + ", balance=" + balance + "]";
	}
}
