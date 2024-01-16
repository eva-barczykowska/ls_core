=begin
A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward as forward. Examples of numerical palindromes are:

2332
110011
54322345
You'll be given 2 numbers as arguments: (num, s). Write a function which returns an array of s number of numerical palindromes that come after num. If num is a palindrome itself, it should be included in the count.

Return "Not valid" instead if any one of the inputs is not a number or is less than 0.

Single digit numbers will NOT be considered numerical palindromes.

palindrome(6,4) == [11,22,33,44]
palindrome(59,3) == [66,77,88]
palindrome(101,2) == [101,111]
palindrome("15651",5) == "Not valid"
palindrome(1221,"8") == "Not valid"

P:
- write a method that takes 2 arguments, both integers
- first number is num
- second number is s, this stands for s numbers of numerical palindromes that come after the given number n (first argument)

- e.g. after 6, the 4 palindromes will be 11, 22, 33, 55

- if the number is a palindrome, it should be included in the result/output array
- return 'Not valid' if input is not a number of is less than 0
- single digits are not numerical palindromes

Examples:
palindrome(6,4) == [11,22,33,44]
=> after 6, the 4 palindromes will be 11, 22, 33, 55

palindrome(59,3) == [66,77,88]
=> after 59, the 4 palindromes will be 66,77,88

palindrome(101,2) == [101,111]
=> after 101, the 2 palindromes will be 101 and  111

palindrome("15651",5) == "Not valid"
=> n is a string!

palindrome(1221,"8") == "Not valid"
=> s is a string!
=end
def palindrome?(number)
  number.to_s.reverse == number.to_s
end

def check_integer(number)
  number.to_s.to_i == number
end

def palindrome(num, s)
  return 'Not valid' unless check_integer(num)
  return 'Not valid' unless check_integer(s)

  answer = []
  num = 10 if num.digits.size == 1
  loop do
    answer << num if palindrome?(num)
    break if answer.size == s
    num += 1
  end
  answer
end

puts palindrome(6,4) == [11,22,33,44]
puts palindrome(59,3) == [66,77,88]
puts palindrome(101,2) == [101,111]
puts palindrome("15651",5) == "Not valid"
puts palindrome(1221,"8") == "Not valid"

#Nick
=begin
A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward as forward. Examples of numerical palindromes are:

2332
110011
54322345
You'll be given 2 numbers as arguments: (num, s). Write a function which returns an array of s number of numerical palindromes that come after num. If num is a palindrome itself, it should be included in the count.

Return "Not valid" instead if any one of the inputs is not a number or is less than 0.

Single digit numbers will NOT be considered numerical palindromes.

palindrome(6,4) == [11,22,33,44]
palindrome(59,3) == [66,77,88]
palindrome(101,2) == [101,111]
palindrome("15651",5) == "Not valid"
palindrome(1221,"8") == "Not valid"

input: INTEGERS, (possibly floats)You'll be given 2 numbers as arguments: (num, s).
output: ARRAY (of numbers) or STRING - "Not valid", returns an array of s number of numerical palindromes that come after num.


Examples analysis
Input 6,4
Output 11,22,33,44
6 7 8 9 10 11

59,3
66,77,88

60 61 62 63 64 65 66 67 68 69 70

Alorithm
if num, or s is of class string, return "Not valid"

Have some type of loop
In this loop we are gooing to add 1 to num,
-If that new num == a palindrome then return it to an array (arr_solution)
-If not continue

Break loop when number of element in arr_solution = "s"

convert integer into a String
determine the length of that String
divide that string by 2, determine number of matches to check
check that left side digit equals rightside digit untile matches to check is complete


=end

def palindrome(num, s)
  return "Not valid" if num.is_a?(String) || s.is_a?(String)
  return "Not valid" if num < 0 || s < 0
  return [] if s == 0

  arr_solution = []
  num_to_check = nil

  until arr_solution.length == 4
    num_to_check = num + 1
    if palindrome?(num_to_check)
      arr_solution << num_to_check
    end
  end
  p arr_solution
end

def palindrome? possible_palindrome
  string_palindrome = possible_palindrome.to_s
  digits_count = string_palindrome.length
  matches_to_check =  digits_count/2

  matches_to_check.times do |idx|
    return false unless string_palindrome[idx] == string_palindrome[-(idx + 1)]
  end
  true
end

palindrome(6,4)# == [11,22,33,44]
# palindrome(59,3) == [66,77,88]
# palindrome(101,2) == [101,111]
# p palindrome("15651",5) == "Not valid"
# p palindrome(1221,"8") == "Not valid"
# p palindrome(-1,5) == "Not valid"
# p palindrome(-1,-5) == "Not valid"
# p palindrome(1,-5) == "Not valid"
# p palindrome(6,0) == []

# Nick 2
=begin
A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward as forward.
Examples of numerical palindromes are:

2332
110011
54322345
You'll be given 2 numbers as arguments: (num, s). Write a function which returns an array of s number of
numerical palindromes that come after num. If num is a palindrome itself, it should be included in the count.

Return "Not valid" instead if any one of the inputs is not a number or is less than 0.

Single digit numbers will NOT be considered numerical palindromes.

palindrome(6,4) == [11,22,33,44]
palindrome(59,3) == [66,77,88]
palindrome(101,2) == [101,111]
palindrome("15651",5) == "Not valid"
palindrome(1221,"8") == "Not valid"

input: INTEGERS, (possibly floats)You'll be given 2 numbers as arguments: (num, s).
output: ARRAY (of numbers) or STRING - "Not valid", returns an array of s number of numerical palindromes that come after num.


Examples analysis
Input 6,4
Output 11,22,33,44
6 7 8 9 10 11

59,3
66,77,88

60 61 62 63 64 65 66 67 68 69 70

Alorithm
if num, or s is of class string, return "Not valid"

Have some type of loop
In this loop we are gooing to add 1 to num,
-If that new num == a palindrome then return it to an array (arr_solution)
-If not continue

Break loop when number of element in arr_solution = "s"

convert integer into a String
determine the length of that String
divide that string by 2, determine number of matches to check
check that left side digit equals rightside digit untile matches to check is complete


=end

def palindrome(num, s)
  return "Not valid" if num.is_a?(String) || s.is_a?(String)
  return "Not valid" if num < 0 || s < 0
  return [] if s == 0

  arr_solution = []
  num_to_check = nil
  counter = num

  until arr_solution.length == s
    num_to_check = counter
    if palindrome?(num_to_check)
      arr_solution << num_to_check
    end
    counter +=1
  end
  arr_solution
end

def palindrome? possible_palindrome
  string_palindrome = possible_palindrome.to_s
  digits_count = string_palindrome.length
  return false if digits_count == 1
  matches_to_check =  digits_count/2

  matches_to_check.times do |idx|
    return false unless string_palindrome[idx] == string_palindrome[-(idx + 1)]
  end
  true
end

# p palindrome? 7

p palindrome(6,4) == [11,22,33,44]
p palindrome(59,3) == [66,77,88]
p palindrome(101,2) == [101,111]
p palindrome("15651",5) == "Not valid"
p palindrome(1221,"8") == "Not valid"
p palindrome(-1,5) == "Not valid"
p palindrome(-1,-5) == "Not valid"
p palindrome(1,-5) == "Not valid"
p palindrome(6,0) == []



