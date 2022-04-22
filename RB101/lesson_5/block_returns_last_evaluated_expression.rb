[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end

# block returns the last evaluated expression
# in this case, block returns nil
# each however doesn't care about the blocks return value, map and select do
# so...
# the above returns the caller, original array

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end

# map transforms the array according to the block's return value
# so the above will return a new array [nil, nil]

[[1, 2], [3, 4]].select do |arr|
  puts arr.first
end

# select selects elements of the array based on the truthiness of the block's
# return value
# the block's return value is nil here so nothing will get selected
# so this should be an empty array
