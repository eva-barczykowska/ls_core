=begin
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

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

