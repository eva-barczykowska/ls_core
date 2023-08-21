# Define a function that removes duplicates from an array of non negative numbers and returns the array
# without duplicates as a result.
#
#   The order of the sequence has to stay the same.
#
#     Examples:
# Input -> Output
# [1, 1, 2] -> [1, 2]
# [1, 2, 1, 1, 3, 2] -> [1, 2, 3]
def distinct(seq)
  seq & seq.uniq
end

p distinct([1]) == [1]
p distinct([1, 2]) == [1, 2]
p distinct([1, 1, 2]) == [1, 2]
p distinct([1, 1, 1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
p distinct([1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7]) == [1, 2, 3, 4, 5, 6, 7]

puts
#refactor
def distinct(seq)
  seq & seq.uniq
end

p distinct([1]) == [1]
p distinct([1, 2]) == [1, 2]
p distinct([1, 1, 2]) == [1, 2]
p distinct([1, 1, 1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
p distinct([1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7]) == [1, 2, 3, 4, 5, 6, 7]