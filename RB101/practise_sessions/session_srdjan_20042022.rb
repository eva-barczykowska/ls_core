# Given integer array nums, return the third largest number in this array. If the third largest number does not exist, return the largest number..
# You are not allowed to sort the array

# p third_max([3,2,1]) == 1
# p third_max([1,2]) == 2
# p third_max([2,2,3,1]) == 1
# p third_max([1, 3, 4, 2, 2, 5, 6]) == 4

# You are given an array which contains only integers (positive and negative).
# Your job is to sum only the numbers that are the same and consecutive.
# The result should be one array.

# You can asume there is never an empty array and there will always be an integer.

# p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

# 25 min each

# What does this code return and why?

[false, false, true].map { |something| "hi" }
# map returns new array based on the return value of the block

[false, false, true].select { |something| "hi" }
# select method returns new array
# selects the element if the return value of the block is truthy

animal = "dog"
loop do |_|
  animal = "cat"
  var = "mouse"
  break
end

puts animal
puts var

# The question here is what will be the output of `line 37` and `line 38`
# This code illustrates the concept that variables initialized in the outer
# scope can be accessed in the inner scope (defined by the block)
# but not vice versa.
# `line 37` will output 'cat' because this variable is defined but `line 38`
# will produce `undefined variable or method` error because the variable `var`
# is define in in inner scope (defined by the block), and therefore
# not accessible outside the block.

def test(str)
  str += "!!!"
  str.upcase!
end

test_str = "Something"
test(test_str)

puts test_str

# This code asks us what `line 57` will output.
# On `line 49` we define`test` method that takes 1 parameter, a `str`.
# On `line 54` we initialize local variable `test_str`to a string with a value "Something".
# On `line 55` we call the test method and pass it the `test_str`
# as an argument. At this point both str and test_str are pointing to the same
# object, a string "Something". However, on `line 50` we are reassign str to
# to a different object, now it is points to string `Something!!!` It is no longer
# to mutate the object test_str.
# And on `line 51` this is the string that we ultimately upcase, so the method will
# return the string `SOMETHING!!!`. However, the method is not changing
# the original variable initialized on `line 54`, so it stays the same.
# `line 57` will outprint string "Something".
# If we wanted to collect the return value of the method, we would have to
# assign the return value to a different variable.
