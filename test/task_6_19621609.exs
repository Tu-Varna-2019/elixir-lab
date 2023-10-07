defmodule GenerateList do

def get_list_elements(iter,list_natural_num,list_elements_threshold) do
  if iter == list_elements_threshold do list_natural_num
else
  get_list_elements(iter+1,[0..100 |> Enum.random()]++list_natural_num,list_elements_threshold)
  end
end
end

defmodule BinarySearch do

  def search_index_of_element(list_elem,element,iter) do
    if iter == length(list_elem) do -1
  else
    if Enum.at(list_elem,iter) == element do iter+1
  else
    search_index_of_element(list_elem,element,iter+1)
    end
  end
end
end


list_elements_threshold = 20
list_generated_element=GenerateList.get_list_elements(0,[],list_elements_threshold)
list_generated_element_sorted = Enum.sort(list_generated_element)
IO.puts("Sorted list:")
IO.inspect list_generated_element_sorted

str_newline_length = IO.gets("Please input a number fo binary search : ")
str_length = String.slice(str_newline_length,0..String.length(str_newline_length)-2)
if(Regex.match?(~r/^\d+$/,str_length) )
do
  num = String.to_integer(str_length)
  #IO.inspect(Enum.with_index(list_generated_element_sorted))
  IO.write("#{num} index = ")
  IO.inspect BinarySearch.search_index_of_element(list_generated_element_sorted,num,0)

else
  IO.puts "Invalid type , please type numbers!"
end



# IO.puts("Current index: #{start_index}")
# str_newline_num = IO.gets("Please input a number: ")
# str_num = String.slice(str_newline_num,0..String.length(str_newline_num)-2)
#   if(Regex.match?(~r/^\d+$/,str_num)
#      and str_num > 0) do
#       new_list = [ String.to_integer(str_num) | list_num]
#       input_list(new_list,start_index+1,end_index)
#   else
#     IO.gets("Invalid type , please type numbers!")
#       input_list(list_num,start_index,end_index)
#   end
# end
