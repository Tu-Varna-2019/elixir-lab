defmodule SumOfThirdNumer do

def get_sum(x) do
  if x+3 < 101 do
    get_sum(x+3)
  else
      IO.puts(x)
  end
end

end


str_newline_x = IO.gets("Please input one numberh: ")
str_x= String.slice(str_newline_x,0..String.length(str_newline_x)-2)

if(Regex.match?(~r/^\d+$/,str_x) )
do
  x = String.to_integer(str_x)
  if x < 2 || x > 100 do
    IO.puts("Error interval should be from 2-100!")
  else
    IO.puts "\nDouble digit natural number: "
    SumOfThirdNumer.get_sum(x)
  end
else
  IO.puts "Invalid type , please type numbers!"
end
