# It’s sometimes useful to not start at the beginning of the list,
# but to skip a few items.
# So to set a different starting point for the loop, you can use a range.

my_list = [1, 2, 3, 4 ,5]
[3..-1].each { |i| puts i }
my_list[3..-1].each { |i| puts i }

# 4
# 5

["a", "b", "c"].each_with_index.map { |n, i| n + i.to_s } # => ["a0", "b1", "c2"]
["a", "b", "c"].map.with_index { |n, i| n + i.to_s } # => ["a0", "b1", "c2"]

puts

# Another way is to use drop. It’s part of the Enumerable module,
#   so every enumerable object supports it. As the name suggests, drop(n)
# skips the first n elements and uses the rest for the loop.

p [1, 2, 3, 4 ,5].drop(3).each { |i| puts i }
# 4
# 5


# Map and remove nil values
# The resulting array could contain a few nil values,
# and you might want to get rid of them.
# Here are a few ways you could do it.

  [1, 2, 3].map { |n| n == 2 ? n : nil } # => [nil, 2, nil]

[1, 2, 3].select { |n| n == 2 ? n : nil } # => [2]
[1, 2, 3].map { |n| n == 2 ? n : nil }.compact # => [2]
[1, 2, 3].map { |n| n == 2 ? n : nil } - [nil] # => [2]
[1, 2, 3].map { |n| n == 2 ? n : nil }.reject(&:nil?) # => [2]
[1, 2, 3].reduce([]) do |memo, n|
  memo << n if n == 2
  memo
end

puts

my_array = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
]

my_array.map { |row| row.map { |col| col + 1 } }
# => [[2, 3, 4, 5], [6, 7, 8, 9]]

puts

# Map over a Hash
# There's a new method (since Ruby 2.4) called Hash#transform_values
# that you could use pretty much like you would use an Array.

h = { a: 1, b: 2, c: 3 }

h.transform_values {|v| v * v + 1 }
# => { a: 2, b: 5, c: 10 }

h.transform_values(&:to_s)
# => { a: "1", b: "2", c: "3" }

puts

[1, 2, 3].map { |n| n.even? }

# could be written as

p [1, 2, 3].map(&:even?)
p [1,2,3].select(&:even?)

puts

# we can break from each as well!
[1,2,3].each do |i|
  break if i == 3
  puts i
end
# 1
# 2