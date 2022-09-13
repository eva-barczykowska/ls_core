=begin
You probably know the "like" system from Facebook and other pages.
People can "like" blog posts, pictures or other items.
We want to create the text that should be displayed next to such an item.

Implement the function which takes an array containing the names of people that like an item.
It must return the display text as shown in the examples:

[]                                -->  "no one likes this"
["Peter"]                         -->  "Peter likes this"
["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"

Note: For 4 or more names, the number in "and 2 others" simply increases.

PEDAC
-implement a method
-the method takes an array as an argument, this array contains names of people that like an item
-the method returns the text to be displayed, like in the examples

Examples
[]                                -->  "no one likes this"
["Peter"]                         -->  "Peter likes this"
["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"

Data structures
input: array
output: string

Algorighm
-define the method with 1 parameter, the parameter is an array
-if the array is empty, return text "no one likes this"
-elsif the array contains 1 element, return the text "#{array[0]} likes this"
-elsif the array contains 2 elements, return the text "#{array[0]} and #{array[1]} like this"
-elsif the array contains 3 elements, return the text "#{array[0]}, #{array[1]} and #{array[2]} like this"
-else the array contains more than 3 elements, return the text "#{array[0]}, #{array[1]} and #{array.length - 2} others like this"

Code
=end

def get_likes(array)
  if array.empty?
    return "no one likes this"
  elsif array.size == 1
    return "#{array[0]} likes this"
  elsif array.size == 2
    return "#{array[0]} and #{array[1]} like this"
  elsif array.size == 3
    return "#{array[0]}, #{array[1]} and #{array[2]} like this"
  else
    return "#{array[0]}, #{array[1]} and #{array.length - 2} others like this"
  end
end

p get_likes([]) == "no one likes this"
p get_likes(["Peter"]) == "Peter likes this"
p get_likes(["Jacob", "Alex"]) == "Jacob and Alex like this"
p get_likes(["Max", "John", "Mark"]) == "Max, John and Mark like this"
p get_likes(["Alex", "Jacob", "Mark", "Max"]) == "Alex, Jacob and 2 others like this"
p get_likes(["Alex", "Jacob", "Mark", "Max", "Med", "Raul", "Ewa"]) == "Alex, Jacob and 5 others like this"
#

#*****************************************************
#Raul
=begin
**Problem
Write a method that takes an array as an argument and returns a string specifying the amount of people who like an item.
-if 4 or more people just increase "and 2 others"

**Examples/Test Cases
# []                                -->  "no one likes this"
# ["Peter"]                         -->  "Peter likes this"
# ["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
# ["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
# ["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"
# Note: For 4 or more names, the number in "and 2 others" simply increases.

**Data Structures
Input: Array
Output: String

[] = > "no one likes this"
[a, b, c, d, e, f] => "A, B, and 4 other like this"

**Algorithm
Initialize a `length` variable and store the length of the input array on it
Start a case statement for `length`
-when 0 then "no one likes this"
-When 1 "name likes this"
-when 2 "name and name like this"
-when 3 "name, name and name like this"
-when 4 to infinity "name, name and n others like this"

**Code
=end

def likes(array)
  length = array.size
  case length
  when 0 then "no one likes this"
  when 1 then "#{array[0]} likes this"
  when 2 then "#{array[0]} and #{array[1]} like this"
  when 3 then "#{array[0]}, #{array[1]} and #{array[2]} like this"
  when (4..) then "#{array[0]}, #{array[1]} and #{length-2} others like this"
  end
end

p likes([])
p likes(["Peter"])
p likes(["Jacob", "Alex"]  )
p likes(["Max", "John", "Mark"] )
p likes(["Alex", "Jacob", "Mark", "Max"])
p likes(["Alex", "Jacob", "Mark", "Max", "a", "b", "c", "d", "f"])

puts ""
######################################
=begin
Problem 2
https://www.codewars.com/kata/5526fc09a1bbd946250002dc

You are given an array (which will have a length of at least 3, but could be very large)
containing integers.
The array is either entirely comprised of odd integers or entirely comprised of
even integers except for a single integer N.
Write a method that takes the array as an argument and returns this "outlier" N.

[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

PEDAC
Problem
-write a method that takes 1 argument
-the argument is an array of integers, of size at least 3 but could be very large
-this array will be entirely even or entirely odd numbers EXCEPT 1 integer n - this is the outlier
-find and return the outlier

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

Data Structures
input: array of integers
output: 1 integer

Algorithm
-declare a method with 1 argument, an array
-take 3 elements from the array and check if they are all odd or even
-how will I check this? take 3 elements and ask if they are all even or all odd
-if they are all even,  it means the array contains even elements and I need to look for an odd outlier
-if they are not all even, it means it is an array of odd elements and I need to look for an even outlier
-find first odd or find first even number and return it

[2, 4, 0] - all are even? yes, it means it's an array of even elements and I have to look for an odd element
[160, 3, 1719] - all are even? no, it means it's an array of odd elements and I need to look for an even element

Code
=end

puts ""
def get_outlier(array)
  if array.take(3).all? { |n| n.even? }
    array.find { |n| n.odd? }
  else
    array.find { |n| n.even? }
  end
end
p get_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p get_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
p get_outlier([2, 4, 11]) == 11
p get_outlier([1, 3, 4]) == 4 # 1
p get_outlier([1, 4, 6]) == 1 # 4

puts ""
# if 1st even, 2nd even, 3rd even - even, find odd
# if 1st even, 2nd even, 3rd odd - even, find odd
# if 1st even, 2nd odd, 3rd odd - odd, find even
# if 1st odd, 2nd odd, 3rd odd - odd, find even
#
# if 1st odd, 2nd odd, 3rd odd - odd, look for even
# if 1st odd, 2nd odd, 3rd even, - odd, look for even
# if 1st odd, 2nd even, 3rd even, - even, look for odd
# if 1st even, 2nd even, 3rd even - even, look for odd


puts "this one"

def get_outlier(arr)
  if arr.take(3).all? { |n| n.even? }
    arr.find { |n| n.odd? }
  elsif arr[0].even? && arr[1].even? && arr[2].odd?
    arr.find { |n| n.odd? }
  elsif arr[0].even? && arr[1].odd? && arr[2].odd?
    arr.find { |n| n.even? }
  elsif arr.take(3).all? { |n| n.odd? }
    arr.find { |n| n.even? }
  elsif arr[0].odd? && arr[1].odd? && arr[2].even?
    arr.find { |n| n.even? }
  else arr[0].odd? && arr[1].even? && arr[2].even?
    arr.find { |n| n.odd? }
  end
end
p get_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p get_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
p get_outlier([2, 4, 11]) == 11
p get_outlier([1, 3, 4]) == 4 # 1
p get_outlier([1, 4, 6]) == 1 # 4

puts ""

def get_outlier(array)
 array = array.partition { |n| n.even? } # this will give me 2 arrays inside an array
   if array[0].size == 1
    return array[0].first #or use sort
   else
    return array[1].first
   end
end

p get_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p get_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
p get_outlier([2, 4, 11]) == 11
p get_outlier([1, 3, 4]) == 4
p get_outlier([1, 4, 6]) == 1 # 4

puts ""

def get_outlier(array)
 array = array.partition { |n| n.even? } # this will give me 2 arrays inside an array
 array.sort_by(&:size).first.first
end

p get_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p get_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
p get_outlier([2, 4, 11]) == 11
p get_outlier([1, 3, 4]) == 4
p get_outlier([1, 4, 6]) == 1 # 4

puts ""
###################################################################

# Raul
=begin
**Problem
Write a method that takes an array as an argument and returns an integer
- The array will contain exclusively odd OR even numbers, except for one "outlier" number
- The method should identify and return this outlier number
- Array will contain at least 3 elements

**Examples/Test Cases
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

**Data structures
Input: Array
Output: Integer

[1, 3, 5, 7, 8, 9] => 8
[2, 4, 6, 7, 8, 10]=> 7

**Algorithm
Count how many even integers are in the array and store it in a `count` variable
-if 1 then find it and return it
-otherwise find the odd number an return it
**Code
=end

def find_outlier(array)
  even_count = array.count{|n| n.even?}
  if even_count == 1
    array.select{|n| n.even?}.pop
  else
    array.select{|n| n.odd? }.pop
  end
end

# [2, 4, 0, 100, 4, 11, 2602, 36].select { |n| n.odd? } gives me [11] in case of first array
# [2, 4, 0, 100, 4, 11, 2602, 36].select { |n| n.odd? }.pop gives me 11

p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
p find_outlier([1, 3, 5, 7, 8, 9]) == 8
p find_outlier([2, 4, 6, 7, 8, 10]) == 7

puts ""

# tried a different solution using partition

def find_outlier(array)
  even, odd = array.partition { |n| n.even? } #assigning 2 arrays to 2 variables
  if even.size == 1
    even.pop
  else
    odd.pop
  end
end

p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
p find_outlier([1, 3, 5, 7, 8, 9]) == 8
p find_outlier([2, 4, 6, 7, 8, 10]) == 7
