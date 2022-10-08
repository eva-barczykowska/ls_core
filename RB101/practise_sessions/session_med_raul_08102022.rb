# Positive Dominant
# An array is positive dominant if it contains strictly more unique
# positive values than unique negative values.
# Write a function that returns true if an array is positive dominant.

# Examples

# isPositiveDominant([1, 1, 1, 1, -3, -4]) ➞ false
# // There is only 1 unique positive value (1).
# // There are 2 unique negative values (-3, -4).

# isPositiveDominant([5, 99, 832, -3, -4]) ➞ true

# isPositiveDominant([5, 0]) ➞ true

# isPositiveDominant([0, -4, -1]) ➞ false

# Notes
# 0 counts as neither a positive nor a negative value.

######################################
#Raul
=begin
Input: Integers
Output: Boolean
Explicit Rules:
0 counts as neither a positive nor a negative value.

Implicit Rules:
Return false if same amount of positive as negatives?

Data Structures
Hash

Algorithm
Initialize a hash with a key for positive and negative with values of 0
Iterate through the array and increase the values with every number, depending on whether they are positive or negative, skip the 0's
if the value for positive is larger than the value for negative return true, otherwise false.
##################################################
Algorithm
Iterate through the input array and select every value that's not a `0`
Iterate through the return array and split it into an array of positives and an array of negatives
If the length of the positive array is larger than the length of the negative array return true, otherwise false
##################################################
Algorithm
Initialize a counter for `pos` and `neg` numbers
iterate through the indices of the array skipping any 0's
if the number is larger than 0 increase `pos` by one, if lower than 0 increase `neg` instead
if `pos` is more than `neg` return true, otherwise return false
=end

def is_positive_dominant?(array)
  hash = {"positive" => 0, "negative" => 0}
  array.uniq.each do|num|
    next if num == 0
    num > 0 ? hash["positive"] += 1 : hash["negative"] += 1
  end
  hash["positive"] > hash["negative"]
end

p is_positive_dominant?([5, 99, 832, -3, -4]) == true
p is_positive_dominant?([5, 0]) == true
p is_positive_dominant?([0, -4, -1]) == false
p is_positive_dominant?([0, -4, -1]) == false
p is_positive_dominant?([1, 2, 3, -1, -2, -3, 0]) == false

puts ""

def is_positive_dominant?(array)
  arr = array.select{ |num| !num.zero? }
  pos, neg = arr.uniq.partition{|num| num > 0}
  pos.length > neg.length
end

p is_positive_dominant?([5, 99, 832, -3, -4]) == true
p is_positive_dominant?([5, 0]) == true
p is_positive_dominant?([0, -4, -1]) == false
p is_positive_dominant?([0, -4, -1]) == false
p is_positive_dominant?([1, 2, 3, -1, -2, -3, 0]) == false

puts ""
def is_positive_dominant?(array)
  array = array.uniq
  pos = 0
  neg = 0
  0.upto(array.length-1) do |idx|
    next if array[idx].zero?
    array[idx] > 0 ? pos += 1 : neg += 1
  end
  pos > neg
end

p is_positive_dominant?([5, 99, 832, -3, -4]) == true
p is_positive_dominant?([5, 0]) == true
p is_positive_dominant?([0, -4, -1]) == false
p is_positive_dominant?([0, -4, -1]) == false
p is_positive_dominant?([1, 2, 3, -1, -2, -3, 0]) == false

puts ""
################################################################################

=begin
PEDAC
Problem
-write a method that returns true if array is positive dominant
-positive dominant means it returns strictly more unique positive values than unique negative values
-what does it mean stricly more? assumption: it means negative and positive values cannot be equal
-0 counts as neither positive nor negative

Examples
is_positive_dominant?([5, 99, 832, -3, -4]) == true
is_positive_dominant?([5, 0]) == true
is_positive_dominant?([0, -4, -1]) == false

Data structures
input: array of integers
output: a boolean, true or false

Algorithm
-get rid of 0
-count negative and positive values, e.g. with absolute?
-if positive values are more return true
-else return false

Code
=end
def is_positive_dominant?(array)
  array = array.uniq
  positive = 0
  negative = 0
  array.delete_if { |element| element == 0 }
  array.each do |number|
    if number.positive?
      positive += 1
    else
      negative += 1
    end
  end
    positive > negative ? true : false
end

p is_positive_dominant?([5, 99, 832, -3, -4]) == true
p is_positive_dominant?([5, 0]) == true
p is_positive_dominant?([0, -4, -1]) == false
p is_positive_dominant?([0, -4, -1]) == false
p is_positive_dominant?([1, 2, 3, -1, -2, -3, 0]) == false

#----ALWAYS CLARIFY with the interviewer whether I'm allowed or to mutate the input OR NOT !!!

