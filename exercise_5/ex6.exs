defmodule CompareAscendingDigit do

def increasing_n(str_digit_num) do
  for ii <- 0..length(str_digit_num)-2 do
    if String.to_integer(Enum.at(str_digit_num,ii))
    >= String.to_integer(Enum.at(str_digit_num,ii+1)) do
      IO.gets("NO , they are NOT in ascending order!")
    end
  end
  IO.puts("YES, they ARE in ascending order!")
end

end


str_newline_num_1 = IO.gets("Please input number to calculate perfect: ")
str_num_1= String.slice(str_newline_num_1,0..String.length(str_newline_num_1)-2)

if(Regex.match?(~r/^\d+$/,str_num_1) )
do
  num = String.to_integer(str_num_1)
  str_num = Integer.to_string(num)
  str_digit_num =
    str_num
    |> Stream.unfold(&String.split_at(&1, 1))
    |> Enum.take_while(&(&1 != ""))
  IO.inspect(str_digit_num)
  #IO.inspect(String.to_integer(Enum.at(str_digit_num,0))+String.to_integer(Enum.at(str_digit_num,1)))
  CompareAscendingDigit.increasing_n(str_digit_num)
else
  IO.puts "Invalid type , please type numbers!"
end
