IO.puts "\tExercise 4.2
=======================
1.4. Christmas is approaching and the celebration must be prepared.
The students of one class decided to play dance. To create a program
through which the number of participants is entered - a natural number
 N from the interval [2..22]. The program should calculate and display
the number of different arrangements of the participants in the choir.
The task should be supplemented with a condition for the number of men
 and women, so that when arranging in the choir, the men are equally
 distributed among the women, and each variant of the arrangement starts
 with a man and ends with a man.
-------------------------------------------------------------------"

defmodule NumOfDiffArrangement do
  def get_total_arrangement(result_men,result_women,men_num,women_num) do

   if men_num == 1 &&
      women_num == 1 do result_men*result_women #IO.puts(
    #"\nNnumber of total different arrangements: #{result}
    # \nNumber of men: #{men_num}
    # \nNumber of women: #{women_num} "
   #)
   #get_total_men(num,result,men_num,women_num)
   else
    if men_num == 1 &&
       women_num != 1 do
        get_total_arrangement(result_men,
        result_women*women_num,
        men_num,women_num-1)
       else
        if men_num != 1 &&
        women_num == 1 do
         get_total_arrangement(result_men*men_num,
         result_women,
         men_num-1,women_num)
        else
    #decrement_num = num-1
    get_total_arrangement(result_men*men_num,
                          result_women*women_num,
                          men_num-1,women_num)
    #decrement_num = num-1
    #new_result = decrement_num * result
    #new_men_num = new_result/(new_result - men_num)
    #new_women_num = new_result/(new_result - women_num)
    #get_different_arrangement(decrement_num,new_result,new_men_num,new_women_num)
   end
  end
end
end
end


str_newline_student =
  IO.gets("Please input number of students
           between 2 and 22: ")
str_newline_men =
IO.gets("Please input number of men ,
          less than the total one: ")
str_student = String.slice(str_newline_student,0..String.length(str_newline_student)-2)
str_men = String.slice(str_newline_men,0..String.length(str_newline_men)-2)

if(Regex.match?(~r/^\d+$/,str_student)&& Regex.match?(~r/^\d+$/,str_men) )
do
  student_num = String.to_integer(str_student)
  men_num = String.to_integer(str_men)
  if student_num < 2 || student_num > 22 ||
     men_num > student_num do
    IO.puts("Error , number of students has to be
             between 2 and 22 or/and number of men
              should be less than total num of students!")
  else
    #NumOfDiffArrangement.get_total_arrangement(student_num,1,men_num,student_num-men_num)
    IO.puts(
    "\nNnumber of total different arrangements:
    #{NumOfDiffArrangement.get_total_arrangement(1,1,men_num,student_num-men_num)}"
    )

  end
else
  IO.puts "Invalid type , please type numbers!"
end
