defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "creat_deck makes 20 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 20
  end

  test "shuffle card deck shouldnt be same as the 1st card deck" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
  end
end
