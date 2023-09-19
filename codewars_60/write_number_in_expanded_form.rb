=begin
17. Write Number in Expanded Form
(https://www.codewars.com/kata/5842df8ccbd22792a4000245)
6 kyu

Write Number in Expanded Form

You will be given a number and you will need to return it as a string in Expanded Form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.
=begin pedac

*************Problem********************
Overall goal: write a method that takes an integer and returns a string of that integer in expanded form
initial input: integer
overall output: string/integer in expanded form

explicit requirements:
write a method, 1 arg/integer
All numbers will be whole numbers greater than 0.
return value : integer in expanded form
10s place, mult by 10 + ones place



implicit requirements:
if integer contains a 0 you do not return that value in the string
questions:

**********Examples/Test cases************
expanded_form(12); # Should return '10 + 2'
=> 1* 10 = 10, 10 + ones(2) . '10 + 2'
expanded_form(42); # Should return '40 + 2'
=> 4 * 10 =  40, 40 + ones(2). '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
=> 7 * 10,000 = 70,000 + 0 * 1000 + 3 * 100 + 0 * 10 + ones

*************Data Structure**************
integer > string

***************Algorithm*****************
Overall approach: converted integer to array [1, 2]> iterate over array,
mult each element by -1 would be returned (int * 1), -2 would be mult by 10 (int * 10),
-3 mult by 100 (int * 100). *= 10.
return result into return array, join together with a +. delete the 0 values

*/ convert integer to array # [2, 1]
details: digits

*/ initialize result_array to empty
details:

*/ iterate over the array, transform values to expanded form
details: map, initialize value = 1, increment value *= 10 each iteration
# [2, 10]
*/ reverse array # [10, 2]
details:

*/ delete 0s from array
details: delete(0)

*/ join with a +
details: join
=end

def expanded_form(integer)
  array = integer.digits
  p "Array after calling digits is #{array}"
  return_array = []
  value = 1

  array.map do |int|
    return_array << int * value # here we are creating ones
    value *= 10 # to get tens, hundreds, etc.
  end
  return_array.reverse.delete_if { |num| num == 0 }.join(' + ')
end
# return array before calling #reverse and #delete
# [2, 10]
# [2, 40]
# [4, 0, 300, 0, 70000]

p expanded_form(12)  == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304)  == '70000 + 300 + 4'

# solved myself again
=begin

17. Write Number in Expanded Form
(https://www.codewars.com/kata/5842df8ccbd22792a4000245)

⋄≂≂▫≂≂▫≂≂▫≂▫≂▫≂≂▫≂≂▫≂⋄—◟ 𝓟roblem ◞—⋄≂▫≂≂▫≂≂▫≂≂▫≂▫≂≂▫≂≂▫≂≂≂⋄

Write Number in Expanded Form

You will be given a number and you will need to return it as a string in Expanded Form. For example:

NOTE: All numbers will be whole numbers greater than 0.

⋄≂≂▫≂≂▫≂≂▫≂▫≂▫≂≂▫≂≂▫≂⋄—◟ Examples ◞—⋄≂▫≂≂▫≂≂▫≂≂▫≂▫≂≂▫≂≂▫≂≂≂⋄

12 => '10 + 2'
42 => '40 + 2'
70304 => '70000 + 300 + 4'

⋄≂≂▫≂≂▫≂≂▫≂▫≂▫≂≂▫≂≂▫≂⋄—◟ Algorithm ◞—⋄≂▫≂≂▫≂≂▫≂≂▫≂▫≂≂▫≂≂▫≂≂≂⋄
- initialize an empty res array

- extract each digit from the number

- iterate over each digit
- as you go iterate, transform it to its component value

- go over each digit and multiply it by a value
- the starting value will be 1
- as you go through each digit, increase the value you multiply by
- do it by multiplying current value by 10 (because the nubmers increase by 10 fold)

  - add the result at the beginning of the res array

- join the array on a + separator with 1 space on each side
=end
def expand(number)
  res = []
  numbers = number.digits
  value = 1

  numbers.each do |number|
    temp = number * value
    res = res.unshift(temp)
    value = value * 10
  end

  res.delete_if { |e| e == 0 }.join(' + ')
end
p expand(12) == '10 + 2'
p expand(42) == '40 + 2'
p expand(70304) == '70000 + 300 + 4'

