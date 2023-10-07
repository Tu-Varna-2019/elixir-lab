IO.puts "\tExercise 1.2
=======================
  2. To find the minimum and maximum number between three numbers..
-------------------------------------------------------------------"

str_newline_num_1 = IO.gets("Please input first number: ")
str_newline_num_2 = IO.gets("Please input second number: ")
str_newline_num_3 = IO.gets("Please input third number: ")

str_num_1= String.slice(str_newline_num_1,0..String.length(str_newline_num_1)-2)
str_num_2= String.slice(str_newline_num_2,0..String.length(str_newline_num_2)-2)
str_num_3= String.slice(str_newline_num_3,0..String.length(str_newline_num_3)-2)

num_1 = String.to_integer(str_num_1)
num_2 = String.to_integer(str_num_2)
num_3 = String.to_integer(str_num_3)

list=[num_1,num_2,num_3]
sorted_list=Enum.sort(list)

IO.puts "\n
Maximum number: #{List.last(sorted_list)}
Minimum number: #{List.first(sorted_list)}"
