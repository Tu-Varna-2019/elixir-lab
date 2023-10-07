IO.puts "\tExercise 1.1
=======================
1. To determine the maximum and minimum number between two numbers.
-------------------------------------------------------------------"

str_newline_num_1 = IO.gets("Please input first number: ")
str_newline_num_2 = IO.gets("Please input second number: ")

str_num_1= String.slice(str_newline_num_1,0..String.length(str_newline_num_1)-2)
str_num_2= String.slice(str_newline_num_2,0..String.length(str_newline_num_2)-2)



if(Regex.match?(~r/^\d+$/,str_num_1) && Regex.match?(~r/^\d+$/,str_num_2) )
do
  num_1 = String.to_integer(str_num_1)
  num_2 = String.to_integer(str_num_2)
  max_num = max(num_1,num_2)
  min_num = min(num_1,num_2)

  IO.puts "\nMaximum number: #{max_num}
  Minimum number: #{min_num}"
else
  IO.puts "Invalid type , please type numbers!"
end
