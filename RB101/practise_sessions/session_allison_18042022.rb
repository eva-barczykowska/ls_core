my_arr = [[18, 7], [3,12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

 p my_arr

my_arr_two = [[1,2],[3,4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

p my_arr_two

#1.method call(map), it is called on the outer array, it returns a new array
#2. On the 2nd line we are calling map (again) and passing it a block
# (this is our inner block) with a parameter num this time. Within the block
# we are calling the * method with an integer 2 as an argument.
# The return values of the inner block will be [[2, 4], [6, 8 ]].
# If this is return value of the inner block, this return value is used by the
# outer block.
# As a result, a new transformed array is returned.
# The return value of the inner block is used to determine the return value
# of the outer block.
# The return value of every expression is important.

# - Talk in paragraph form; like you're teaching someone what this code does.
# - Use backticks (``) to delemit variable names, code values and line numbers.

# Explain what this code stores in `my_arr_two` and why.
# On `line 12` we are declaring a variable called `my_arr_two` and initializing
# it to reference the return value of a `map` invocation. This `map` is called
# on an array with the value of `[[1, 2], [3, 4]]`. The outer `map` invocation
# takes `arr` as its parameter. For each cycle of the outer invocation
# of `map`, `arr` will reference the inner arrays that are defined in
# the top-level array.

# Inside of the outer invocation of `map` is a second, inner invocation of
# `map` on `line 13`. This inner invocation is invoked on the current value of
# `arr`. The inner invocation of `map` takes `num` as its parameter.
# On each cycle of this inner invocation of `map`, `num` will reference one of
# the values in the inner arrays that are defined in the top-level array
# on `line 12`.

# For each cycle of the inner `map`, we will multiply the current value of
# `num` by `2` on `line 14`. Because Ruby returns the last evaluated value in a
# block, each cycle of the inner invocation of `map` will return the current
# value of `num` multiplied by `2`. Because `map` takes the return value of its
# block and stores it in a new array, the value that the inner invocation of
# map will result in is `[2, 4]` and `[3, 8]` per outer `map` cycle.

# The outer `map` invocation will take these returned arrays and create a new
# array from them, returning the value of `[[2, 4], [3, 8]]` and storing
# that value in `my_arr_two`.

# There are no side effects in this code.
