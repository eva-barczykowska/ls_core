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
  [5, 6, 7, 8]
]

my_array.map { |row| row.map { |col| col + 1 } }
# => [[2, 3, 4, 5], [6, 7, 8, 9]]

puts

# Map over a Hash
# There's a new method (since Ruby 2.4) called Hash#transform_values
# that you could use pretty much like you would use an Array.

h = { a: 1, b: 2, c: 3 }

h.transform_values { |v| v * v + 1 }
# => { a: 2, b: 5, c: 10 }

h.transform_values(&:to_s)
# => { a: "1", b: "2", c: "3" }

puts

[1, 2, 3].map(&:even?)

# could be written as

p [1, 2, 3].map(&:even?)
p [1, 2, 3].select(&:even?)

puts

# we can break from each as well!
[1, 2, 3].each do |i|
  break if i == 3
  puts i
end

# 1
# 2
#
# # using freeze with an array
# fruits = ["apple", "pear", "mango"]
# fruits.freeze
# fruits << "grapes"
#
# this will throw can't modify frozen Array (RuntimeError)
# this does not mean that we cannot reassign

fruits = ["apple", "pear", "mango"]
p fruits.object_id
fruits.freeze
fruits = ["wine", "figs", "cheese"]
p fruits

how_about_now = ["apple", "pear", "mango"]
p how_about_now.object_id
# how_about_now << "addition"
p how_about_now

# It is important to note that variables referencing frozen objects can be updated.
# This is because only the objects are frozen, not the variables that point to those objects.

# The example above shows how a frozen object can be replaced
# by a new object that is accessible by the same variable
#
puts "strings compared with =="
# they're DIFFERENT STRINGS which happen to have the same value
my_name = "ewa"
her_name = "ewa"
puts my_name == her_name

my_score = 1
his_score = 1.0
p my_score == his_score
p my_score.eql?(his_score) # == method will normalize 1.0 to 1 but eql? method will not

puts "example with arrays:"
my_array = [4, 5, 6]
her_array = [4, 5, 6]
p my_array == her_array
p my_array.eql?(her_array)

puts
my_array = [4, 5, 6.0]
her_array = [4, 5, 6]
p my_array == her_array
p my_array.eql?(her_array)

puts
puts "equal? is comparing if objects are in fact the same objects:"
my_array = [4, 5, 6]
her_array == my_array.dup
p my_array == her_array
p my_array.eql?(her_array)
p my_array.equal?(her_array)