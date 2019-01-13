defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling deck of cards.

  """

  @doc """
    Returns list of strings representing a deck of playing cards.
  """
  def create_deck do
    values = ["Ace", "2", "3", "4", "5", "6", "7", "8",
      "9", "10", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  @doc """
    Returns a deck of shuffled cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Returns boolean for whether or not card in deck.

  ## Example:
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    card in deck
  end

  @doc """
    Divides deck into hand and reminder of deck.
    The `hand_size` argument indicates how many
    cards you want in hand.

  ## Example:
      iex> deck = Cards.create_deck
      iex> {hand, _rest_of_deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves deck to computer.

  ## Example:
      iex> deck = Cards.create_deck
      iex> Cards.save(deck, "filename")
      "filename was saved"
  """
  def save(deck, filename) do
    # convert deck to erlang's def of object & save
    binary = :erlang.term_to_binary(deck)
    case File.write(filename, binary) do
      :ok -> "#{filename} was saved"
      _ -> "There was an error saving #{filename}"
    end
  end

  @doc """
    Opens saved deck.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "#{filename} does not exist"
    end
  end

  @doc """
    Creates a shuffled deck and divides into a hand of
    desired size(`hand_size`) and remainder.
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
