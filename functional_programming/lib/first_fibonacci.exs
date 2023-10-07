defmodule first_example_fibonacci do
  def first_fib(0), do: 0
  def first_fib(1), do: 1
  def first_fib(n), do: fib(0, 1, n-2)

  def first_fib(_, prv, -1), do: prv
  def first_fib(prvprv, prv, n) do
      next = prv + prvprv
      first_fib(prv, next, n-1)
  end
end
