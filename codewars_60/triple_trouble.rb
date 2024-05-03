# 598. Triple trouble
# (https://www.codewars.com/kata/55d5434f269c0c3f1b000058)
# 6 kyu
# Write a function triple_double(num1, num2) which takes numbers num1 and num2
# and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.
# If this isn't the case, return 0
#
# ** return 1: straight triple and straight double
# return 0 if there is not both a straight triple and a straight double
# PEDAC TEMPLATE
#
# ************** Problem **************
# -write a method that takes 2 arguments, num1 and num2
# -this method returns 1 if there is a straight triple of a number at any place in num1 AND
#  also a straight double of the same number in num2
# -so I need 3 occurrences of any digit (from the first number argument) in the first number and a double occurrence of
# any digit(from the first number argument) in the second number
#
# Questions:
# -the test cases have only consecutive numbers, this has to be accounted for, right?
#
# ************** Examples **************
# p triple_double(12345, 12345)   == 0 --> because no triple in the first one!
# p triple_double(666789, 12345667) == 1 -->because triple in the fist one and double in the second one!
# p triple_double(10560002, 100)  == 1 --> because triple in the first one and double in the second one!
# p triple_double(1112, 122) == 0 --> because triple in the first one BUT no in the second one!
#
# ************** Data Structures **************
# input: 2 integers
# output: 0 or 1
# ************** Algorithm **************
# -initialize `consecutive_digits_in_num1` and `consecutive_digits_in_num2` and point both to reference 0
# -change num1 and num2 to string and iterate over both, creating substrings of each
# 10560002
# 1, 10, 105, 1056, 10560, 105600. 1056000, 10560002
# 0, 05, 056, 0560, 05600, 056000, 0560002
# 5, 56, 560, 5600, 56000, 560002
# 6, 60, 600, 6000, 60002
# 0, 00, 000, 0002
# 0, 00, 002
# 0, 02
# -get all strings that are of size 3, how to analyze them? I want to know that I have the same cluster of 3 digits
# in the num1 and cluster of SAME 2 digits in num2
# -first get rid of all clusters whose size is smaller or greater than 3
# -then get rid of clusters whose digits are not same
# -if I don't have any clusters greater than 3, I can return 0 already
# if I have clusters greater than 3 in num1, I have to check if I have cluster  consisting of same digits and
# of size 2 in num2
#
#
# OR
# -account for nil or 0 input
# -account for 0 input
# -change the num to an array of single digits
# -find out if any numbers are repeated in array1 and also which ones
# -after retrieving the numbers that are repeated return 0 if they are repeated less than 3 times
#
# -find out if any numbers are repeated in array2 and also which ones
# -if none of the target numbers extracted from array1 are present in array2, return 0
# -if the numbers are present but their count is different than 2, return 0
# -else return 1
#
def triple_double(num1, num2)
  return 0 if num1.nil? || num2.nil?
  return 0 if num1.zero? || num2.zero?

  array1 = num1.to_s.split('').map { |s| s.to_i }
  array1_chunks = array1.chunk_while { |i, j| j == i + 0 }.select { |array| array.size == 3 }.flatten
  # p "all chunks from 1st array"
  # p array1_chunks

  return 0 if array1_chunks.size < 3 # these will be all chunks of 3 or more same consecutive numbers

  target_numbers = array1_chunks.uniq
  # p "target numbers"
  # p target_numbers # now see if ANY of those target numbers are present in the num2 array 1 after another

  array2 = num2.to_s.split('').map { |s| s.to_i }
  array2 = array2.chunk_while { |i, j| j == i + 0 }.select { |array| array.size == 2 }.flatten

  # p "all chunks from 2nd array"
  # p array2

  return 0 if array2.none? { |num| target_numbers.include?(num) }
  return 0 unless target_numbers.any? { |number| array2.count(number) == 2 }

  1
end

p triple_double(111_222_345, 122_345) == 1
p triple_double(133_345, 123_345) == 1
p triple_double(12_345, 12_345) == 0
p triple_double(666_789, 12_345_667) == 1
p triple_double(10_560_002, 100) == 1
p triple_double(1112, 122) == 0
p triple_double(451_999_277, 41_177_722_899) == 1
p triple_double(1_222_345, 12_345) == 0

puts

