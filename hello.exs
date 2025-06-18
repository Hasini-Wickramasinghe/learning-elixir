defmodule Hello do
  def test(name) do
    IO.puts("hello #{name}")
  end
end

Hello.test("hasini")
