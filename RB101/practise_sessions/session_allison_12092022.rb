=begin
Does My List Include This?
Write a method named include? that takes an Array and a search value as arguments.
This method should return true if the search value is in the array, false if it is not.
You may not use the Array#include? method in your solution.

PEDAC
Problem
-I have an array
-I have a value I need to search in this array
-write a method that takes 2 arguments, an array and a search value
-the method returns true if the search value is present in the array
-the method returns false if the search value is not in the array

Examples
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

Data structures
-input: array, integer/nil
-output: a boolean (true or false)

Algorithm
-I will declare a method with 2 arguments, an array and a search value
-if the input array is empty, I will return false
-I will iterate through the input array
-each time I iterate, I will ask the question if the current element is equal
 to the search value
 -if it is equal, I will stop searching and return true from the method
 -if the search value is not in the array and I finished iterating, I need to return false

 Code
=end

=begin
function demonstrate(inputData, condition) {
  for (let i = 0; i < inputData.length; i++) {
    if (something in the inputData meets a condition) return true;
  }

  return false;
}
=end

def include?(array, search_value)
  return false if array.empty?

  array.each do |element|
    if element == search_value
      return true
    end
  end
  return false
end

# def include?(array, search_value)
#   return false if array.empty?

#   array.each do |element|
#     if element == search_value
#       return true
#     else next # this was in fact redundant because with #each we will look at every element of the array anyway
#     end
#   end
#   return false
# end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

################################################################################

puts ""

=begin
Delete vowels
Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

PEDAC
-write a method that takes an array of strings
-the method returns the same string values but with vowels removed

Examples
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Data structures
input: an array of strings
output: the same string values in the array but with vowels removed

Algorithm
-I want to TRANSFORM these strings into strings without vowels
-iterate through the array of strings to access elements - single strings
-delete vowels from a single string
-return the array of strings but without the vowels

["abcdefghijklmnopqrstuvwxyz"] => ["bcdfghjklmnpqrstvwxyz"]
["green", "YELLOW", "black", "white"] => "green YELLOW black white"
["ABC AEIOU XYZ"] => ['BC', '', 'XYZ']
=end

def remove_vowels(array)
  array.map do |str|
    str.delete("aeouiAEOUI")
  end
end


p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
p remove_vowels(["green", "YELLOW", "black", "white"]) == ["grn", "YLLW", "blck", "wht"]
p remove_vowels(["ABC", "AEIOU", "XYZ"]) == ["BC", "", "XYZ"]

=begin
You have a vague idea of how you want to restructure your input in order to
iterate through each character but you're not sure how to get there.
You need to solve this problem in your algorithm first, and leave the code alone until you've got that situated.
A first step towards this: write out in a comment the form that you want to transform your input to.
=end

puts ""

# ls solution
def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end
p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
p remove_vowels(["green", "YELLOW", "black", "white"]) == ["grn", "YLLW", "blck", "wht"]
p remove_vowels(["ABC", "AEIOU", "XYZ"]) == ["BC", "", "XYZ"]

puts ""
puts "this one"

# further exploration - how about the each_char method?

def remove_vowels(array)
  result = []
  array.map do |str|
    str.chars do |char|
      if char.downcase == "a" || char == "e" || char == "i" || char == "u" || char == "o"
        result << ""
      else
        result << char
      end
    end
  end
  result.join("").split if array.size == 1
  result
end

p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
p remove_vowels(["green", "YELLOW", "black", "white"]) #== ["grn", "YLLW", "blck", "wht"]
p remove_vowels(["ABC", "AEIOU", "XYZ"]) #== ["BC", "", "XYZ"]

puts ""
# other people's solutions
def remove_vowels(array)
  array.map { |elem| elem.gsub(/[aeiouAEIOU]/, '') }
end

p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
p remove_vowels(["green", "YELLOW", "black", "white"]) == ["grn", "YLLW", "blck", "wht"]
p remove_vowels(["ABC", "AEIOU", "XYZ"]) == ["BC", "", "XYZ"]

puts ""
# other solutions

def remove_vowels(array)
  array.map { |elem| elem.gsub(/[aeiouAEIOU]/, '') }
end

p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
p remove_vowels(["green", "YELLOW", "black", "white"]) == ["grn", "YLLW", "blck", "wht"]
p remove_vowels(["ABC", "AEIOU", "XYZ"]) == ["BC", "", "XYZ"]

puts ""

def remove_vowels(arr)
  arr.each do |ele|
    ele.gsub!(/[AEIOUaeiou]/, '')
  end
end

p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
p remove_vowels(["green", "YELLOW", "black", "white"]) == ["grn", "YLLW", "blck", "wht"]
p remove_vowels(["ABC", "AEIOU", "XYZ"]) == ["BC", "", "XYZ"]

puts ""

VOWELS = "aeiouAEIOU" # all of the vowels can form 1 string

def remove_vowels(arr)
  arr.map do |str|
    str.delete(VOWELS) # and then I can delete them in one go, sweet!
  end
end

p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
p remove_vowels(["green", "YELLOW", "black", "white"]) == ["grn", "YLLW", "blck", "wht"]
p remove_vowels(["ABC", "AEIOU", "XYZ"]) == ["BC", "", "XYZ"]

puts ""

def remove_vowels(arr)
  vowels = %(a e i o u A E I O U)
  arr.map { |word| word.delete(vowels) }
end

p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
p remove_vowels(["green", "YELLOW", "black", "white"]) == ["grn", "YLLW", "blck", "wht"]
p remove_vowels(["ABC", "AEIOU", "XYZ"]) == ["BC", "", "XYZ"]

puts ""

def remove_vowels(string_array)
  string_array.map do |string|
    remove_vowels_from_string(string)
  end
end

def remove_vowels_from_string(string)
  result = string.chars.reject {|char| "aeiouAEIOU".include? char }
  result.join
end

p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
p remove_vowels(["green", "YELLOW", "black", "white"]) == ["grn", "YLLW", "blck", "wht"]
p remove_vowels(["ABC", "AEIOU", "XYZ"]) == ["BC", "", "XYZ"]

puts ""


def remove_vowels(str)
  str.map do |word|
    word.gsub(/[aeiou, AEIOU]/,'') # I can add 2 sets of characters in the []
  end
end
