defmodule Cards do
  @moduledoc """
    Provides methods of creating and handling deck of cards
  """

  # def start(_type, _args) do
  #   IO.puts(Cards.shuffle(deck))
  #   Supervisor.start_link([], strategy: :one_for_one)
  # end

  @doc """
    creating a deck of cards
  """
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

  @doc """
    Determin if the deck has the given card.

  ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides the deck in to a hand and remainder of the deck.
    The `hand_size` argument defines how many cards should be in the hand.

  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
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
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "This file is not found"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
