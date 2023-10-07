defmodule UserInput do
  def get_input() do
  str_newline_x = IO.gets("Please input date 1 in format: 2020-01-01 : ")
  str_newline_y = IO.gets("Please input date 2 in format: 2020-01-01: ")
  str_date_1= String.slice(str_newline_x,0..String.length(str_newline_x)-2)
  str_date_2 = String.slice(str_newline_y,0..String.length(str_newline_y)-2)

  try do
    iso_date_1 = Date.from_iso8601!(str_date_1)
    iso_date_2 = Date.from_iso8601!(str_date_2)
    compare_date(iso_date_1,iso_date_2)
  rescue
    ArgumentError ->
      IO.gets("Wrong input! Please type valid dates !")
      get_input()
    end

  end

  def compare_date(iso_date_1,iso_date_2) do
    IO.puts("Difference of years: #{iso_date_1.year-iso_date_2.year}
    Difference of months: #{iso_date_1.month-iso_date_2.month}
    Difference of days: #{iso_date_1.day-iso_date_2.day}")
  end
end


UserInput.get_input()
