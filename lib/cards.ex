defmodule Cards do
  @moduledoc """
    Provides methods for doing stuff with card deck
  """

  @doc """
    Says hello
  """
  def hello do 
    "hi there"
  end 

  def create_deck do
    values= ["Ace","King", "Jack", "Ten", "Six", "Seven"]
    suits=["Diamonds","Clubs","Spades","Hearts"]

    for  value <- values, suit <- suits do 
      "#{value} of #{suit}" 
    end 
  end 

  #method doesn't have to be called shuffle
  def shuffle(deck) do
    #shuffle is a piece of funcitnality built into Enum
    Enum.shuffle(deck)
  end 

  @doc """
    Does deck contain a certain card.

  ## Examples 

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """

  def contains?(deck,card) do 
    Enum.member?(deck,card)
  end 

  @doc """
    Takes in 2 arguments. First is the deck that you 
    want to apply method to, the second is an int representing 
    the size of the hand you want to generate.
    `hand_size` is second arg.

  """

  def deal(deck, hand_size) do 
    Enum.split(deck, hand_size)
  end 

  def save(deck,filename) do 
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end 

  def load(filename) do 
    case File.read(filename) do 
      {:ok, binary} -> :erlang.binary_to_term(binary) 
      {:error, _reason} -> "File can't be found" 
    end 
  end 

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size) 
  end 
end