#  598. Triple trouble
# (https://www.codewars.com/kata/55d5434f269c0c3f1b000058)
# 6 kyu
# Write a function triple_double(num1, num2) which takes numbers num1 and num2
# and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.
# If this isn't the case, return 0
#
# ** return 1: straight triple and straight double
# return 0 if there is not both a straight triple and a straight double
#
# PEDAC
# Problem
# =======
# What is straight_triple?
# 999 111 222
# What is straight double?
# 99 11 22
# -write a method that returns 1 if there is a straigh triple in the first n1 and straight double in num2
# -if there is not, method returns 0
# p triple_double(111222345, 122345) == 1
# 111 222 => 22
# p triple_double(133345, 123345) == 1
# =>333 33
# p triple_double(12345, 12345) == 0
# => no trible or double
# p triple_double(666789, 12345667) == 1
# 666 => 66
# p triple_double(10560002, 100) == 1
# 000 => 00
# p triple_double(1112, 122) == 0
# 111 => no double
# p triple_double(451999277, 41177722899) == 1
# 999
# p triple_double(1222345, 12345) == 0
#
# Algorithm
# =========
# GET unique numbers from the num1
# change num1 and num2 to a string
# INIT a `reference_hash `to store `straight_triples` and `straight_doubles`
# -keys are unique numbers obtained from num1
# -values are: array of `straight_triples` and `straight_doubles`
#
# PREPARE the `reference_hash`
# ITERATE over unique numbers and for each unique number as a key, add a value:
# -multiply the number used as a key 3 times, add to the value
# -multiply the number used as a key 2 times, add to the value
# -nu
#
#
# ITERATE over the `reference_hash` keys and values
# VEFIFY if straight triple from `straight_triples` and straignt double`straight_doubles` both present:
# -for each key the value is an array of 2 elements
# -check if num1 contains first element, straight tripple  and num2 contains second element, straight double
# -if yes, RETURN 1
# -else RETURN 0

def triple_double(num1, num2)
  unique_nums = num1.digits.reverse.uniq
  num1 = num1.to_s
  num2 = num2.to_s

  reference_hash = {}
  unique_nums.each do |n|
    reference_hash[n] = [] unless reference_hash.key?(n)
  end

  reference = reference_hash.map { |k, _v| [v = k.to_s * 3] << k.to_s * 2 }

  return 1 if reference.any? { |arr| num1.include?(arr.first) && num2.include?(arr.last) }

  0
end
p triple_double(111_222_345, 122_345) == 1
p triple_double(133_345, 123_345) == 1
p triple_double(12_345, 12_345) == 0
p triple_double(666_789, 12_345_667) == 1
p triple_double(10_560_002, 100) == 1
p triple_double(1112, 122) == 0
p triple_double(451_999_277, 41_177_722_899) == 1
p triple_double(1_222_345, 12_345) == 0

puts
# Algorithm
# =========
# GET unique nums [1,2,3,4,5]
# CHANGE num1 and num2 to strings
# ITERATE over the unique numbers and query num1 if it has a tripple of a number and num2 if it has a double
# -multiply num by 1000 for the num1 and multiply num by 100 for num2, convert to str
# -scan the num1 and num2 for these values,
# RETURN if match is found
#
# -else RETURN 0

def triple_double(num1, num2)
  unique_nums = num1.digits.reverse.uniq
  str1 = num1.to_s
  str2 = num2.to_s

  unique_nums.each do |num|
    triple = num * 111
    double = num * 11
    return 1 if !str1.scan(triple.to_s).empty? && !str2.scan(double.to_s).empty?
  end

  0
end
p triple_double(111_222_345, 122_345) == 1
p triple_double(133_345, 123_345) == 1
p triple_double(12_345, 12_345) == 0
p triple_double(666_789, 12_345_667) == 1
p triple_double(10_560_002, 100) == 1
p triple_double(1112, 122) == 0
p triple_double(451_999_277, 41_177_722_899) == 1
p triple_double(1_222_345, 12_345) == 0

