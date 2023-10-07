IO.puts "\tExercise 3.2
=======================
  2. To create an application for finding the sum of the digits of an input number.
-------------------------------------------------------------------"
defmodule SumOfDigits do
  def check_index(list_digit,index,sum) do
    if index != length(list_digit)-1 do
      calculate_sum(list_digit,index+1,sum)
    else sum
    end
  end

  def calculate_sum(list_digit,index,sum) do
      result = sum + String.to_integer(Enum.at(list_digit,index))
      check_index(list_digit,index,result)
  end
end


str_newline_num_1 = IO.gets("Please input first number: ")
str_num_1= String.slice(str_newline_num_1,0..String.length(str_newline_num_1)-2)

if(Regex.match?(~r/^\d+$/,str_num_1) )
do
  num = String.to_integer(str_num_1)
  str_num = Integer.to_string(num)
  str_digit_num =
    str_num
    |> Stream.unfold(&String.split_at(&1, 1))
    |> Enum.take_while(&(&1 != ""))
  IO.inspect(str_digit_num)
  IO.puts "\nInput: #{num}\nOutput: #{SumOfDigits.calculate_sum(str_digit_num,0,0)} "
else
  IO.puts "Invalid type , please type numbers!"
end
