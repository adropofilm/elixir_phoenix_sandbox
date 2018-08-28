package PokerSimulation.main;

public class Deck {
	private Card deck[] = new Card[52];
	
	public Deck() 
	{
		initiate_deck();
	}
	
	private void initiate_deck() 
	{
		String Suites[] = {"D", "H", "S", "C"};
		String Values[] = {"A", "2", "3", "4", "5", "6","7","8","9","10","J","Q","K"};
		
		// Initiate 52 card deck:
		int card_num = 0;
		
		for (int i = 0; i<4; i++) {
			for (int j=0; j<13; j++) {
				Card temp_card = new Card(Suites[i], Values[j]);
				this.deck[card_num] = temp_card;
				card_num++;
			}
		}
	}
	
	// TODO add deal_cards(int cards_needed) to deal cards to players and community pile
	// this also subtracts cards from deck once complete.
	
	public void remove_card(Card card)
	{
		// pass
	}
	
	// Accessors and Mutators:
	
	
	
	

}
