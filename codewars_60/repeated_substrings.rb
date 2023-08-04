#  8.Repeated Substring
# (https://www.codewars.com/kata/5491689aff74b9b292000334/train/ruby)
# 6 kyu
=begin
For a given nonempty string s find a minimum substring t and the maximum number k,
such that the entire string s is equal to t repeated k times.
The input string consists of lowercase latin letters.
Your function should return an array [t, k].
Example #1:
for string s = "ababab"
the answer is ["ab", 3]

Example #2:
for string s = "abcde"
the answer is ["abcde", 1]

because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.
PEDAC TEMPLATE
************** Problem **************
-write a method that takes 1 argument, a String
-string won't be empty
-lower letters only
-find a minimum substring t
-and a maximum number k
-such that s(argument) is equal to t(substring) repeated k(maximum number) times
s == k.times{|t| print t}
-the method should return an Array, ie. [t, k]

Questions:

************** Examples **************
p f("ababab") == ["ab", 3] if I print "ab" 3 times, I get "ababab"
it HAS TO equal the original input!!!

p f("abcde") == ["abcde", 1]

************** Data Structures **************
input: String
output: an Array of 2 elements, a string and the number that that string repeated gives us the argument string
************** Algorithm **************
substrings:
a, ab, aba, abab, ababab
b, ba, bab, baba, babab
a, ab, aba,abab
b, ba, bab
a, ab,
b => ab, counted => 3

s == k.times{|t| print t}

substrings:
a, ab, abc, abcd, abcde # maximum number is required
b, bc, bcd, bcde
c, cd, cde
d, de
d => "abcd" counted =>1
array of substrings: ["a", "ab", "abc", "abcd", "abcde", "b", "bc", "bcd", "bcde", "c", "cd", "cde", "d", "de", "e"]

-first get all the substrings - how?
-start iterating from first character of the word and gradually keep cutting 1 more character
 until characters are over
-when characters are over, start with the second character and keep cutting 1 character until
 the characters in the word are over
- repeat this process until you have no more characters to start from
  i.e. the last round is when you start with the last character and this is your cut string

-then see which substring multiplied by which number would equal that string argument - how?
-initialize `result` and `counter` variables
-use a loop to iterate over every substring until its size
-within the body of the loop check if that substring times counter is equal to the string argument
-if it is, add an array to the result, first element of the array is the substring, second is the counter
-remember to increase the counter after each iteration

-the last thing is to iterate through the `result` array and ask which of the first elements
 is the biggest

* good questions!
-iterate through the substrings
-check each substring if I can multiply it by a certain number
(what number?)

what was that (biggest) multiplicant? -that's my answer

-the second part I would achieve by looping
-loop from 1 to str.size
-I loop though all of the substrings
-how many times? str.size times
-each time I will add to my result variable the substrings which multiplied by the current number
 give me the string argument
-add to the result array, an array with string and counter


************** Code **************
=end
def f(str)
  substrings = []
  (0...str.size).each do |starting_index|
    (starting_index...str.size).each do |ending_index|
      substrings << str[starting_index..ending_index]
    end
  end

  result = []
  counter = 1
  while counter <= str.size
    substrings.each do |substring|
      result << [substring, counter] if substring * counter == str
    end
    counter += 1
  end

  result = result.max_by do |subarray|
    subarray[1]
  end
  result
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

puts
puts "each_with_object"
# each_with_object returns the initially given object if block is given
# if block is not given, it returns enumerator

def substrings(str)
  (0...str.size).each_with_object([]) do |start_index, substrings_array| # this way I don't need to first initialize the substrings array
    (start_index...str.size).each do |end_index|
      substrings_array << str[start_index..end_index]
    end
  end
end # now I have all the possible substrings ready for further processing

