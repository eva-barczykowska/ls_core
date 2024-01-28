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
p colors.grep(/o/) { |color| color.capitalize }
p colors.group_by { |color| color.size }
p colors.group_by { |color| color.start_with?('p') } #group_by returns a Hash
