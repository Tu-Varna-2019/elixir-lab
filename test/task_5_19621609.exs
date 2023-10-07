defmodule RecursionReverse do

  def input_list(list_num,start_index,end_index) do
    if start_index == end_index do list_num
  else
    IO.puts("Current index: #{start_index}")
    str_newline_num = IO.gets("Please input a number: ")
    str_num = String.slice(str_newline_num,0..String.length(str_newline_num)-2)
      if(Regex.match?(~r/^\d+$/,str_num)
         and str_num > 0) do
          new_list = [ String.to_integer(str_num) | list_num]
          input_list(new_list,start_index+1,end_index)
      else
        IO.gets("Invalid type , please type numbers!")
          input_list(list_num,start_index,end_index)
      end
    end
  end
end


list_number = [1,2,3,4,5,6,7,8,9,10]

str_newline_length = IO.gets("Please input the count of numbers: ")
str_length = String.slice(str_newline_length,0..String.length(str_newline_length)-2)
if(Regex.match?(~r/^\d+$/,str_length)
   and str_length > 0 )
do
  list_num = RecursionReverse.input_list([],0,String.to_integer(str_length))
  IO.write("User list in reverse order: ")
  IO.inspect(list_num)

else
  IO.puts "Invalid type , please type numbers!"
end
