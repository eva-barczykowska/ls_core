# a = [1, 2, 3, 4]
#
# nested_array = ['a', 'b', 'c', a]
# # concept: variables as pointers, pass by reference
# # within an array, index positions are similar to variables, indexes are pointers to objects in memory
#
# #b = a # at this point arrays a and b are aliases, they point to the same objects
#
# p a
# #p b
# p nested_array
#
# puts ""
#
# a = 'bob'
# p a
# # #p b
# p nested_array
#
# puts ""
# a.push(9) # how this change is different than change on line 15?
# p a
# p nested_array

####################################################################
# def a_method(string)
#   string << ' world'
# end
#
# a = 'hello'
# a_method(a)
#
# p a

################################################################
# def add_name(arr, name)
#   arr = arr + [name]
# end
#
# names = ['bob', 'kim']
#
# p add_name(names, 'jim')
#
# p names

# def add_name(arr, name)
#   arr[arr.length] = name #indexed assignment
#   arr
# end
#
# names = ['bob', 'kim']
#
# p add_name(names, 'jim')
#
# p names

##############################################################
# arrya = [1, 2, 3, 4, 5]
#
# arryb = arrya.select do |num|
#    puts num if num.odd?
# end
#
# # output:
# # 1
# # 3
# # 5
#
# p arryb # []

###########################################################
# arrya = [1, 2, 3, 4, 5]
#
# arryb = arrya.map do |num|
#    puts num if num.odd?
# end

# # output:
# # 1
# # 3
# # 5

# what will it return?

# map takes the r.v. of the block at each iteration and then passes it to
# the new, transformed array that is going to be returned. The transformation
# happens according to the value of the block. The transformed array always has
# the same number of elements as the original array.

#########################################################
#
# array = [1, [2, 3], { a: 'bob', b: 'Suzy' }]
# puts "=original="
# p array
# puts "array object_id"
# p array.object_id
# arryb = array.map do |num|
#   num
# end
#
# puts ""
#
# puts "=after map="
# p arryb
# puts "arryb object_id"
# p arryb.object_id
#
# puts ""
#
# puts "=after indexed assignment both arrays change="
# arryb[2][:a] = 'Raul'
# p array
# p array.object_id
# p arryb
# p arryb.object_id
#
# puts ""
# puts "=after reassignment of the first element="
# arryb[0] = 'Raul'
#
# # Raul
# p array #  [1, [2, 3], {a: 'bob', b: 'Suzy'}]
# p array.object_id
# p arryb # [1, [2, 3], {a: 'Raul', b: 'Suzy'}]
# p arryb.object_id
#
#
# puts ""
# Ewa
# p arryb # [1, [2, 3], {a: 'Raul', b: 'Suzy'}]
# p array #  [1, [2, 3], {a: 'Raul', b: 'Suzy'}]
#the hash is a shared element so a change in 1 array will reflect in the other

#############################################################
#
# array = [1, [2, 3], {a: 'bob', b: 'Suzy'}]
#
# arryb = array.map do |num|
#    num
# end
#
# # p arryb # [1, [2, 3], {a: 'bob', b: 'Suzy'}]
#
# arryb[2][:a] = 'Raul' #mutates the element
# arryb[0] = 'Raul' #mutates the array
#
# # Raul
# p arryb # ['Raul', [2, 3], {a: 'Raul', b: 'Suzy'}]
# p array #  [1, [2, 3], {a: 'Raul', b: 'Suzy'}]
#
# # Ewa
# p arryb # [Raul, [2, 3], {a: 'Raul', b: 'Suzy'}]
# p array #  [Raul, [2, 3], {a: 'Raul', b: 'Suzy'}]
# # mutation at element or an array vs mutation of array itself
# # we are mutating the array, not the element
#
# arryb.push(99)
#
# p arryb #  #  [1, [2, 3], {a: 'Raul', b: 'Suzy'}]
# p array # ['Raul', [2, 3], {a: 'Raul', b: 'Suzy'}, 99]

###########################################################

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# p arr
#
# new_array = arr.select do |n|
#   n + 1
# end
#
# p new_array

############################################################
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# new_array = arr.select do |n|
#   n + 1
#   puts n
# end
#
# p new_array

##############################################################

# words = %w(jump trip laugh run talk)
#
# new_array = words.map do |word|
#   word.start_with?("t")
# end
#
# p new_array

#############################################################
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# p arr
# arr_b = arr.each { |n| n }
# p arr_b
#
# puts ""
# arr_b.pop # mutates both arrays!!!
#
# # Ewa
# p arr
# p arr_b
#############################################################

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# new_array = arr.map do |n|
#   n > 1
# end
#
# p new_array

########################################################

