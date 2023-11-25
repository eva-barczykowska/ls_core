=begin
We expect the code below to output the nested array [[2, 4], [6,8]]. However, it does not. What does the code output instead? Why? Fix the code below so that it outputs the expected results.
=end

new_arr = [[1, 2], [3, 4]].map do |arr|
  arr.select do |num|
    num * 2
  end
end

p new_arr


new_arr = [[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

p new_arr


arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |k, v|
    v.all? { |num| num.even? }
  end
end

# - What is happening at each *level* of iteration
# - What each method does with the return value of the block
# - What the method itself returns
# - What is ultimately returned by the initial method call


arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

p (arr.select do |hash|
  hash.all? do |k, v|
    v.all? { |num| num.even? }
  end
end)

# - What is happening at each *level* of iteration
# - What each method does with the return value of the block
# - What the method itself returns
# - What is ultimately returned by the initial method call