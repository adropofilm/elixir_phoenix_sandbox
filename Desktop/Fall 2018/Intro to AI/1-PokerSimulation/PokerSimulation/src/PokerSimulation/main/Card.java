package PokerSimulation.main;

public class Card {

	private String suite;
	private String value;
	
	public Card(String suite, String value) {
		this.suite = suite;
		this.value = value;
	}
	
	// Accessors and Mutators:
	public String get_suite() 
	{
		return suite;
	}
	
	public String get_value()
	{
		return value;
	}
	
	public String get_card() 
	{
		return suite+value;
	}
	
	public void set_suite(String suite)
	{
		this.suite = suite;
	}

	public void set_value(String value)
	{
		this.value = value;
	}
}