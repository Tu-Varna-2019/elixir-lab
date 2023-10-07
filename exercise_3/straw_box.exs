IO.puts "\tExercise 1.3
=======================
  3. Straws should be distributed in boxes -
   large 50 pieces, medium 20 pieces. and small 5 pcs.
   To create a function that returns the number of boxes.
-------------------------------------------------------------------"

defmodule Box do
  def calculate_box(num,type_of_box,result) do
    if type_of_box === '' do result
    else
      if type_of_box === 'l' do
        divided_num = div(num,50)
        new_result ="#{result}\nLarge box: #{divided_num}"
        calculate_box(divided_num,'m',new_result)
      else
        if type_of_box === 'm' do
          divided_num = div(num,20)
          new_result ="#{result}\nMedium box: #{divided_num}"
          calculate_box(divided_num,'s',new_result)
        else
          if type_of_box === 's' do
            divided_num = div(num,5)
            new_result ="#{result}\nSmall box: #{divided_num}"
            calculate_box(divided_num,'',new_result)
      end
    end
  end
end
  end

end


str_newline_num_1 = IO.gets("Please input number of straws: ")
str_num_1= String.slice(str_newline_num_1,0..String.length(str_newline_num_1)-2)

if(Regex.match?(~r/^\d+$/,str_num_1) )
do
  num = String.to_integer(str_num_1)
  IO.puts("Number of boxes for #{num} of straws:
          \n#{Box.calculate_box(num,'l','')}")
else
  IO.puts "Invalid type , please type numbers!"
end
