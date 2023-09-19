=begin
# Write a function that converts an object into an array, where each element represents a key-value pair in the form of an array.
P:
- write a method that takes a hash as an arg
- the method converts each key-value pair into a separate array

A:
- if it's an empty hash, return an empty array

- initialize an empty result array

- iterate over the hash
- as I iterate, I'll take each key and value, and append them into my result array
=end
def to_array(hash)
  return [] if hash.empty?

  result = []

  hash.each do |key, value|
    result << [key.to_s, value]
  end

  result
end

p to_array({ a: 1, b: 2 }) == [["a", 1], ["b", 2]]
p to_array({ shrimp: 15, tots: 12 }) == [["shrimp", 15], ["tots", 12]]
p to_array({}) == []