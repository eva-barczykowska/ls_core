=begin
Create a function that takes an array as an argument and returns a new nested array
for each element in the original array.

The nested array must be filled with the corresponding element (string or number) in the original array
and each nested array has the same amount of elements as the original array.
E:
A:
- initialize size to the size of the input array

- create arrays:
- initialize an empty result array
- iterate over the input array
- add an array of characters equal to the current character and the size of this array will be equal to the size of the input array

- when the iteration is finished and we went through all elements of the array, return the result array
=end
def multiply(arr)
  size = arr.size

  result = []

  arr.each do |element|
    result << [element] * size # result << [element * size]
  end

  result
end
p multiply([4, 5]) == [[4, 4], [5, 5]]

p multiply(["*", "%", "$"]) == [["*", "*", "*"], ["%", "%", "%"], ["$", "$", "$"]]

p multiply(["A", "B", "C", "D", "E"]) == [["A", "A", "A", "A", "A"], ["B", "B", "B", "B", "B"], ["C", "C", "C", "C", "C"], ["D", "D", "D", "D", "D"], ["E", "E", "E", "E", "E"]]

puts
# refactor

def multiply(arr)
  result = []

  arr.each do |element|
    result << [element] * arr.size
  end

  result
end

p multiply([4, 5]) == [[4, 4], [5, 5]]
p multiply(["*", "%", "$"]) == [["*", "*", "*"], ["%", "%", "%"], ["$", "$", "$"]]
p multiply(["A", "B", "C", "D", "E"]) == [["A", "A", "A", "A", "A"], ["B", "B", "B", "B", "B"], ["C", "C", "C", "C", "C"], ["D", "D", "D", "D", "D"], ["E", "E", "E", "E", "E"]]

puts
# refactor again

def multiply(arr)
  result = []
  arr.each { |element| result << [element] * arr.size }
  result
end

p multiply([4, 5]) == [[4, 4], [5, 5]]
p multiply(["*", "%", "$"]) == [["*", "*", "*"], ["%", "%", "%"], ["$", "$", "$"]]
p multiply(["A", "B", "C", "D", "E"]) == [["A", "A", "A", "A", "A"], ["B", "B", "B", "B", "B"], ["C", "C", "C", "C", "C"], ["D", "D", "D", "D", "D"], ["E", "E", "E", "E", "E"]]

puts "refactor yet again"
# refactor yet again:-)

def multiply(arr)
  arr.each_with_object([]) { |element, result| result << [element] * arr.size }
end

p multiply([4, 5]) == [[4, 4], [5, 5]]
p multiply(["*", "%", "$"]) == [["*", "*", "*"], ["%", "%", "%"], ["$", "$", "$"]]
p multiply(["A", "B", "C", "D", "E"]) == [["A", "A", "A", "A", "A"], ["B", "B", "B", "B", "B"], ["C", "C", "C", "C", "C"], ["D", "D", "D", "D", "D"], ["E", "E", "E", "E", "E"]]