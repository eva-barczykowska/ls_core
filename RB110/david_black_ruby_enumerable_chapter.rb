states = ["Texas", "Montana", "California"]
p states.include?("Mississipi")

p states.all? { |state| state =~ / / }
p states.all? { |state| state =~ /a/ }

p states.one? { |state| state =~ /C/ }
p states.none? { |state| state =~ /C/ }

puts

p Enumerable.instance_methods(false).sort

puts

# language notes:
# - use inclusive range
# - use exclusive range

# find - finds and detects the first element for which the block returns true
# find_all, also known as select

p colors = %w(red purple blue yellow green orange)
p colors_with_o = colors.grep(/o/)
p colors_with_o = colors.grep(/ee/)

nums = [2, 6, 19, 77, 3, 202, 1001]
p nums.grep(50..100)
# when we use a block with grep, we can also transform those elements
p colors.grep(/o/) { |color| color.capitalize } # ["Yellow", "Orange"]

p colors.group_by { |color| color.size } # {3=>["red"], 6=>["purple", "yellow", "orange"], 4=>["blue"], 5=>["green"]}

p colors.group_by { |color| color.start_with?('p') } # group_by returns a Hash
# {false=>["red", "blue", "yellow", "green", "orange"], true=>["purple"]}

objects = [2, 6, 19, 77, 3, 202.17, :hello, "say no"]
p objects.grep(String)
p objects.grep(Integer)
p objects.grep(Float) # this is a fantastic method!

res = []
0.step(10, 3) do |n|
  res << n
end

p res

rainbow = %w(red orange yellow green blue)
p rainbow.map{ |color| color[0, 3] } # same as p rainbow.map{ |color| color.slice(0, 3) }

array = (1..10).to_a
array.each_slice(3) { |slice| p slice }
# [1, 2, 3]
# [4, 5, 6]
# [7, 8, 9]
# [10]

array.each_cons(3) { |slice| p slice }
# [1, 2, 3]
# [2, 3, 4]
# [3, 4, 5]
# [4, 5, 6]
# [5, 6, 7]
# [6, 7, 8]
# [7, 8, 9]
# [8, 9, 10]


result = []
a = [15, 30, 45]
a.cycle(2) { |elements| result << elements }
p result

result = []
a = [15, 30, 45]
a.cycle(3) { |elements| result << elements }
p result

result = []
a = ['a', 'aa', 'aaa']
a.cycle(2) { |elements| result << elements }
p result

result = [1, 10, 9, 80].inject(0) { |sum, number| sum + number}
p result

result = [1, 10, 9, 80].inject(:+)
p result

names = %w(ewa anita barczykowska)
p names
names = names.map(&:upcase)
p names

