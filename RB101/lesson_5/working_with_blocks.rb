# Talk about this code in terms of:
# What is the type of action being performed (method call, block, conditional, etc..)?
# What is the object that action is being performed on?
# What is the side-effect of that action (e.g. output or destructive action)?
# What is the return value of that action?
# Is the return value used by whatever instigated the action?

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

puts "***********************************************************************"

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

puts "***********************************************************************"

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

puts "***********************************************************************"

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

puts "***********************************************************************"

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

puts "***********************************************************************"

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

puts "***********************************************************************"

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.any? do |key, value|
    value[0] == key.to_s
  end
end

puts "***********************************************************************"

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]

puts "***********************************************************************"

[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

puts "***********************************************************************"

[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

puts "***********************************************************************"

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

puts "***********************************************************************"

# Do not mutate the collection that you're iterating through.
# Since iteration is the basis of selection and transformation,
# that implies don't mutate the collection while you're performing selection or
# transformation or pretty much any action on the collection.

# example of what not to do

# The method remove_evens! should delete all even numbers from the array passed
# in as the argument.

def remove_evens!(arr)
  arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens!([1,1,2,3,4,6,8,9])
# expected return value [1, 1, 3, 9]
# actual return value [1, 1, 3, 6, 9]

# The Array#delete method is destructive, and is changing the contents of arr
# during iteration. The return value here may or may not make some sense to you,
# but there's almost always a much clearer way of achieving the desired result
# without having to resort to mutating the collection while iterating through it.

# One way you could fix the code above is to create a shallow copy of the array
# and iterate through it while mutating the original array.

def remove_evens!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

# Some important things to remember:
#
# If at first code appears opaque or complex, take the time to break it down
# step by step.
# If necessary use some sort of systematic approach (such as the tabular method
#   outlined in this assignment).
# Figure out what is happening at each step, paying particular attention to:
# Return value
# Side effects
# Pay attention to the return values of all statements in your code, especially
# where implicit return values are being relied on.
# Make sure you have a clear understanding of the underlying concepts such as
# data structure, loops, iterative methods and the blocks passed to them (go back
#   over earlier assignments if necessary).
# Be clear about the method implementation of the iterative method(s) being used,
# especially:
# What values are passed to the block
# What the method does with the return value of the block
# If you are unclear about a method implementation, a good initial step is to
# refer to the Ruby Docs.
