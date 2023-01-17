# https://github.com/eva-barczykowska
=begin
Given the following data structure and without modifying the original array,
use the map method to return a new array,
identical in structure to the original but where the value of each integer is
incremented by 1.

The return value from map should be the following array:
[{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

given an array of hashes  > new array of hashes
  but each value is incremented by one
A: given an array of hashes
iterate over array using map # {d: 4, e: 5, f: 6}
  iterate over subarray# key, value
increment value by one
=end

array_of_hashes = [{ a: 1 }, { b: 2, c: 3 }, { d: 4, e: 5, f: 6 }]
puts "original"
p array_of_hashes

array_of_hashes.map do |hash|
  hash.each do |key, value|
    hash[key] = value + 1
  end
end

p array_of_hashes
