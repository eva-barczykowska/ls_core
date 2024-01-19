=begin
Implement a function that calculates the sum of numbers inside of a string.
-calculates
-the sum
-of numbers
-inside of a string.
Example: "L 12 aun 3 ch Sch 3 oo 451 " = 469
12+3+3+451 = 469

You can expect that the string will include only positive numbers.

sum_of_numbers("HE2LL3O W1OR5LD") == 11
sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
PEDAC
P:
- write a method that takes a str as an arg
- the str has integers as well as letters
- method calculates the sum of integers within the str

E:
sum_of_numbers("HE2LL3O W1OR5LD") == 11
=>2+3+1+5 = 11

sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
=>

DS:
input: str
middle: array of characters?
output: int

A
- downcase input str
- iterate over the str
- initialize numbers []
- initialize `temp` to store numbers
-if the char at the current iteration is not an integer, move on to the next character
- if the char at the curent iteration is an integer(doesn't belong to a..z + " "), add it to temp
- if it is not, add temp to `numbers`
- make it an empty str again

- transform `numbers` into an array of actual integers
- sum `numbers` and return the sum
=end


def sum_of_numbers(str)
  str = str.downcase
  alphabet = ("a".."z").to_a + [" "]

  numbers = []

  counter = 0
  temp = ''

  while counter < str.size
    if !alphabet.include?(str[counter])
      temp << str[counter]
    else
      numbers << temp unless temp == ''
      temp = ''
    end

    counter += 1
  end

  numbers.map { |s| s.to_i }.sum
end

p sum_of_numbers("L12aun3chSch3oo451") == (469)
p sum_of_numbers("HE2LL3O W1OR5LD") == 11
p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

puts "digits idea from Nick"
# digits

def sum_of_numbers(str)
  str = str.downcase
  digits = (0..9).to_a.map(&:to_s)

  numbers = []

  counter = 0
  temp = ''

  while counter < str.size
    if digits.include?(str[counter])
      temp << str[counter]
    else
      numbers << temp unless temp == ''
      temp = ''
    end

    counter += 1
  end

  numbers.map { |s| s.to_i }.sum
end

p sum_of_numbers("L12aun3chSch3oo451") == 469
p sum_of_numbers("HE2LL3O W1OR5LD") == 11
p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

puts
puts "solution with regex"

def sum_of_numbers string_source
  string_source.scan(/\d+/).map(&:to_i).sum
end

p sum_of_numbers("L12aun3chSch3oo451") == 469
p sum_of_numbers("HE2LL3O W1OR5LD") == 11
p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

puts
# solving for the 2nd time
=begin
Implement a function that calculates the sum of numbers inside of a string.
P:
- given a str containing both digits, letters and special characters(like a " "),
- return the sum of all integers in the string

E:
p sum_of_numbers("L12aun3chSch3oo451" = 469)
12+3+3+451= 18+451=469

p sum_of_numbers("HE2LL3O W1OR5LD") == 11
=> 2+3+1+5 =11

p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

A:
- initialize `sum`, where you will store the result to be returned
- initialize `temp_digit` to ``, this is where i will push numbers
- define what are digits (0..9) but map them to strings

- loop over all characters from index 0...arr.size
- while looping build temp_digit (which sometimes can be 2digit or more):
  - if the character at the current counter is included in `digits`, append it to `temp_digit` BUT it's a string so
    change it to an integer before appending
- how to check that it is a digit? use validation "0" == 0.to_i.to_s
  - else if  the character at the current iteration is not a digit,
  - add the `temp_digit` that you built into array of `sum` and move on to the next character

- calculate and return `sum`
=end

puts "problematic, will not work if the number is at the end"
puts "solving again"

def sum_of_numbers(str)
  digits = (0..9).to_a.map(&:to_s)
  result = []
  temp = ''

  counter = 0
  while counter < str.size + 1
    if digits.include? str[counter]
      temp << str[counter]
    else
      result << temp
      temp = ''
    end

    counter += 1
  end

  result.map(&:to_i).sum
end
p sum_of_numbers("L12aun3chSch3oo451") == 469
p sum_of_numbers("HE2LL3O W1OR5LD") == 11
p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

puts
puts "new breakup of the problem and solution"
# How can I get ALL the digits from this string?
# patch solution, add an "" at the end of the string for the last number to be included:
# the last time that the code iterates




