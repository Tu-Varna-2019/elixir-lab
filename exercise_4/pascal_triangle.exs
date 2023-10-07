IO.puts "\tExercise 4.1
=======================
  6. Write a program that inputs a natural number N from the interval [2..30] and
  outputs the corresponding row of Pascal's triangle.
  Output: 1, 7, 21, 35, 35, 21, 7,
-------------------------------------------------------------------\n\n"

defmodule Pascal do
  def rows(num), do: Enum.map(0..(num - 1), &generate_row/1)
  defp generate_row(row_num), do: Enum.map(0..row_num, &binomial(&1, row_num))
  defp binomial(exponent, row_num) do
    factorial(row_num) / (factorial(row_num - exponent) * factorial(exponent))
  end
  defp factorial(0), do: 1
  defp factorial(num), do: Enum.reduce(1..num, 1, &*/2)
end


str_newline_num = IO.gets("Please natural number N from [2-30]: ")
str_num= String.slice(str_newline_num,0..String.length(str_newline_num)-2)

if(Regex.match?(~r/^\d+$/,str_num) )
do
  num = String.to_integer(str_num)
  if num < 2 || num > 30  do
    IO.puts("Error , allowed input is between 2 and 30!")
  else
    list_pascal = Pascal.rows(num)
    list_pascal_last_row = Enum.at(list_pascal,length(list_pascal)-1)

    IO.write("Output: ")
    for x <- 0..length(list_pascal_last_row)-1 do
      IO.write("#{Kernel.trunc(Enum.at(list_pascal_last_row,x))}, ")
    end
  end
else
  IO.puts "Invalid type , please type numbers!"
end
