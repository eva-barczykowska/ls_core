# 1.
# what's the return value and why?

[1, 2, 3].select do |num|
  num > 5
  "hi"
end

# 2.
# How does count treat the block's return value?
['ant', 'bat', 'caterpillar'].count do |str|
  str.lenth < 4
end

# 3.
# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# 4. What's the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# When we invoide each_with_object, we pass in an object, here a {},
# as an argument. That object is then passed into the block and its updated value
# is returned at the end of each iteration.
# Once each_with_object has iterated over the calling collection, it returns the
# initially given object, which now contains all the updates.
# We start with a {} object. On the first iteration we add "a" => "ant" to the hash.
# On the second, "b" => "bear", on the last, "c" => "cat".
# That's why each_with_object returns those 3 elements.

# 5.
hash = { a: "ant", b: "bear"}
hash.shift

# .shift destructively removes the first key-value pair in hash and returns it
as a two-item array.
# if the hash was empty, it would return the default value.


# 6.

["ant", "bear", "caterpillar"].pop.size
# .pop destructively removes the last element from the calling array and returns is
 # .size is being called on the return value by pop
 # so .size is evaluating the return value of pop
# about its length

#7.
[1, 2, 3].any? do |number|
  puts number
  number.odd?
end

# THE RETURN VALUE OF THE BLOCK IS DETERMINED BY THE RETURN VALUE OF THE LAST
# EXPRESSION WITHIN THE BLOCK.
# In this case, the last statement evaluatedis num.odd?, which returns a boolean.
# Therefore the block's return value will be a boolean since Ingeger#odd? can
# only return a boolean.

# 8.

arr = [1, 2, 3, 4, 5, 6]
arr.take(2)

# 9.

{ a: "ant", b: "bear" }.map do |key, value|
  if value.size > 3
    value
  end
end

# map always returns an array

# First, the return value of map is an array, which is the collection type that
# map always returns. Second, where did that nil come from? If we look at the
# if condition (value.size > 3), we'll notice that it evaluates as true when the
# length of value is greater than 3. In this case, the only value with a length
# greater than 3 is 'bear'. This means that for the first element, 'ant',
# the condition evaluates as false and value isn't returned.
#
# When none of the conditions in an if statement evaluates as true, the if
# statement itself returns nil. That's why we see nil as the first element
# in the returned array.

# 10.

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# We can determine the block's return value by looking at the retun value of the
# last statement evaluated within the block. In this case it's tricky because
# it's an IF STATEMENT. For the first element, the if condition evaluates as false,
# which means that num is the block's return value for that iteration. For the rest
# of elements in the array, num > 1 evaluates as true, which means puts num is
# the last statement evaluated. This means that the block's return value is nil
# for those iterations.
#
# Therefore the return value of .map is [1, nil, nil]
