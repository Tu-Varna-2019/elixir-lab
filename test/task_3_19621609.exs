IO.puts "\tExercise 4.1
=======================
  5. You have pre-entered a range of natural numbers belonging to the interval
   [0..1010].
  Write a program using recursive functions to determine whether there are
   repeated elements in the array.
-------------------------------------------------------------------"
defmodule RepeatElement do
  def get_repeated_element(iter,list_natural_num,repeated_elem) do
    if iter == length(list_natural_num) do repeated_elem
    else
    list_natural_num_without_current_elem = List.delete(list_natural_num,Enum.at(list_natural_num,iter))
    new_repeated_elem =
      if Enum.member?(list_natural_num_without_current_elem,Enum.at(list_natural_num,iter))
       do
        new_repeated_elem = "#{repeated_elem} , #{Enum.at(list_natural_num,iter)} "
        else
          new_repeated_elem = repeated_elem
          end
    get_repeated_element(iter+1,list_natural_num,new_repeated_elem)
    end
  end
end


str_newline_x = IO.gets("Please input text: ")
str_x_normalcase= String.slice(str_newline_x,0..String.length(str_newline_x)-2)
str_x = String.downcase(str_x_normalcase)
IO.inspect("All elements from list:")
IO.inspect(str_x)


str_digit_num =
  str_x
  |> Stream.unfold(&String.split_at(&1, 1))
  |> Enum.take_while(&(&1 != ""))


IO.inspect(str_digit_num)
repeated_elem = RepeatElement.get_repeated_element(0,str_digit_num,"")
IO.inspect("Repeated elements: #{repeated_elem}")
