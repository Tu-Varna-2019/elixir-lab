IO.puts "\tExercise 5.1
=======================
  1. Game of life game.
-------------------------------------------------------------------\n"

defmodule CheckGameState do

  def check_neighbor(table,index,cell_value) do
    list_neighbor_nil = [Enum.at(table,index-6),Enum.at(table,index-5  ),
                        Enum.at(table,index-4 ), Enum.at(table,index-1 ),
                        Enum.at(table,index+1 ), Enum.at(table,index+4 ),
                        Enum.at(table,index+5 ), Enum.at(table,index+6 )]
    list_neighbor = Enum.filter(list_neighbor_nil, & !is_nil(&1))
    neighbor_sum =  Enum.sum(list_neighbor)

    if cell_value == 0 &&
       neighbor_sum == 3 do
        IO.inspect("Cell populated #{cell_value} at index #{index}")
        Position.replace_position(table,index,1)
       end
      if cell_value == 1 do
        if (neighbor_sum > -1 && neighbor_sum < 2) ||
            (neighbor_sum > 3) do
              IO.inspect("Cell died #{cell_value} at index #{index}")
              Position.replace_position(table,index,-1)
            end
        end
    Table.table_output(table,index+1)
  end
  end


defmodule Position do

  def replace_position(table,index,cell) do
    #new_cell = if cell==1 do new_cell=-3 else new_cell=1 end
    #updated_table = List.update_at(table,index,&(&1+(cell+1)))
    updated_table = List.update_at(table,index,&(&1+cell))
    #IO.inspect("Cell needed to be replaced: #{1+cell}")
    #IO.inspect("Given cell for replacement: #{Enum.at(updated_table,index)}")
    Table.table_output(updated_table,index+1)
  end

  def get_cell_value(table,index) do
      cell_value = Enum.at(table,index)
      #if cell_value == length(table) do
      #  Table.table_output(table)
      #else
        #if cell_value == 0 do
        #  CheckGameState.check_empty_cell_to_populate(table,index,cell_value,0)
        #else
        #  CheckGameState.check_cell_dies(table,index,cell_value,1)
        #end
      CheckGameState.check_neighbor(table,index,cell_value)
      #end
  end

end
# Display table on terminal
defmodule Table do

  def table_output(table,index) do
      reset_index = if index === length(table) do
          reset_index = 0 else
          reset_index = index end
      if index == length(table) do
        IO.puts("\t |--------------------|")
        for ii <- [0,5,10,15,20] do
          IO.puts(
        "\t | #{Enum.at(table,ii)} | #{Enum.at(table,ii+1)} | #{Enum.at(table,ii+2)} | #{Enum.at(table,ii+3)} | #{Enum.at(table,ii+4)} | #{ii+4}"
          ) end
        IO.puts("\t |--------------------|")
        IO.gets("\nPress ANY KEY to continue ...")
      end
      Position.get_cell_value(table,reset_index)
  end

end

#list_test = [nil,1,0,0,nil,0,0,nil,3,0,nil,1,1]
#list_test_new = Enum.filter(list_test, & !is_nil(&1))
#IO.inspect Enum.sum(list_test_new)

table = [
  0,0,1,0,0, #4
  0,1,0,1,0, #9
  0,0,1,0,0, #14
  0,0,0,1,0, #19
  0,0,1,0,0  #24
]
#IO.inspect(List.update_at(table,1, &(&1 + (-2+1))))
Table.table_output(table,25)
