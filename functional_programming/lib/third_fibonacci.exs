defmodule third_example_fibonacci do
  def third_fib(n) do
    case n do
0 ->0
1 ->1
n ->  third_fib(n-1)+ third_fib(n-2)
    end
 end
end
