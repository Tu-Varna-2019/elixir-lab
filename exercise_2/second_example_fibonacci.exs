defmodule Second_example_fibonacci do
  def second_fib(0), do: 0
  def second_fib(1), do: 1
  def second_fib(n), do: second_fib(n-1)+ second_fib(n-2)
end
