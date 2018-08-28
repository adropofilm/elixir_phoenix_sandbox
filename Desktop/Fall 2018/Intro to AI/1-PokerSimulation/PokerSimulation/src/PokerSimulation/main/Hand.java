package PokerSimulation.main;
import java.util.concurrent.ThreadLocalRandom;

public class Hand {

	private int Rank;
	private Card cards[] = new Card[5];
	private int cards_in_hand = 0;
	
	
	/**  
	 * Chooses (randomly) cards from the community pile.
	 */
	public void choose_cards(Card community_cards[]) 
	{
		int randomNum = ThreadLocalRandom.current().nextInt(0, 4 + 1);
		
	}
	
	public void add_card(Card card_to_add)
	{
		cards[this.cards_in_hand] = card_to_add;	
	}
	
	public int get_num_cards()
	{
		return this.cards_in_hand;
	}
	
}
