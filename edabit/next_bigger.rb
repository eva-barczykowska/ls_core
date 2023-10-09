=begin You have to create a function that takes a positive integer and returns the next bigger number formed by the same digits:

12 ==> 21
513 ==> 531
2017 ==> 2071

If no bigger number can be composed using those digits, return -1:

9 ==> -1
111 ==> -1
531 ==> -1

Problem:
- write a method that takes an integer
- the method returns the biggest integer that can be formed out of the argument integer digts

-if no greater number can be formed, method returns -1

- in which cases no greater integer can be formed?
- if the argument is a 1 digit integer
- if I formed all possible numbers ouf of the argument integer digits and none of them is greater than the
 argument integer

Examples:
p next_bigger(12) == 21
-out of 12 can make only 21 and it is greater than 12

p next_bigger(513) == 531
-we can make 135, 153, 315, 351, 513, 531 -- and out of all these, the greatest is 531

p next_bigger(2017) == 2071
p next_bigger(414) == 441
p next_bigger(144) == 414
p next_bigger(9) == -1
-when I have only 1 number, the method returns -1

p next_bigger(111) == -1
-when all numbers are same, method returns -1

p next_bigger(531) == -1
- when out of all combinations, none is greater than the argument, the method returns -1
Notes:
- create all possible numbers
 - 111.digits.uniq.size == 1
DS:
-input: integer
- output: integer

A:
- convert int to digits
- first check if there's only 1 digit and if yes, return -1
- check if all digits are same, if yes, return -1

- create an array of call combinations, called `combinations`
- crete all possible combinations
-sort them

- in that array, if there are no elements that are greater than the argument number, return the arg number
- if there are elements that are greater, find and return the first greater element
=end
def next_bigger(int_argument)
  int = int_argument.digits

  return -1 if int.size == 1 || int.uniq.size == 1

  permutations = int.permutation.to_a.map { |s| s.join.to_i }.sort

  if permutations.any? { |e| e > int_argument }
    return permutations.find { |e| e > int_argument }
  else
    return -1
  end

end
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(414) == 441
p next_bigger(144) == 414
p next_bigger(9) == -1
p next_bigger(111) == -1
p next_bigger(531) == -1
