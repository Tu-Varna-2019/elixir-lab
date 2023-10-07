defmodule FunctionalProgrammingTest do
  use ExUnit.Case
  doctest FunctionalProgramming

  test "greets the world" do
    assert FunctionalProgramming.hello() == :world
  end
end
