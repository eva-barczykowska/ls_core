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
def f(str)
  substrings = []

  (0...str.size).each do |idx1|
      (idx1...str.size).each do |idx2|
        substring = str[idx1..idx2]
        substrings << substring if (str.size % substring.size).zero?
      end
    end
  substrings = substrings.uniq

  chosen_substrings = substrings.select { |substring| substring * (str.size/substring.size) == str } # => ["ab", "ababab"]

  t = chosen_substrings.min_by(&:size)
  k = str.size / t.size

  [t, k]
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

puts "inner loop is NOT NECESSARY!!!"
def f(str)
  (1..str.size).each do |substr_size| # how many characters to cut 1..str.size
    substr = str[0, substr_size] # slicing from the beginning of the str so from 0 =>str[0, 1] => a, ab, aba, abab, ababa, ababab
    repetitions = str.size / substr_size #=> e.g. "ababab".size / "a".size => 6/1 AND "ababab".size / "a".size => 6/2

    return [substr, repetitions] if substr * repetitions == str # it will return AS SOON AS it will find the smallest substring, really clever!
  end
end
p f("ababab") #== ["ab", 3] #=> 1, 2, 3, 6
p f("abcde") == ["abcde", 1]

# a, ab, aba, abab, ababa, ababab # substrings created by just 1 loop - and this is enough for this problem
#
# Ilke
=begin
---------------------------Problem-------------------------
input: a string
output: an array with two elements: a substring, and integer
rules:
  - the integer represents the number of times the smallest substring should be multiplied by itself in order to equal input string
---------------------------Examples-------------------------
p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
p f(["a"]) == ["a", 1]
p f(['']) == ['', 1]
-----------------------Data Structures----------------------
intermediate steps:
  - get substrings
- a storage array
----------------------------Notes---------------------------
- min
- input.size % substring.size == 0 (factor)
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
      substrings << subs if string.size % subs.size == 0
    end
  end

  chosen_subs = substrings.select { |subs| subs * (string.size/subs.size) == string }

  t = chosen_subs.min_by(&:size)
  k = string.size / t.size

  [t, k]
end
p f("ababab") == ["ab", 3] #=> 1, 2, 3, 6
#---------------------Final Considerations-------------------
#Can I refactor anything?
# A factor of a number is a number that divides the given number evenly or exactly, leaving no remainder.

puts
# Sedricks's solution
def f(str)
  arr = str.chars
  substrings = []
  matches = []
  remove = 0

  until (arr.size) == remove #until our counter is equal to the arr size
    substrings << arr.slice(0..remove).join #create substrings starting with the first letter up to the array size

    remove += 1 #increase counter
  end

  # p substrings #=> ["a", "ab", "aba", "abab", "ababa", "ababab"]

  substrings.each do |substring| #iterate over the substring
    if str.scan(substring).join == str # VERY NICE!
      matches << substring << str.scan(substring).count
      break
    end
  end
  matches
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

puts
puts "Kana's solution"
=begin
Problem
- Input: a string
- Output: an array containing a string and an int

- Rules:
  - Return value is the minimum substring from given string (s) and integer is number of times substring is repeated to form 's'
- Returned integer can be 1
- Substring repeated k times == given string

Examples
"ababab" == ['ab', 3]
substrings =
  'a', 'ab', 'aba', 'abab', 'ababa', 'ababab'

Algorithm
- Iterate over range of integers from 0 up to but not including the size of the given string
- On each iteration, select chars from 's' string starting from 0 to current int (represents index) and store in variable 'substr'
- Check how many times substring appears in 's' -> store value in variable 'k'
- Check if substring * k is equal to 's'
- If true, exit iteration and return value of 'substr' and 'k' as an array
=end

def f(string)
  (0...string.size).each do |idx| # getting hold of index
    substr = string[0..idx] # getting hold of substrings
    k = string.scan(substr).size # scanning string for each substring, this returns an array and we want its SIZE, so a number

    return [substr, k] if (substr * k) == string # if substring * that number == string, return both k and substring
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]





