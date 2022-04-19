my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

 p my_arr

my_arr_two = [[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

p my_arr_two

# 1.method call(map), it is called on the outer array, it returns a new array
# 2. On the 2nd line we are calling map (again) and passing it a block
# (this is our inner block) with a parameter num this time. Within the block
# we are calling the * method with an integer 2 as an argument.
# The return values of the inner block will be [[2, 4], [6, 8 ]].
# If this is return value of the inner block, this return value is used by the
# outer block.
# As a result, a new transformed array is returned.
# The return value of the inner block is used to determine the return value
# of the outer block.
# The return value of every expression is important.

my_arr_two = [[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

p my_arr_two
# corrections from Allison
# - Talk in paragraph form; like you're teaching someone what this code does.
# - Use backticks (``) to delemit variable names, code values and line numbers.

# Question: Explain what this code stores in `my_arr_two` and why.
# On `line 31` we are declaring a local variable `my_arr_two` and initializing
# it to reference the return value of a `map` method invocation. The `map`
# is called on an array `[[1, 2], [3, 4]]`. The outer `map`
# method invocation takes a block, denoted with the words `do` and `end` visible
# on `line 31` and `line 35`. The block has a block parameter `arr`.
# When `map` is invoked, `arr` will reference each sub-array defined in the
# the top-level array `[[1, 2], [3, 4]]`.

# Inside the outer invocation of `map` there is a second, inner invocation of
# `map` on `line 32`. This inner `map` is invoked on the current value of
# `arr`. The inner invocation of `map` takes `num` as its block parameter.
# When `map` is invoked on `arr`, each element from the array is in turn
# assigned to the block parameter `num`.

# When inner `map` method is called, we will multiply the current value of
# `num` by `2` on `line 14`. Because Ruby returns the last evaluated value in a
# block, each cycle of the inner invocation of `map` will return the current
# value of `num` multiplied by `2`.

# Because `map` transforms the array according
# to the return value of the block, the return value of the inner invocation of
# map will be `[2, 4]` and `[3, 8]`.

# For the outer `map` that is the return value of its block, so it will take it
# and transform the original array accordingly.
# So the local variable `my_arr_two` now points to return value of the
# outer map method, which transformed the original array according to the
# return value of the block, to [[2, 4] , [3, 8]].

# There are no side effects in this code.
