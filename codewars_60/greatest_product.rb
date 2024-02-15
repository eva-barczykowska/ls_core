=begin
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given
string of digits.
CONSECUTIVE IS THE KEY WORD
PEDAC
P:
- write a method that takes a str as an argument
- return the sum of 5 consecutive digits in that string
- str will always have at least 5 digits

E:
For example:
greatestProduct("122323834238239583") // should return 3240
=>
12232 = 72
22323 = 24
23238 = 288
32383 = 432
38342 = 576
83423 = 576
34238 = 576
42382 = 384
23823 = 288
38239 = 1296
82395 = 2160
23958 = 2160
39583 = 3240

=> get arrays of 5 consecutive digits
The input string always has more than five digits.

input: Integer
middle: array
output: integer

A:
- initialize `result` array to []
- initialize `return_array`

- iterate over the str input starting from index 0 until str.size - 5
- slice strings of 5 chars and store them in result `result` array, don't change to integers because you will lose leading 0s

- iterate over the string numbers and if str[0], first character is 0, reverse the str, change to integer and then digits, can multiply as well to get product

- else just change to integer and digits and then multiply (get product)

- return the max product from the `return_array`

- how not to lose the leading digit?
=end

def greatest_product(str)
  result = []
  return_array = []

  (0...str.size - 4).each do |starting_index|
    result << str.slice(starting_index, 5)
  end

  result.each do |s|
    if s[0] == "0"
      return_array << s.reverse.to_i.digits.inject(:*)
    else
      return_array << s.to_i.digits.inject(:*)
    end
  end

  return_array.max
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

puts

#Felicia Bacon
def create_subdigits(string)
  result = []
  start_index = 0
  loop do
    result << string.slice(start_index, 5)
    start_index += 1
    break if start_index > (string.size - 5)
  end
  result.select { |sub| sub.size == 5 }
end

def greatest_product(n)
  n = create_subdigits(n)
  n.map! { |sub| sub.chars.map { |n| n.to_i } }
  n.map { |sub| sub.inject(:*) }.max
end
p greatest_product("123834539327238239583") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

puts

=begin
[Train: Largest product in a series \| Codewars](https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby)
6 kyu
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

NOTES:
 "123834539327238239583".chars.each_cons(5).to_a.map(&:join) *********
P:
- method takes an str of digits as an argument
- method calculates sum of each of those slices of 5
- method returns the greatest PRODUCT

p greatest_product("123834539327238239583") == 3240

p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

N:
"123834539327238239583".chars.each_cons(5).to_a.map(&:join).map{ |s| s.to_i.digits.inject(:*) }
A:
- iterate over the str and prepare substrings
- iterate from index 0 to the str size minus one - starting index
- iterate from starting_index to the str size minus one - starting index
-Uy solved this this time, my try is below

=end
def greatest_product(str)
  res = str.chars.each_cons(5).to_a

  res.map do |array|
    if array.first.to_i == 0
      0
    else
      array.map(&:to_i).inject(:*)
    end
  end.max

end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

puts
=begin
P:
  - method takes an str of digits as an argument
- method calculates sum of each of those slices of 5
- method returns the greatest PRODUCT
- analyze examples!!!

p greatest_product("123834539327238239583") == 3240

p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

N:
- digits/each number, number.to_i
# THIS IS NOT A NESTED ITERATION
INCORRECT ALGORITHM
A:
 - iterate over the str and prepare substrings of 5 characters/digits
 - iterate from index 0 to the str size minus 5 - starting index
- iterate from starting_index + 5 to the str size minus 1 - starting index
- in `substrings` array capture the substrings using str elem reference and range
- so the last number in my array is "09999" for the 3rd testcase

- now i have substrings which are string objects # THIS IS NOT A NESTED ITERATION
- tranform this array of strings, into a nested array - every str has to become an array of digits
- iterate over this array of digits and make a product out of all its elements
- but if the first element is 0, product has to be zero
- you end up with an array of products

CORRECT ALGORITHM
- iterate over the string and slice 5 chars at the time starting from char at index 0, index 1, etc. until index -5
- you have an array of substrings but they're String objects
- transform them to arrays of digits

-once you have array of arrays of digits, transform this array into array of products
- return the max product
=end
def greatest_product(number_str)
  substrings = []
   (0..number_str.size - 5).each do |starting_index|
      substrings << number_str.slice(starting_index, 5)
    end

  products = []
  substrings.each do |s|
    array_of_digits = s.chars.map(&:to_i)
    products << array_of_digits
  end

  products.map { |p| p.inject(:*) }.max
end
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

puts
# refactor
def greatest_product(number_str)
  substrings = []
  (0..number_str.size - 5).each do |starting_index|
    substrings << number_str.slice(starting_index, 5)
  end

  substrings.map { |s| s.chars.map(&:to_i) }.map { |p| p.inject(:*) }.max
end
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

puts
# refactor
def greatest_product(number_str)
  substrings = []
  (0..number_str.size - 5).each do |starting_index|
    substrings << number_str.slice(starting_index, 5)
  end

  substrings.map { |s| s.chars.map(&:to_i) }.map { |p| p.inject(:*) }.max
end
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

# refactor
def greatest_product(number_str)
  substrings = []
  (0..number_str.size - 5).each do |starting_index|
    substrings << number_str.slice(starting_index, 5)
  end

  substrings.map { |s| s.chars.map(&:to_i) }.map { |p| p.inject(:*) }.max
end
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

puts
# refactor
def greatest_product(number_str)
  substrings = number_str.chars.each_cons(5).to_a

  substrings.map { |s| s.map(&:to_i) }.map { |p| p.inject(:*) }.max
end
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

puts
# refactor
def greatest_product(number_str)
  number_str.chars.each_cons(5).to_a.map { |s| s.map(&:to_i) }.map { |p| p.inject(:*) }.max
end
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

puts
# solutions from codewars
def greatest_product(n)
  n.chars.each_cons(5).map { |a| a.map(&:to_i).reduce(:*) }.max
end
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

puts
# with a loop
def create_subdigits(string)
  result = []
  start_index = 0
  loop do
    result << string.slice(start_index, 5)
    start_index += 1
    break if start_index > (string.size - 5)
  end

  result.select { |sub| sub.size == 5 }
end#
p create_subdigits("92494737828244222221111111532909999")

def greatest_product(n)
  n = create_subdigits(n)
  n.map! { |sub| sub.chars.map { |n| n.to_i } }
  n.map { |sub| sub.inject(:*) }.max
end
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
