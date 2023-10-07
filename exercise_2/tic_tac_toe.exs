IO.puts "\tExercise 2.1
=======================
  2. Tic Tac Toe game.
-------------------------------------------------------------------\n"

defmodule CheckGame do
  # checks the table for  :
  #      1:    2:    3:
  #      |--------------|
  #    1:|    | X |     |
  #      |--------------|
  #    2:| X  |   |  X  |
  #      |--------------|
  #    3:|    | X |     |
  #      |--------------|
  def check_filled_table(table,player,direction,winner_player) do
    # Maps the positions to the table
    check_star = [Enum.at(table,1),Enum.at(table,3),Enum.at(table,5),
                  Enum.at(table,7)]
    # checks if positions are already taken by player 1 or 0
    if  check_star --[1,1,1,1] === [] ||
        check_star --[0,0,0,0] === [] do
      IO.puts("\n\nNo avalible moves ! \n Draw ")
      :c.q() # needs improvement: doesn't stop the program immediately
    else
      # if it doesn't switch player
      game_over(table,player,'',-1)
  end
end
  # checks the table for  :
  #      1:    2:    3:         1:    2:   3:
  #      |--------------| 		|--------------|
  #    1:|    |   |  X  | 	1:|  X |   |     |
  #      |--------------|     |--------------|
  #    2:|    | X  |    | 	2:|    | X |     |
  #      |--------------|  		|--------------|
  #    3:| X  |    |    |  	3:|    |   | X   |
  #      |--------------|  		|--------------|
  def check_cross(table,player,direction,winner_player) do
    for i <- [0,2] do
      # Maps the positions to the table
      cross_direction = [Enum.at(table,0+i),
                         Enum.at(table,4),
                         Enum.at(table,8-i)]
      # checks if positions are already taken by player 1 or 0
      if cross_direction --[0,0,0] === [] ||
         cross_direction --[1,1,1] === [] do
          # conveys the winning player and the manner of victory
          game_over(table,player,'crossed',cross_direction)
         end
    end
    # if it doesn't check for check_filled_table
    game_over(table,player,'n',-1)
  end
  # checks the table for  :
  #      1:    2:    3:         1:    2:   3:      1:   2:   3:
  #      |--------------| 		|--------------|    |--------------|
  #    1:|  X  |   |    | 	1:|   | X  |     |  1:|   |   |  X   |
  #      |--------------|     |--------------|    |--------------|
  #    2:|  X  |   |    | 	2:|    | X |     |  2:|    |  |  X   |
  #      |--------------|  		|--------------|    |--------------|
  #    3:| X  |    |    |  	3:|    | X  |    |  3:|    |  |  X   |
  #      |--------------|  		|--------------|    |--------------|
  def check_vertical(table,player,direction,winner_player) do
    for i <- 0..2 do
      # Maps the positions to the table
      vertical_direction = [Enum.at(table,0+i),
                           Enum.at(table,3+i) ,
                           Enum.at(table,6+i)]
      # checks if positions are already taken by player 1 or 0
      if vertical_direction --[0,0,0] === [] ||
         vertical_direction --[1,1,1] === [] do
           # conveys the winning player and the manner of victory
          game_over(table,player,'vertically',vertical_direction)
         end
    end
    # if it doesn't check for check_cross
    game_over(table,player,'c',-1)
  end
  # checks the table for  :
  #      1:    2:    3:         1:    2:   3:      1:   2:   3:
  #      |--------------| 		|--------------|    |--------------|
  #    1:| X  | X  | X  | 	1:|    |   |     |  1:|   |   |      |
  #      |--------------|     |--------------|    |--------------|
  #    2:|     |   |    | 	2:|  X | X |  X  |  2:|    |  |      |
  #      |--------------|  		|--------------|    |--------------|
  #    3:|    |    |    |  	3:|    |   |    |   3:|  X  | X |  X |
  #      |--------------|  		|--------------|    |--------------|
  def check_horizontal(table,player,direction,winner_player) do
    for i <- 0..2 do
      # additional value in order to correctly
      # iterate through the desired positions
      lane = i+i
      # Maps the positions to the table
      horizontal_direction = [Enum.at(table,0+i+lane),
                       Enum.at(table,1+i+lane),
                       Enum.at(table,2+i+lane)]
      # checks if positions are already taken by player 1 or 0
      if horizontal_direction --[0,0,0] === [] ||
         horizontal_direction --[1,1,1] === [] do
          # conveys the winning player and the manner of victory
          game_over(table,player,'horizontally',horizontal_direction)
         end
    end
    # if it doesn't check for check_vertical
    game_over(table,player,'v',-1)
  end

  # main method to handle the current state of the table
  def game_over(table,player,direction,winner_player) do
    # checks if there is a set winner
    if winner_player != -1 do
      # this statement is needed due to a
      # known race condition from :c.q() !
      player = if player === 1 do player = 0
               else player = 1 end
      IO.puts("\n\nPlayer: #{player} wins #{direction}!")
      :c.q()
    # checks for victory horizontally
    else if direction === 'h' do
        check_horizontal(table,player,direction,-1)
       # checks for victory vertically
      else if direction === 'v' do
          check_vertical(table,player,direction,-1)
         # checks for victory by a cross
        else if direction === 'c' do
          check_cross(table,player,direction,-1)
        else if direction === 'n' do
            #  # checks if there are no available moves
            check_filled_table(table,player,direction,-1)
          # if not , continue
          else Table.table_output(table,player)
          end end end
          end end end
        end