puts ""
puts "2nd problem"
#############################################################################
=begin
A set is a data structure that store other values/objects, similar to an array,
the only difference is that in an array you can have duplicates,
a set doesn't accept duplicate values

The other differences, are the built-in methods that are used to interact with set objects
=end


# require 'set'
# array = [1,1,1]
# b = Set[1, 2]
# b.add(5)
# p b
# b.add(5)
# p b

## https://ruby-doc.org/stdlib-2.7.1/libdoc/set/rdoc/Set.html


###############################################################################]
# Write a function to replace all instances of character c1 with character c2 and vice versa.

# Examples
# doubleSwap( "aabbccc", "a", "b") ➞ "bbaaccc"

# doubleSwap("random w#rds writt&n h&r&", "#", "&")
# ➞ "random w&rds writt#n h#r#"

# doubleSwap("128 895 556 788 999", "8", "9")
# ➞ "129 985 556 799 888"
# Notes
# Both characters will show up at least once in the string.

=begin
Ewa
PEDAC
 Problem
 -Write a function to replace all instances of character c1 with character c2 and vice versa.
 -the method takes 2 argument, c1 and c2
 -c1 has to be replaced with c2
 -c2 has to be replaced with c1

 Examples
 doubleSwap( "aabbccc", "a", "b") == "bbaaccc"

 doubleSwap("random w#rds writt&n h&r&", "#", "&")
 == "random w&rds writt#n h#r#"

 doubleSwap("128 895 556 788 999", "8", "9")
 == "129 985 556 799 888"

 Data structures
 input: string of words/characters

 Algorithm
 -define the result str
-convert the string into an array
-look at each character and if it is c1,replace it with c2
-else if it is c2, replace it with c1
-if it is neither, just copy it the way it is in the input string

Code
=end

def double_swap(str, c1, c2)
  new_str = []
  arr = str.split("")
  arr.each do |c|
    if c == c1
      new_str << c2
    elsif c == c2
      new_str << c1
    else
      new_str << c
    end
  end
  new_str.join
end

p double_swap("aabbccc", "a", "b") == "bbaaccc"
p double_swap("random w#rds writt&n h&r&", "#", "&") == "random w&rds writt#n h#r#"
p double_swap("128 895 556 788 999", "8", "9") == "129 985 556 799 888"

puts ""

################################################################################
#Raul
# Write a function to replace all instances of character c1 with character c2 and vice versa.

# Examples
# doubleSwap( "aabbccc", "a", "b") ➞ "bbaaccc"

# doubleSwap("random w#rds writt&n h&r&", "#", "&")
# ➞ "random w&rds writt#n h#r#"

# doubleSwap("128 895 556 788 999", "8", "9")
# ➞ "129 985 556 799 888"
# Notes
# Both characters will show up at least once in the string.

=begin
Input: 3 strings
Output: a string with the characters replaced

Explicit rules:
Both characters show up at least once in the first String


Algorithm
Initialize an empty String
Iterate through the indices in the String
-if c1, push c2 into the new String
-if c2, push c1 into the new String
-otherwise push the char as is
#########
Algorithm
Iterate through the characters of the string to transform them
if the char is equal to c1, swap it for c2 and vice-versa
otherwise leave the char unchanged
join the array and return it
=end

def doubleSwap(str, c1, c2)
  swapped = ''
  0.upto(str.length-1) do |idx|
    if str[idx] == c1
      swapped += c2
    elsif str[idx] == c2
      swapped += c1
    else
      swapped += str[idx]
    end
  end
  swapped
end

p double_swap("aabbccc", "a", "b") == "bbaaccc"
p double_swap("random w#rds writt&n h&r&", "#", "&") == "random w&rds writt#n h#r#"
p double_swap("128 895 556 788 999", "8", "9") == "129 985 556 799 888"

puts ""

def doubleSwap(str, c1, c2)
  str.chars.map do |char|
    if char == c1
      char = c2
    elsif char == c2
      char = c1
    else
      char
    end
  end.join
end

p doubleSwap( "aabbccc", "a", "b") == "bbaaccc"
p doubleSwap("random w#rds writt&n h&r&", "#", "&") == "random w&rds writt#n h#r#"
p doubleSwap("128 895 556 788 999", "8", "9") == "129 985 556 799 888"

puts ""

# slightly refactored
def doubleSwap(str, c1, c2)
  str.chars.map do |char|
    if char == c1
      c2
    elsif char == c2
      c1
    else
      char
    end
  end.join
end

p doubleSwap( "aabbccc", "a", "b") == "bbaaccc"
p doubleSwap("random w#rds writt&n h&r&", "#", "&") == "random w&rds writt#n h#r#"
p doubleSwap("128 895 556 788 999", "8", "9") == "129 985 556 799 888"
