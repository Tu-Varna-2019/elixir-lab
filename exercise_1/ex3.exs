IO.puts "\tExercise 1.3
=======================
  3. To create a factorial problem..
-------------------------------------------------------------------"

defmodule Factorial do

 def factorial(num) do

    if (num < 2) do 1
    else
      num*factorial(num-1)
    end
  end
end

num = 5
IO.puts(Factorial.factorial(num))
