IO.puts "\tExercise 1.4
=======================
  4. To solve a problem with Fibonacci.
-------------------------------------------------------------------"

defmodule Fibonacci do

 def fib(num) do
    cond do
      num==0->  0
      num==1 || num==2 -> 1
    true ->
      fib(num-2)+fib(num-1)
    end
  end
end

num = 9
IO.puts(Fibonacci.fib(num))
