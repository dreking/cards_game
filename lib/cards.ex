defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling deck of cards
  """

  @doc """
  Returns a list of strings representing a deck of playing cards
  """
  def createDeck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Determines whether a deck contains a given card
  ## Examples
      iex> deck = Cards.createDeck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck
  The `handSize` argument indicates how many cards should be in the hand
  ## Examples
      iex>deck = Cards.createDeck()
      iex>{hand, _rest} = Cards.deal(deck, 1)
      iex>hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # First implementation
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "Something went wrong"
    end

    # Second implementation
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "Somethting went wrong with Error: #{reason}"
    end
  end

  def createHand(handSize) do
    # deck = Cards.createDeck()
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, handSize)

    # Implement Pipe Operator

    Cards.createDeck()
    |> Cards.shuffle()
    |> Cards.deal(handSize)
  end

  def createmaps do
    colors = %{primary: "red", secondary: "Blue"}
    colors.primary

    # pattern matching
    %{secondary: sec} = colors
    sec
  end

  def updatemaps do
    map = %{a: "red", b: 21}
    # First approach
    %{map | a: "one"}

    # Second approach
    Map.put(map, :a, 2)
  end
end
