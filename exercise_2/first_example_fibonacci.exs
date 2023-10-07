

defmodule First_example_fibonacci do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
  def count_timer() do
    timed( fn -> first_fib(10) end,[100])
  end
  def timed(fun, args) do
    {time, result} = :timer.tc(fun, args)
    IO.puts("Time: #{time} μs")
    IO.puts("Result: #{result}")
  end
  def first_fib(0), do: 0
  def first_fib(1), do: 1
  def first_fib(n), do: first_fib(0, 1, n-2)
  def first_fib(_, prv, -1), do: prv
  def first_fib(prvprv, prv, n) do

      next = prv + prvprv

      #measure(fn->first_fib(prv, next, n-1)end)
      first_fib(prv, next, n-1)
  end
end

defmodule Iterate_fibonacci  do
  Enum.map(0..10, fn i-> First_example_fibonacci.first_fib(i)end)
end
