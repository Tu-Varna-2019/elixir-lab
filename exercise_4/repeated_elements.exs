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
    list_natural_num_without_current_elem = List.delete(list_natural_num,iter)
    new_repeated_elem =
      if Enum.member?(list_natural_num_without_current_elem,iter)
       do
        new_repeated_elem = "#{repeated_elem} , #{Integer.to_string(Enum.at(list_natural_num,iter))} "
        else
          new_repeated_elem = repeated_elem
          end
    get_repeated_element(iter+1,list_natural_num,new_repeated_elem)
    end
  end

  def get_list_natural_num(iter,list_natural_num) do
     if iter == 500 do list_natural_num
  else
    get_list_natural_num(iter+1,[0..1010 |> Enum.random()]++list_natural_num)
     end
end
end


list_natural_num=RepeatElement.get_list_natural_num(0,[])
IO.inspect("All elements from list:")
IO.inspect(list_natural_num)
repeated_elem = RepeatElement.get_repeated_element(0,list_natural_num,"")
IO.inspect("Repeated elements: #{repeated_elem}")
