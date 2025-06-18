defmodule Cards do
  # def start(_type, _args) do
  #   IO.puts(Cards.shuffle(deck))
  #   Supervisor.start_link([], strategy: :one_for_one)
  # end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    cards =
      for value <- values, suit <- suits do
        "#{value} of #{suit}"
      end

    List.flatten(cards)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end

# deck = Cards.create_deck()
# shuffle = Cards.shuffle(deck)

# IO.inspect(shuffle)
