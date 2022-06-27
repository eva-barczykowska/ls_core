# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers between the two numbers,
# except if a number is divisible by 3, print "Fizz", if a number is divisible by 5,
# print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# PEDAC

# Problem
# -write a method that takes 2 arguments:
# -starting number and ending number
# -the method prints out all the numbers between starting number and ending number except:
# -if a number is divisidiblle by 3 it prints Fizz
# -if a nuber is divisible by 5 it prints Buzz
# -if a number is divisible by 3 and 5 it prints FizzBuzz

# Examples
# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Data Structures
# -input: Integers
# -output: Integers and String

# Algorithm
# -get an array of required required numbers
# - set result array
# -go through these numbers, look at each number and
# -use a conditional, start with a condition asking if a nummber is divisible by 3 and by 5 then push FizzBuzz to result
# -then ask about 5- Buzz
# -then ask about 3 - Fizz
# -ellse print the nuber
# join and print result array with (", ")

# Code

def fizzbuzz(starting_num, ending_num)
  array = (starting_num..ending_num).to_a
  result = []
  array.each do |num|
    if num  % 3 == 0 && num % 5 == 0
      result << "FizzBuzz"
    elsif num % 5  == 0
      result << "Buzz"
    elsif num % 3 == 0
      result << "Fizz"
    else
      result << num
    end
  end
  print result.join(', ')
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

puts ""
# ls solution
def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
