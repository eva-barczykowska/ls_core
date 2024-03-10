puts "gradually slicing array by 1 more element"
arr = [1, 2, 3, 4]
# target = [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4]]

solved = []
0.upto(arr.size - 1) do |index|
  solved << arr[0..index] #take a range
end

p solved
# [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4]]
puts "gradually slicing array by taking 2 elements, the last element from previous array is overlapping"

solved = []
0.upto(arr.size - 1) do |index|
  solved << arr[index, 2] #take a range
end

p solved
[[1, 2], [2, 3], [3, 4], [4]]

puts "COMBINATION"
p arr.combination(2).to_a
# [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]] # not repeated


puts "combination without the combimation method"

arr = [1, 2, 3, 4]
solved = []
(0...arr.size).each do |start|
  (start + 1...arr.size).each do |finish| #starting inner iteration from start + 1
    solved << [arr[start], arr[finish]]
  end
end

p solved
# [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]

puts "REPEATED COMBINATION"
p arr.repeated_combination(2).to_a #combination vs repeated combination
# [[1, 1], [1, 2], [1, 3], [1, 4], [2, 2], [2, 3], [2, 4], [3, 3], [3, 4], [4, 4]] # repeated
#  [1, 1]                          [2, 2]                  [3, 3]          [4, 4] # exra vs combination

#repeated combination without the method
puts "repeated combination without the combimation method"

arr = [1, 2, 3, 4]
solved = []
(0...arr.size).each do |start|
  (start...arr.size).each do |finish| #starting inner iteration from start (first element)
    solved << [arr[start], arr[finish]]
  end
end

p solved
# [[1, 1], [1, 2], [1, 3], [1, 4], [2, 2], [2, 3], [2, 4], [3, 3], [3, 4], [4, 4]]

puts "Difference between combimation and repeated combination, extra arrays are these:"
p arr.repeated_combination(2).to_a - arr.combination(2).to_a 
# [[1, 1], [2, 2], [3, 3], [4, 4]]

puts "PERMUTATION"
p arr.permutation(2).to_a
# [[1, 2], [1, 3], [1, 4], [2, 1], [2, 3], [2, 4], [3, 1], [3, 2], [3, 4], [4, 1], [4, 2], [4, 3]]

puts "permutations without the permutation method - how????"
# first do combinations and then invert the digits in every array and append to `final`
arr = [1, 2, 3, 4]
solved = []
(0...arr.size).each do |start|
  (start + 1...arr.size).each do |finish| #starting inner iteration from start (first element)
    solved << [arr[start], arr[finish]]
  end
end
p "solved is #{solved}"
#  [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
final = solved
p "final is #{final}"
#  [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]  #same at this point
solved.each do |arr|
  first = arr[0]
  last = arr[1]
  arr = [last, first]
  final << arr unless final.include?(arr)
end

p "final is #{final}"
# [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4], [2, 1], [3, 1], [4, 1], [3, 2], [4, 2], [4, 3]]
p arr.permutation(2).to_a.size == final.size

puts "Difference between permutation and combination: extra arrays are these:"
p arr.permutation(2).to_a - arr.combination(2).to_a
# [[2, 1], [3, 1], [3, 2], [4, 1], [4, 2], [4, 3]] #permutation gives you [2, 1] extra in addition to [1, 2]

puts "repeated permutation"
p arr.repeated_permutation(2).to_a
# [[1, 1], [1, 2], [1, 3], [1, 4], [2, 1], [2, 2], [2, 3], [2, 4], [3, 1], [3, 2], [3, 3], [3, 4], [4, 1], [4, 2], [4, 3], [4, 4]]