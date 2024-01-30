=begin
6 kyu
Write a function with the signature shown below:

def is_int_array(arr)
  true
end
returns true / True if every element in an array is an integer or a float with no decimals.
returns true / True if array is empty.
returns false / False for every other input.
PEDAC
P:
- write a method that takes an arr as an arg
- method returns true if every element in an array is an integer or a float with no decimals
- returns true if array is empty
- returns false for every other input


def method()
  result = false
    # if array elements are integers, change result to true
  result
end




E:
is_int_array([1, 2, 3, 4]) == true
=> coz all elements are integers

p is_int_array([-11, -12, -13, -14]) == true
=> coz all elements are integers

p is_int_array([1.0, 2.0, 3.0]) == true
=> coz all elements are floats with no decimal -- how to check for decimals?

p is_int_array([1, 2, nil]) == false
=> one element is NOT AN INTEGER OR FLOAT

p is_int_array(nil) == false
=> nil input

p is_int_array("") == false
=> empty str input

p is_int_array([nil]) == false
=> [nil]

DS:
input: array, nil, empty array, array of floats, array of mixed elements, str,
output: true/false

N:
1.0.to_s.chars.last.to_i.zero?
- size of this array must be 3

A:
- return false inf input is not an array

- if input is array but it's empty or nil, return false
- if all elements are integers, return true
- else if there are floats, check if the float has no decimal number
- if no floats have decimail numbers, return true

  - write a helper method
  - convert float to str, to arr, check if the array is of size 3, if not, return false
  - if yes, take the last element, convert it to int and ask if it's a zero?
  - if yes, return true


Feedback:
- focus/think about what is the real essence of the problem
- what is the HYPOTHESIS? Add after Problem
- describe conceptually if this would work, check in irb

# A:
- initialize `result`
- iterate through this array
- if element is an integer, add `true` to the `result` array
- if element is a float, check if it's a float with no decimals and if so, add true to the array
- else add false to the array

- so all elements of the array have to be integers or floats with no decimal number

=end

def is_int_array(input)
  return true if input == []

  return false if input.nil? || input == "" || input.is_a?(String) || input.is_a?(TrueClass) || input.is_a?(FalseClass)
  return false if (input.is_a?(Integer) || input.is_a?(Float))
  return true if input.empty?


  input.all? { |elem| elem == elem.to_i }
end
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false
p is_int_array([1.2, 1.8, 3] ) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([]) == true

puts

def is_int_array(arr)
  return false unless arr.is_a? Array

  arr.all? do |num|
    num.to_i == num
  end
end
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false
p is_int_array([1.2, 1.8, 3] ) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([]) == true

puts

def is_int_array(arr)
  arr.is_a?(Array) && arr.all? { |x| x.to_i == x }
end
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false
p is_int_array([1.2, 1.8, 3]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([]) == true