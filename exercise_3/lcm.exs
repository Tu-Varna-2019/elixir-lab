IO.puts "\tExercise 1.1
=======================
1. To create an application LCN on two numbers..
-------------------------------------------------------------------"
defmodule LeastCommonMultiple do

def get_greater(num_1,num_2,greater) do
  if num_1 > num_2 do
    greater = num_1
  else greater = num_2
  end
  lcm(num_1,num_2,greater)
end

def lcm(num_1,num_2,greater) do
  if rem(greater,num_1) == 0 &&
     rem(greater,num_2) == 0 do
      IO.puts(greater)
  else
    lcm(num_1,num_2,greater+1)
  end
end
end

str_newline_num_1 = IO.gets("Please input first number: ")
str_newline_num_2 = IO.gets("Please input second number: ")
str_num_1= String.slice(str_newline_num_1,0..String.length(str_newline_num_1)-2)
str_num_2= String.slice(str_newline_num_2,0..String.length(str_newline_num_2)-2)

if(Regex.match?(~r/^\d+$/,str_num_1) && Regex.match?(~r/^\d+$/,str_num_2) )
do
  num_1 = String.to_integer(str_num_1)
  num_2 = String.to_integer(str_num_2)
  IO.puts "\nLeast Common Multiple: "
  LeastCommonMultiple.get_greater(num_1,num_2,1)
else
  IO.puts "Invalid type , please type numbers!"
end