defmodule MovePosition do
  # replaces position in the table by
  # the index of the table/list
  def replace_pos(table,pos,player) do
    # create new table from the initial one with the
    # new position , given by the player
    updated_table = List.update_at(table,pos, &(&1 + (player+1)))
    # switch player
    switch_player = if player === 1 do
      switch_player = 0
    else
      switch_player = 1
    end
    # checks for game state , beginning
    # with horizontal check
    CheckGame.game_over(updated_table,switch_player,'h',-1)
  end
  # check if position is already taken
  def check_position(table,pos,player) do
    # get index from table/list
    player_pos =Enum.at(table, pos)
    # if it's taken inform the player
    if player_pos != -1 do
      IO.gets("\nPosition is already taken! Please choose another one! \n
              Press ANY KEY to continue ...")
      # Make the player to try again
      Input.user_input(table,player)
    else
      # If position is free , fill it with the player number
      MovePosition.replace_pos(table,pos,player)
    end
  end

  # Get the index of the provided position
  # from the table/list by x,y
  def get_position(table,x,y,player) do
    pos =
      if x==1 do pos=y-1
    else
      if x==2 do pos=y+2
      else pos=y+5
      end end
    # checks if position is already taken
    check_position(table,pos,player)
  end
end

# Display table on the terminal
defmodule Table do
def table_output(table,player) do
    IO.puts("\n\n\t    1:    2:    3:")
    IO.puts("\t   |--------------|")
    IO.puts(
   "\t#{1}: | #{Enum.at(table,0)} | #{Enum.at(table,1)} | #{Enum.at(table,2)} |\n \t   |--------------|
    \t#{2}: | #{Enum.at(table,3)} | #{Enum.at(table,4)} | #{Enum.at(table,5)} |\n \t   |--------------|
    \t#{3}: | #{Enum.at(table,6)} | #{Enum.at(table,7)} | #{Enum.at(table,8)} |")
  IO.puts("\t   |--------------|")
  # require the user to enter a position
  Input.user_input(table,player)
end
end
# Functionality for the user to enter a position
defmodule Input do
  def user_input(table,player) do
    IO.puts("\nPlayer: #{player}\n----------------")
    # Uncomment this if you want to play with pc!
    # known bugs:
    # 1. Enum.random() doesn't additionally check if the selected
    # position is already taken and therefore you (the player)
    # has to manually enter ANY KEY to progress and let PC
    # choose position again
    """
    str_x =
        if player==1
        do str_x=IO.gets("Enter position for x: ") |> String.trim()
      else str_x=Integer.to_string(1..3 |> Enum.random())
    end
    str_y =
      if player==1
      do str_y=IO.gets("Enter position for y: ") |> String.trim()
    else str_y=Integer.to_string(1..3 |> Enum.random())
  end
    try do
      x = String.to_integer(str_x)
      y = String.to_integer(str_y)
    if x<1 || x>3 ||
       y<1 || y>3  do
        IO.gets("Invalid position! Please choose another one! \n
        Press ANY KEY to continue ...")
        Input.user_input(table,player)
      """
      # get value without \n
      str_x = IO.gets("Enter position for x: ") |> String.trim()
      str_y = IO.gets("Enter position for y: ") |> String.trim()

      try do
        # convert to int
        x = String.to_integer(str_x)
        y = String.to_integer(str_y)
      # check if position is out of scope !
      if x<1 || x>3 ||
         y<1 || y>3  do
          IO.gets("Invalid position! Please choose another one! \n
          Press ANY KEY to continue ...")
          # Retry
          Input.user_input(table,player)
  end
    # if provided positions are valid ,
    # get position from the selected one by the user
    MovePosition.get_position(table,x,y,player)
  rescue
    # Inform the player if he entered non numerical positions!
    ArgumentError ->
      IO.gets("Wrong input! Please type numbers from 1 to 3 ! \n
      Press ANY KEY to continue ...")
      Input.user_input(table,player)
    end
  end
end


table = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
first_player = 1
Table.table_output(table,first_player)
