defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "createDeck creates 20 cards" do
    deckLength = length(Cards.createDeck())
    assert deckLength === 20
  end

  test "shuffle randomize deck" do
    deck = Cards.createDeck()
    assert deck != Cards.shuffle(deck)
  end
end
