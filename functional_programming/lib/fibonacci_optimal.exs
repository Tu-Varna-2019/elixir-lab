IO.puts "\tExercise 2.0
=======================
  1. Find and output the most optimized Fibboanchi algorithm.
-------------------------------------------------------------------"

Code.require_file("first_fibonacci.exs","./first_fibonacci.exs")


IO.puts "First solution example of Fibonacci"
IO.inspect Enum.map(0..10, fn i-> first_example_fibonacci.first_fib(i) end)
IO.puts "Second solution example of Fibonacci"
#IO.inspect Enum.map(0..10, fn i-> second_example_fibonacci.second_fib(i) end)
IO.puts "Third solution example of Fibonacci"
#IO.inspect Enum.map(0..10, fn i-> third_example_fibonacci.third_fib(i) end)
