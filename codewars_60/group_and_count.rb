=begin
Your goal is to write the group_and_count method, which should receive and array as unique parameter and return a hash.
Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of
the array, and as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:

Array#count
Array#length

PEDAC
P:
- write the method that takes 1 argument, an array
- method return hash
- empty or nil input returns nil
- hash must contain as keys unique values from the array argument
- and as values, it contains the count of each value
- cannot use #count or #length methods

E:
p group_and_count(input)# == {1=>2, 2=>3, 3=>1}

DS:
input: array
output: hash

A:
- initiaze empty {}
- if array is empty or nil, return nil
- iterate over the array of numbers
- if num is already as key in the hash, add 1 to value
- if not, make a key with that number and set the value as 1
- return the hash
=end
def group_and_count(arr)
  h = {}

  arr.each do |num|
    if !h.keys.include?(num)
      h[num] = 1
    else
      h[num] += 1
    end
  end
  h
end
p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}

#refactor
def group_and_count(arr)
  return nil if arr.empty? || arr.nil?
  arr.each_with_object({}) { |num, h| !h.keys.include?(num) ? h[num] = 1 : h[num] += 1 }
end
p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}

def group_and_count(arr)
  return nil if arr.nil? || arr.empty? #first ask if arr is nil, because if it is, you'll get an error
  arr.each_with_object({}) { |num, h| !h.keys.include?(num) ? h[num] = 1 : h[num] += 1 }
end
