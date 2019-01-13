defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_len = length(Cards.create_deck)
    assert deck_len == 52
  end

  test "shuffle randomizes deck" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "contains? checks if card in deck" do
    Cards.create_deck
    |> Cards.contains?("Ace of Spades")
    |> assert
  end

  #TODO figure out better way to do line 25-28
  test "deal distributes x amount of cards" do
    Cards.create_deck
    |> Cards.deal(5)
    |> case do
      {hand, rest_of_deck} ->
        assert length(hand) == 5
        assert length(rest_of_deck) == 47
    end
  end

  test "save deck" do
    Cards.create_deck
    |> Cards.save("filename")
    |> String.equivalent?("filename was saved")
    |> assert
  end

  test "load opens saved deck" do
    comparison_deck = Cards.create_deck
    loaded_deck = Cards.load("filename")
    assert loaded_deck == comparison_deck
  end


end
