IO.puts "\tExercise 4.1
=======================
1.Find a two-digit natural number xy given the sum of the digits 'x+y'
 and the difference between the digits 'yx - xy'. To compile an Elixir program
 that outputs the digits of the number based on the sum and difference entered..
-------------------------------------------------------------------"
defmodule NaturalNumber do

def sum_number(x,y) do
  IO.puts("Sum of #{x} + #{y} = #{x+y}")
  diff_number(x,y,x+y)
end

def diff_number(x,y,sum) do
  str_x = Integer.to_string(x)
  str_digit_x =
    str_x
    |> Stream.unfold(&String.split_at(&1, 1))
    |> Enum.take_while(&(&1 != ""))
  str_y = Integer.to_string(y)
    str_digit_y =
      str_y
      |> Stream.unfold(&String.split_at(&1, 1))
      |> Enum.take_while(&(&1 != ""))
  yx = String.to_integer(Enum.at(str_digit_x,0) <> Enum.at(str_digit_y,0))
  xy = String.to_integer(Enum.at(str_digit_y,0) <> Enum.at(str_digit_x,0))
  substract_yx_xy = yx-xy
  IO.puts("Difference of #{yx} - #{xy} = #{substract_yx_xy}\n
           Searched number: #{sum + substract_yx_xy}")
end
end

str_newline_x = IO.gets("Please input one digit x value: ")
str_newline_y = IO.gets("Please input one digit y number: ")
str_x= String.slice(str_newline_x,0..String.length(str_newline_x)-2)
str_y= String.slice(str_newline_y,0..String.length(str_newline_y)-2)

if(Regex.match?(~r/^\d+$/,str_x) && Regex.match?(~r/^\d+$/,str_y) )
do
  x = String.to_integer(str_x)
  y = String.to_integer(str_y)
  if x < 0 || y < 0 do
    IO.puts("Error , x/y has to be a positive
             1 digit number!")
  else
    IO.puts "\nDouble digit natural number: "
    NaturalNumber.sum_number(x,y)
  end
else
  IO.puts "Invalid type , please type numbers!"
end
