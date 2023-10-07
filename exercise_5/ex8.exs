defmodule Duplicate do
  def get_duplicates(list1,list2) do
    #for ii <- 0..length(list1)-1 do
     #new_list= List.delete(list2,1)
     #new_list_2 = List.delete(new_list,2)
     #IO.inspect Enum.to_list(new_list_2)
     IO.inspect(list2--list1)
    #end
  end
end




list1 = [1,2,3]
list2 = [1,2,1,3,2]
IO.puts("List1: ")
IO.inspect Enum.to_list(list1)
IO.puts("List2: ")
IO.inspect Enum.to_list(list2)
IO.puts("\nDuplicated values:")
Duplicate.get_duplicates(list1,list2)
#IO.inspect Enum.to_list(Enum.uniq(list1++list2))


#IO.inspect List.delete(list2,list1)