# Ewa
# Problem
# -We get a string. We need to establish if it is a panagram or not.
# -What is a panagram?
# -A panagram is a sentence/string that contains every letter of the alphabet at least
# once
#
# Examples
# p panagram?("The quick brown fox jumps over the lazy dog.") == true
# p panagram?("This is not a pangram.") == false
#
# Data Structures
# -input: String
# -output: true or false (a boolean)
#
# Algorithm
# -define the alphabet variable
# -write a method that takes 1 argument - the string
# -downcase the string
# -split the string into an array
# -iterate over the array and ask if it contains every letter of the alphabet
# -so basically for every letter in the alphabet ask - is it in the array?
# -if you encounter a letter that is not in the target string passed as an
# argument, you can return false from the method
# -if all letters are there, return true

# Code
# def panagram?(str)
#   result = []
#   alphabet = 'abcdefghijklmnopqrstuvwxyz'
#   alphabet = alphabet.chars
#   str = str.downcase.chars
#   alphabet.each do |letter|
#     if str.include?(letter)
#       result << true
#     else
#       result << false
#     end
#   end
#   result.all?(true)
# end
#
# p panagram?("The quick brown fox jumps over the lazy dog.") == true
# p panagram?("This is not a pangram.") == false

#####################################
# Raul

=begin
Problem
A pangram is a sentence that contains every single letter of the alphabet at least once. For example,
the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

explicit requirements:
input: string
output: boolean

Examples/Test cases
p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

Data Structures
a boolean value would be returned

Algorithm
- define a method called 'panagram' that takes a string as a parameter
- initialize an alphabet variable within the method to an array containing every letter on the alphabet
- reassign string to its value downcased
- utilize the chars method to turn the input string into an array containing the letters on the string
"This is not a pangram." => [T, h, i, s, , i, s, , n, o, t, , a, , p, a, n, g, r, a, m]
- iterate through the alphabet array to check if every letter of the alphabet is included in the input string
- if all the letters are included return 'true' else return 'false'
=end

# def panagram?(str)
#   alphabet = ('a'..'z').to_a
#   str = str.downcase.chars
#
#   result = alphabet.map do |letter|
#     str.include?(letter)
#   end
#
#   result.none?(false) #result.all?(true)
# end
#
# p panagram?("The quick brown fox jumps over the lazy dog.") == true
# p panagram?("This is not a pangram.") == false

#################################################################
# write a kebabize function so that it converts a camel case string into a kebab case.

# kebabize('camelsHaveThreeHumps') // camels-have-three-humps
# kebabize('camelsHave3Humps')    // camels-have-humps
# Notes:

# the returned string should only contain lowercase letters

# p kebabize('myCamelCasedString') == 'my-camel-cased-string'
# p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

########################################################################
# Ewa
# PEDAC
#
# Problem
# -modify the given method
# -the method is supposed to convert camel case into kebab case
# -what is kebab case?
# -kebab case is when the words have to be separated with dashes
# -all characters are lowercase
#-non-alphabet characters are removed
# Examples
# # kebabize('camelsHaveThreeHumps') // camels-have-three-humps
# # kebabize('camelsHave3Humps')    // camels-have-humps
# Data Structures
# -input: string
# -output: string (Is this a string?)
# Algorithm
# get rid of any integers --- how?
# -define a method that takes 1 parameter - the string to check
# -check where are capital letters
# -prepend those capital letters with a dash
# -downcase the string
# -return the new string
#-ask a question, should a new string be returned? Or same string but modified?
# Code
# def kebabize(str)
#   str = str.gsub(/[^A-Za-z]/, '')
#   result = []
#   str = str.chars
#   str.each do |char|
#     if char == char.upcase
#       result << "-"
#       result << char.downcase
#     else
#       result << char
#     end
#   end
#
#   result.join
# end
#
# p kebabize('camelsHaveThreeHumps') == 'camels-have-three-humps'
# p kebabize('camelsHave3Humps') == 'camels-have-humps'

##################################################
# Raul
=begin
Problem
- Modify the kebabize method so it converts a 'CamelCase' string into a 'kebab-case' string
- The string returned should only contain lowercase letters and dashes

input: CamelCase string
output: kebab-case string

Example/Data Cases
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

Data Structures
- identify 'words' as substrings, ignore anything that's not a word or letter
- separate substrings with dashes
- A 'kebabized' string should be returned

Algorithm
- define a method called kebabize that takes a string as a parameter
- initialize a kebabized_string variable
- use the split method to split the input string into separate substrings with dashes
 (what should i use as an argument?/how do i define what a word is?)
- return the kebabized string
=end

# def kebabize(str)
#   kebabized_string = ''
#   str = str.chars
#   alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
#
#   str.each do |element|
#     if !alphabet.include?(element)
#       next
#     elsif element == element.upcase
#       kebabized_string << ('-' + element.downcase)
#     else element == element.downcase
#       kebabized_string << element
#     end
#   end
#
#   kebabized_string
# end
#
# p kebabize('myCamelCasedString') == 'my-camel-cased-string'
# p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
