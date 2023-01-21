arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
  y.to_i <=> x.to_i
end

# Precedence problem, remove the p to get correct output
# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
#
# this is because if we have the code like that,
# Ruby sees it like this
# i.e. the block is not visible, only .sort is visible to p
# (.sort gets bound to p)
#
arr = ["9", "8", "7", "10", "11"]
p (arr.sort) do |x, y|
  y.to_i <=> x.to_i
end

# "10" => 49 (.ord)
# "11" => 49
# "7" => 55
# "8" => 56
# "9" => 57
#
# we can also wrap the whole expression that has to be passed to p
# in brackets

arr = ["9", "8", "7", "10", "11"]
p (arr.sort do |x, y|
  y.to_i <=> x.to_i
end)

# also we can fix it using the {}, which has higher precedence

arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i}

# also another example from the course

p(array.map) do |num|
  num + 1 # <Enumerator: [1, 2, 3]:map>

  p(array.map { |num| num + 1 })