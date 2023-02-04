# You can use the sort method on an array, hash, or another Enumerable object
# & you’ll get the default sorting behavior (sort based on <=> operator)
#
# You can use sort with a block, and two block arguments,
# to define how one object is different than another (block should return 1, 0, or -1)
#
# You can use sort_by with a block, and one argument,
# to define one attribute for each object
# which is going to be used as the basis for sorting
# (array length, object attribute, index, etc.).
# The block should return an integer value which determines the position of the object in the sorted array.

# Sorting a hash by its value
p hash = {coconut: 200, orange: 50, bacon: 100}

p hash.sort_by(&:last) # last means last element of a hash, which is value
# [[:orange, 50], [:bacon, 100], [:coconut, 200]]

# This will sort by value
# what you get back is not a hash but a
# multi-dimensional array
# To turn this back into a hash you can use the Array#to_h method.
#
# Sorting By Multiple Values
# You may want to sort something by multiple attributes,
# meaning that you first sort by date (for example),
# but because you have multiple things with the same date then you have a tie.
#
# To break the tie you can use a secondary attribute.
Event = Struct.new(:name, :date)
events = []

events << Event.new("book sale", Time.now)
events << Event.new("course sale", Time.now)
events << Event.new("new subscriber", Time.now)
events << Event.new("course sale", Time.now + 24000)

p events.sort_by { |event| [event.date, event.name] }
# The key here is the array inside the sort_by block.
# Where you set the primary sorting attribute as the first element of the array
# (event.date) & then the secondary tie-breaker attribute (event.name).
#
# Quick sort implmentation
def quick_sort(list)
  return [] if list.empty?

  groups = list.group_by { |n| n <=> list.first }

  less_than    = groups[-1] || []
  first        = groups[0]  || []
  greater_than = groups[1]  || []

  quick_sort(less_than) + first + quick_sort(greater_than)
end

p quick_sort [3, 7, 2, 1, 8, 12]

# The idea of quick sort is to pick one number at random
# then divide the list we are sorting into two groups.
# One group is the numbers less than the chosen number
# & the other group is the numbers bigger than the chosen number.
# Then we just repeat this operation until the list is sorted.

# [1, 2, 3, 7, 8, 12]