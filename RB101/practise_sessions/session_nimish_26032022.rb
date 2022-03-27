#Nimish
=begin
[Kata Stats: Write Number in Expanded Form \| Codewars](https://www.codewars.com/kata/5842df8ccbd22792a4000245)
6 kyu
Write Number in Expanded Form
You will be given a number and you will need to return it as a string in Expanded Form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.

If you liked this kata, check out part 2!!
=end

# Input - Integer
# Output - String

# Rules
# - number to be expressed in expanded form
#   - 12 => '10 + 2'
#   - 102 => '100 + 2'

# Algorithm
# - get the digits of the input integer and store in an Array
# - transform the array and multiply each element to its base in the Number
# - select non zero elements
# - join the array elements with a ' + '

def expanded_form(number)
  digits = number.digits
  digits = digits.map.with_index do |digit, index|
    digit * (10**index)
  end
  digits = digits.reject { |digit| digit == 0 }.reverse
  digits.join(' + ')
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'

#Ewa
=begin
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word
which should be returned as a string, where n is the position of the word
in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an
empty array; and each word will have enough letters.
=end

# Input - an array of words
# Output - a word/a string build out of nth character

# Data structures - an array / a string

# Algorithm
# -grab each word
# -from each word take the correct letter
# - from 1st word, take letter at index 0, from 2nd word, take letter
# from index 1, etc.
# - add it to the result array
# -output a string

def nth_char(arr)
  res = []
  counter = 0
  if arr.empty?
    return ''
  elsif arr.size == 1
    return arr[0][0]
  else
    arr.each do |word|
      res << word[counter]
      counter += 1
    end
  end
  res.join("")
end
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

#refactored:
puts ""
p "refactored"

def nth_char(arr)
  res = []
  counter = 0
  arr.each do |word|
    res << word[counter]
    counter += 1
  end
  res.join("")
end
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'


puts ""
#ewa - redo Nimish' exercise on my own
# Write Number in Expanded Form
# You will be given a number and you will need to return it as a string in Expanded Form. For example:
# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
# NOTE: All numbers will be whole numbers greater than 0.
#
# Requirements: a method that takes a number as an argument and returns a string in
# expanded form
# expanded form means
def expanded_form(number)
  digits = number.digits
  digits = digits.map.with_index { |num, index| num * (10**index) }
  digits = digits.reverse
  digits = digits.reject { |num| num == 0 }
  digits.join(" + ")
end
p expanded_form(12) == '10 + 2'
# digits will give me [2, 1]
# 2 * (10**0) = 2 * 1 = 2
# 1 * (10**1) = 1 * 10 = 10
# after .map.with_index, digits = [2, 10]
# after .reverse, [10, 2]
p expanded_form(42) == '40 + 2'
# digits will give me [2, 4]
# 2 * (10**0) = 2 * 1 = 2
# 4 * (10**1) = 4 * 10 = 40
# after .map.with_index, digits = [2, 40]
# after .reverse, [4, 2]
p expanded_form(70304) #== '70000 + 300 + 4'
# digits will give me [4, 0, 3, 0, 7]
# 4 * (10**0) = 4 * 1 = 40
# 0 * (10**1) = 0 * 10 = 0
# 3 * (10**2) = 3 * 100 = 300
# 0 * (10**3) = 0 * 1000 = 0
# 7 * (10**4) = 7 * 10000 = 70000
# after .map.with_index, digits = [40, 0, 300, 0, 70000]
# after .reverse, [70000, 0, 300, 0, 40]
