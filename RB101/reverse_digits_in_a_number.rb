=begin
Reverse the Digits In a Number
Write a method that takes a positive integer as an argument
and returns that number with its digits reversed

Don't worry about arguments with leading zeros - Ruby sees those as octal numbers,
which will cause confusing results.
For similar reasons, the return value for our fourth example doesn't have any leading zeros.

PEDAC
Problem
-write a method that takes a number
-the method returns that number reversed
-there are no leading zeros in the result

Examles:
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

Data Structures:
input: integer
middle: array
output: integer

Algorithm:
-divide the number into digits
-remove leading zeros if any -- how
-return the joined result

Code
=end

def reversed_number(number)
  array_of_numbers = number.digits
  until array_of_numbers[0] > 0
    array_of_numbers.shift
  end
  array_of_numbers.join("").to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

puts ""

#ls solution
def reversed_number(number)        #12000
  string = number.to_s             #'12000
  reversed_string = string.reverse #'00021'
  reversed_string.to_i             #21
end
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

puts ""

def reversed_number(number)
  number.digits.join.to_i
end
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

puts ""

def reversed_number(int)
  arr = int.digits
  final_num = 0
  count = 0
  loop do
    final_num = final_num * 10 + arr[count] #5 4 3 2 1
    count += 1
    break if count == arr.size
  end
  final_num
end
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

puts ""

def reversed_number(num)
  result = ""
  num.to_s.chars.each do |char|
    result.prepend(char)
  end
  result.to_i
end
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
