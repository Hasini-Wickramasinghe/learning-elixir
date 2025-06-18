defmodule ProjectOne do
  use Application

  def start(_type, _args) do
    IO.puts(ProjectOne.hello())
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    users = [{"Hasini", "Software engineer"}, {"Rashmi", "SDET"}, {"Gimshan", "lecturer"}]

    Enum.each(users, fn {name, occupation} ->
      IO.puts("#{name} is a #{occupation}")
    end)
  end

  def hello do
    correct = :rand.uniform(10)
    IO.puts("randome number: #{correct}")
    guess = IO.gets("Guess a number between 1 and 10:") |> String.trim() |> Integer.parse()
    IO.inspect(guess)

    case guess do
      {result, _} ->
        IO.puts("result #{result}")

        if result === correct do
          IO.puts("Your guess is correct")
        else
          IO.puts("your guess is wrong")
        end

      :error ->
        IO.puts("something went wrong")
    end
  end
end