def f(str)
  substrings = substrings(str) # calling the method to get an array of all possible substrings out of my argument string
  result = []
  counter = 1
  while counter <= str.size # look at detailed description below, btw, this is a cool loop!
    substrings.each do |substring|
      result << [substring, counter] if substring * counter == str
    end
    counter += 1
  end
  puts 'these are my substrings that multiplied by a certain number equal the argument string:'
  p result

  result.max_by { |subarray| subarray[1] }
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
# explaining this part in detail:
#   while counter <= str.size # in case of "abcde", counter will be 1, 2, 3, 4, 5, we will
#     substrings.each do |substring|
#       result << [substring, counter] if substring * counter == str
#     end
#     counter += 1
#   end
#
# in case of "abcde", counter will be 1, 2, 3, 4, 5 (because str.size == 5)
# our substrings are:
# a, ab, abc, abcd, abcde
# b, bc, bcd, bcde
# c, cd, cde
# d, de

# so we will ask--first iteration, for the counter 1:
# a * 1 == "abcde" => false
# ab * 1 == "abcde" => false
# abc * 1 == "abcde" => false
# abcd * 1 == "abcde" => false
# abcde * 1 == "abcde" => TRUE, ["abcde", 1] will get added into the result array

# now the counter 2, for the counter 2:
# a * 2 == "abcde" => false
# ab * 2 == "abcde" => false
# abc * 2 == "abcde" => false
# abcd * 2 == "abcde" => false
# abcde * 2 == "abcde" => false, from this iteration nothing will get added into the array

# now the counter 2, for the counter 3:
# a * 3 == "abcde" => false
# ab * 3 == "abcde" => false
# abc * 3 == "abcde" => false
# abcd * 3 == "abcde" => false
# abcde * 3 == "abcde" => false, from this iteration nothing will get added into the array

# now the counter 2, for the counter 4:
# a * 4 == "abcde" => false
# ab * 4 == "abcde" => false
# abc * 4 == "abcde" => false
# abcd * 4 == "abcde" => false
# abcde * 4 == "abcde" => false, from this iteration nothing will get added into the array

# now the counter 2, for the counter 5:
# a * 5 == "abcde" => false
# ab * 5 == "abcde" => false
# abc * 5 == "abcde" => false
# abcd * 5 == "abcde" => false
# abcde * 5 == "abcde" => false, from this iteration nothing will get added into the array

# so only this got added [["abcde", 1]]
# if we had more, then we just iterate through the subarrays
# and verify which one of all second elements of these subarrays is the biggest
#
puts "second time round"
# second time
# =begin
#
# Given non empty string check if it can be constructed by taking a substring of it an appending multiple copies of substring
#   together.
#
#   Assume given string consists of lowercase English letters only.
#
# Example 1:
# Input: 'abab'
# Output: true
# Explanation: It's the substring 'ab' twice.
# Example 2:
# Input: 'aba'
# Output: false
# Explanation: String cannot be constructed from repeating substring.
# =begin pedac
#
# *************Problem********************
# Overall goal: To write a method that takes a string and detects whether it can be constructed by taking a substring and multiplying it by a number. return false if it cannot be constructed this way, true if it can be constructed this way
# initial input: string
# overall output: boolean
#
# explicit requirements:
# input string: lowercase chars only
# return value:
#   true: if substring * integer == string
#   false: if substring * integer != string
# rules for detection
#   generate substrings
#   check if substring * integer == substring return true
#   only looking for multiple copies, so integer we would check >=2
#
#
# implicit requirements:
#
# questions:
#
# **********Examples/Test cases************
# p repeated_substring_patten('abab')  == true
# **'ab' * 2 == 'abab'  so method returns true
# p repeated_substring_patten('aba') == false
# ** wont work, return false
# aba
# a ab aba
# b ba
# a
# p repeated_substring_patten('aabaaba') == false
# **no substrings will work
# p repeated_substring_patten('abaababaab') == true
# ** 'abaab' * 2 = 'abaababaab'. true is returned
# p repeated_substring_patten('abcabcabcabc') == true
# ** 'abc' * 4 == 'abcabcabcabc'
#
# *************Data Structure**************
# string > boolean
#
#
# *************SCRATCH PAD**************
# gen substrings: nested each structure. iterate (0...string.size)/ pass in start_idx to the block
#   iterate over range (start_idx...string.size) / pass in end_idx
#     3rd layer: 2.upto(string.size / 2) / pass in `int` to block
#     count += 1
#
#
#
#
# ***************Algorithm*****************
# define method, 1 parameter `string`
# initialize `count` to 0
# generate substrings
#   iterate 2 up to string size / 2 / passing in each integer
#     if substring * int == string
#         then return true
#     else return false
# ternary operator: count > 0 return true, else return false
#
#
# =end