#
# feedback from Amar
#
# When working through your examples, asking yourself questions like
#  "I need to check my first string for a triple and second string for a double - how do i do that?"
# " What are all of my valid triples and valid doubles?"
# " How can I access these valid triples and valid doubles?"
# " How can I compare any valid triples to valid doubles?"
#
# This type of thinking can really help your algorithm because you're addressing needs that can help you develop an algorithm that will perform all the rules you define. Notice that all of these questions are ambiguous in that there can be multiple different solutions -- it's not important to think of the answers during the Example phase of PEDAC, but it can help you generate ideas and also some of these questions may be easily answerable and help speed up your process.
# For example, "How can I access these valid triples and valid doubles?" In the back of my head, I'm already thinking of using arrays to store all valid triples and all valid doubles. I don't know what I'm going to do with these arrays, but having them identified and available for use helps me structure my solving process, because I know I can use them in a variety of ways to come up with a solution. Here the most important thing is that I don't have a specific solution, but rather I can implement a variety of solutions depending on what I brainstorm/come up with.
# As to your second algorithm, you knew that if you had pre-prepared chunks (i.e. our valid triples and doubles) that you could then somehow compare your triples and doubles to see if an argument (num1 and num2) contain those values. And this comparison is handled with #scan , although there are many ways to go about this logic. It's the general step that leads you to your specific implementation. This is the mentality / process I'm referring to, where you have an idea on how you want to approach your solution. You don't know what you will do, but that doesn't matter, because your approach logically makes sense and therefore will solve the problem. You can change the logic itself a million times, but the approach will always work.
#
# Note that although I chose to break up the third step where you were performing the bulk of the logic that is checking for triples and doubles, multiplying them by 1000/100, converting them to strings, and finally scanning num1/num2 for these products -- in reality it may be easier to have a broad general approach all in one step as you did, and then flesh out the specific implementation details. It really just depends on the question itself, your own problem solving process, and how much work is being done by this specific step. I just personally find it easier to break things down into general steps that focus on one-two pieces of logic, rather than having a general step that has multiple processes going on. I find it harder to track what's going on, and I find that my algorithm
#
# HAVE A BROAD GENERAL APPROACH
# ASK QUESTIONS LIKE THOSE MENTIONED AT THE BEGINNING

# - GET unique nums
# 	# How would I implement this? General step that I need to do, so here I can consider
# 	a few different options
# - CHANGE num1 and num2 to strings
# 	# How would I implement this? General step that I need to do, so here I can consider
# 	a few different options. Easiest option is `to_s`, but there could be others

# - CHECK if num1 has a triple and num2 has a double
# 	# How would I implement this? General step that I need to do, so here I can consider
# 	a few different options
# 	# This step from your algorithm had a lot of logic going on. It may be worthwhile
# 	to consider splitting this upto into smaller chunks such as:
# 	- CHECK if num1 has a triple and num2 has a double
# 		# After entire general approach is formatted, consider implementation details
# 	- MULTIPLY triple by 1000 and double by 100
# 		# After entire general approach is formatted, consider implementation details
# 	- CONVERT the products to strings
# 		# After entire general approach is formatted, consider implementation details
# 	- SCAN/CHECK if num1 and num2 contain the products
# 		# After entire general approach is formatted, consider implementation details
# - RETURN 1 if match is found, otherwise 0
#
# Amar's algorithm for this problem
#
# Algorithm:
# - CREATE an array of all triples
# - CREATE an array of all doubles
# - CREATE two arrays for all valid triples/doubles found in num1/num2
# - FIND all valid triples
#   - ITERATE over array of triples
#     - Check if a string verison of the current num is found in string num1
#     - if so, move to an tripples
# - Find all valid doubles
#   - ITERATE over array of doubles
#     - check if a string version of the current num is found in string num2
#     - if so, move to the dpib;es array
# - SELECT all triple double matches
#   - ITERATE over tripples array
#     - for each tripple
#     - ITERATE over doubles array
#       - for each double
#       - if the current double is equal to the first 2 digits of the tripple
#         - return 1
# - RETURN 0

def triple_double(num1, num2)
  array_of_all_tripples = num1.digits.uniq.reverse.map { |d| d.to_s * 3 }
  array_of_all_doubles = num1.digits.uniq.reverse.map { |d| d.to_s * 2 }

  tripples_from_num1 = array_of_all_tripples.select { |tripple| num1.to_s.include?(tripple) }
  doubles_from_num2 = array_of_all_doubles.select { |double| num2.to_s.include?(double) }

  tripples_from_num1.each do |tripple|
    doubles_from_num2.each do |double|
      return 1 if double == tripple[0..1]
    end
  end

  0
end
p triple_double(111_222_345, 122_345) #== 1
p triple_double(133_345, 123_345) == 1
p triple_double(12_345, 12_345) == 0
p triple_double(666_789, 12_345_667) == 1
p triple_double(10_560_002, 100) == 1
p triple_double(1112, 122) == 0
p triple_double(451_999_277, 41_177_722_899) == 1
p triple_double(1_222_345, 12_345) == 0

# codewars solution that I liked

def triple_double(num1, num2)
  num1 = num1.to_s
  num2 = num2.to_s
  10.times do |i| # smart! coz there are only 10 numbers (0-9)
    return 1 if num1.include?(i.to_s * 3) && num2.include?(i.to_s * 2)
  end
  0
end
p triple_double(111_222_345, 122_345) #== 1
p triple_double(133_345, 123_345) == 1
p triple_double(12_345, 12_345) == 0
p triple_double(666_789, 12_345_667) == 1
p triple_double(10_560_002, 100) == 1
p triple_double(1112, 122) == 0
p triple_double(451_999_277, 41_177_722_899) == 1
p triple_double(1_222_345, 12_345) == 0
