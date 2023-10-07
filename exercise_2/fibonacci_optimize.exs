IO.puts "\tExercise 2.0
=======================
  1. Find and output the most optimized Fibboanchi algorithm.
-------------------------------------------------------------------"

Code.require_file("first_example_fibonacci.exs", "./exercise_2")
Code.require_file("second_example_fibonacci.exs", "./exercise_2")
Code.require_file("third_example_fibonacci.exs", "./exercise_2")

IO.puts "First solution example of Fibonacci"
#for i <- 0..10 do
task = Task.async(fn ->
  :timer
  |> :timer.tc(:sleep, [First_example_fibonacci.first_fib(10)])
  |> elem(0)
  |> IO.puts()
end)
Task.await(task)
#end

IO.puts "Second solution example of Fibonacci"
#for i <- 0..10 do
  task = Task.async(fn ->
    :timer
    |> :timer.tc(:sleep, [Second_example_fibonacci.second_fib(10)])
    |> elem(0)
    |> IO.puts()
  end)
  Task.await(task)
 # end

IO.puts "Third solution example of Fibonacci"
#for i <- 0..10 do
  task = Task.async(fn ->
    :timer
    |> :timer.tc(:sleep, [Third_example_fibonacci.third_fib(10)])
    |> elem(0)
    |> IO.puts()
  end)
  Task.await(task)
 # end