def repeated_substring_patten(string)
  count = 0
  (0...string.size).each do |start_idx|
    (start_idx...string.size).each do |end_idx|
      2.upto(string.size / 2) do |int|
        count += 1 if string[start_idx..end_idx] * int == string
      end
    end
  end
  count > 0 ? true : false
end
p repeated_substring_patten('abab')   == true
p repeated_substring_patten('aba') == false
p repeated_substring_patten('aabaaba') == false
p repeated_substring_patten('abaababaab') == true
p repeated_substring_patten('abcabcabcabc') == true



















puts
puts "codewars"
=begin
************** Problem **************
-write a method that takes a non-empty string
-find a mimumum substring that when it's multiplied by a number, returns the string, eg.
s = "ababab" == ["ab", 3]
************** Examples **************
f("ababab"), ["ab", 3]
f("abcde"), ["abcde", 1]

************** Data Structures **************
Input:string

Output:array of 2 elements, which are t-the substring and k-the amount of times it needs to be repeated
************** Algorithm **************
-generate substrings from the string
-save into `substrings` only those substrings, whose size is equal to factor of string's size, e.g.
 A FACTOR is a number that is dividing a given number EVENLY or EXACTLY, without a remainder.
  if the string's size is 6, the factors are 1, 2, 3, and 6.
 -how to get factors of a number?
 (1..target_num).select { |divisor| target_num % divisor == 0 }

-once I have all the substrings, select the smallest substring, t
-which multiplied by any of the factors, k, will give us the target string

-save both t and k to an array and return it

************** Code **************
************** Refactor **************
=end
def f(s)
  substrings = []
  dividend = s.size

  factors = (1..dividend).select { |divisor| dividend % divisor == 0 }

  # p "Factors are #{factors}"
  (0...s.size).each do |idx1|
      (idx1...s.size).each do |idx2|
        substring = s[idx1..idx2]
        substrings << substring if factors.include?(substring.size)
      end
    end
  substrings = substrings.uniq

  chosen_substrings = substrings.select { |substring| substring * (s.size/substring.size) == s } # => ["ab", "ababab"]

  t = chosen_substrings.min_by(&:size)
  k = s.size / t.size

  return [t, k]

end
p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

puts
puts "Ilke's solution"
=begin
--------------------------Algorithm-------------------------
- initialize a substrings array
- initialize a chosen substrings array
- get substrings whose length is a factor of the length of the input string
- iterate through the substrings array
- push substrings to the chosen array if this is true:
                                                   substring * (string.size/substring.size) == string
- select the smallest substring and (string.size/substring.size) and return in an array
----------------------------Code----------------------------
=end
def f(string)
  substrings = []

  (0...string.size).each do |index1|
    (index1...string.size).each do |index2|
      subs = string[index1..index2]
      substrings << subs if string.size % subs.size == 0 #factors so size of substring will be 1, 2, 3, 6 for the first test case
    end
  end
  #p substrings # is ["a", "ab", "aba", "ababab", "b", "ba", "bab", "a", "ab", "aba", "b", "ba", "bab", "a", "ab", "b"]

  chosen_subs = substrings.select { |subs| subs * (string.size/subs.size) == string }
  #now from the factors select only those substrings, which, when multiplied by ()str.size is divided by their size) gives us the string
  # p chosen_subs

  t = chosen_subs.min_by(&:size)
  k = string.size / t.size

  [t, k]
end
p f("ababab") == ["ab", 3] #=> 1, 2, 3, 6
p f("abcde") == ["abcde", 1]
#---------------------Final Considerations-------------------
#Can I refactor anything?
# A factor of a number is a number that divides the given number evenly or exactly, leaving no remainder.



