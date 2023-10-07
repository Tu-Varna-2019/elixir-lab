defmodule second_example_fibonacci do
  def second_fib(0), do: 0
  def second_fib(1), do: 1
  def second_fib(n), do: fib(n-1)+ fib(n-2)
end
