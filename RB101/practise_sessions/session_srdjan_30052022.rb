# 1
def my_method
  puts "hi"
end

favorite = my_method

# We initialize variable `favorite` to the RETURN value of `my_method` method.

# We call puts method and pass string "hi" as the argument to it.
# This outputs `"hi"`` and returns nil.

# 2.
def test(str)
  str += '!!!'
  str.upcase!
end

test_str = "Something"
test(test_str)

puts test_str

# Once the method is invoked both `str` and `test_str` point to the same
# string object.

# On line `2` we are reassigning variable `str` to point to a different string
# object and from now on `str` and `test_str` no longer point to the same object.

# Because of that, it is no longer possible to mutate the object that
# the `test_str` variable points to.

# We call a method on the object that the variable points to.
