#defmodule CompareAscendingDigit do

  # def increasing_n(str_digit_num) do
  #   for ii <- 0..length(str_digit_num)-2 do
  #     if String.to_integer(Enum.at(str_digit_num,ii))
  #     >= String.to_integer(Enum.at(str_digit_num,ii+1)) do
  #       IO.gets("NO , they are NOT in ascending order!")
  #     end
  #   end
  #   IO.puts("YES, they ARE in ascending order!")
  # end

  # end
  defmodule PerfectNumber do
    def check(n) do
      sum = aliquot_sum(n)

      cond do
        sum == n -> :perfect
        sum <  n -> :deficient
        sum >  n -> :abundant
      end
    end

    def aliquot_sum(n) do
      Enum.sum(factors(n))
    end

    def factors(1), do: [1]
    def factors(n) do
      for i <- 1..div(n,2), rem(n,i) == 0 do
        IO.inspect(i)  end
    end
  end


  str_newline_num_1 = IO.gets("Please input number to calculate perfect: ")
  str_num_1= String.slice(str_newline_num_1,0..String.length(str_newline_num_1)-2)

  if(Regex.match?(~r/^\d+$/,str_num_1) )
  do
    num = String.to_integer(str_num_1)
    PerfectNumber.check(num)
    IO.write "= #{num}"
  else
    IO.puts "Invalid type , please type numbers!"
  end
