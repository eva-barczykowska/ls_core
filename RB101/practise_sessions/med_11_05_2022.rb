# Assessment RB109 will test your knowledge of courses LS100 and RB101,
# which has a huge surface area in that it covers the Ruby programming language
# broadly. It will not cover Object Oriented Programming.

# Specific Topics of Interest
# You should be able to clearly explain the following topics:

# local variable scope, especially how local variables interact with
# method invocations with blocks and method definitions
# mutating vs non-mutating methods, pass-by-reference vs pass-by-value
# working with collections (Array, Hash, String), and popular
# collection methods (each, map, select, etc). Review the two lessons on these
# topics thoroughly.
# variables as pointers
# puts vs return
# false vs nil and the idea of "truthiness"
# method definition and method invocation
# implicit return value of method invocations and blocks
# how the Array#sort method works

###########################################################

# a = 'bob'

# if 0 > 10
#   b = a
# end

# puts a # 'bob'
# p b    # 'nil'

###########################################################

# a = 'Hello'
# b = a
# a = 'Goodbye'
# puts a # 'Goodbye'
# puts b # 'Hello'

##########################################################

# a = 4

# loop do
#   a = 5
#   b = 3
#   break
# end

# puts a # 5
# puts b # error

########################################################

# a = 1

# def some_method(arg)
#   # method scope
#   loop do                                      ##  block scope from line 53-57
#     arg = 5 #method scoped local variable       ##
#     b = 3                                       ##
#     break                                       ##
#   end                                           ##

#   puts arg, b
# end

# some_method(a) #

# puts a         #

#######################################################

# a = 4
# b = 2

# loop do
#   c = 3
#   a = c
#   break
# end

# puts a #
# puts b #

#######################################################

# In this kata, you've to count lowercase letters in a given string and return
# the letter count in a hash with'letter' as key and count as 'value'.
# The key must be 'symbol' instead of string.

#Problem
# Input is a string.
# Output is a hash.
# # Understanding of the problem
#   The goal is to count lowercase letters.
#   I need to return the letter count - letter as key and count as value.
#   But in the hash, the key has to be a symbol instead of a string.
# ANALIZE TEST CASES!
# Letters are counted alphabetically so first a, then b, then c, etc.

# Algorithm
# -define the result hash
# -split the string into an array
# -iterate over the array and if a letter does not exist in the hash, add it as a key and push 1 as the value
# -if the letter exists as a key, then just increment the value

# -mutate the hash, change the keys which are strings, into symbols

def letter_count(str)
  result = {}
  str = str.chars
  str.each do |letter|
    if result[letter.to_sym]
      result[letter.to_sym] += 1
    else
      result[letter.to_sym] = 1
    end
  end

  result
  # result.map do |k, v|
  #   [k.to_sym, v]           #but this will give me an array
  # end.to_h                  #this is interesting!
end

# test cases
p letter_count('arithmetics')  == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars')    == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity')    == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
