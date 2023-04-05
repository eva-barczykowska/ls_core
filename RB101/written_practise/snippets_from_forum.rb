def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

repeater('Hello')

# -mine - 9 min
# On line 9 the `repeater` method is invoked and the String object `"Hello"` is passed as an argument.
# This method is defined on lines 1-7. Within the body of the method, on line 2 a method-scoped
# local variable `result` is initialized to an empty string.
# Subsequently the String `#each_char` method is called on the string argument. A do..end block was passed
# to the `each_char` method, with the block parameter `char`. The method will in turn pass each character
# from the string argument to the block. Within the body of the block, destructive method << is called
# and so each of the characters will be appended twice to the result variable, which is available inside
# the block.
#
# Finally, on line 6, the `result` will be implicitly returned from the method.
# So when we invoke the method on line 9, it will not print anything but it will return the 'result' variable,
# which is now pointing to the string `"HHeelllloo"`.
#
# What concept does this code represent?
# `Mutation` because we mutate the initially empty string by appending characters.
# `Implicit return` because we do not use the word `return`, which is optional in Ruby and we can omit it if what we
# want to return from our method is the last evaluated statement.
# `Block scoping rules` because `result` is initialized outside the block but available inside the block.
# The inner, block scope has access to outer scope.
#
# stuff that I would add:
# When 'Hello' was passed as an argument to the method call on line 9 'Hello' and string became aliases
# so .each_char is called upon 'Hello'.
# The purpose of the each_char method is iteration and it will iterate over each character of the string from 'H'
# until the end of the string.
# The method each_char passes each character to the code block between `do` on line 3 and `end` on line 5.
# On line 3 `|char|` is initialized as a variable scoped at the block level, meaning this variable is not accessible
# outside of the block. During iteration char will hold the value of each character from the string.
# Iteration stops on line 5 and each_char returns the collection it iterated over.

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

p my_hash2[x]

# mine - 8 min
# On line 42 a main scoped variable `x` is being initialized to a String object `"hi there"`.
# On line 43 a main scoped variable my_hash is initialized to a Hash object with key symbol `x:` and corresponding
# value String "some value".
# On the last line again a main scoped variable my_hash2 is initialized to a Hash object with key `x`
# and corresponding value "some value"
# The question is whether reassigning x to point to "some value" while initializing `my_hash2` will have
# effect on the variable initialized on line 42. Well yes, because we change where this variable is pointing to,
# initially it was pointing to the string `"hi there"`, but on line 44 it was reassigned to point to "some value"
# and so if we extract and print the value belonging to the x key in my_hash2, it will be "some value".

# stuff that I would add:
# Lastly, on line 44 assignment takes place. The key `x` within the hash is the variable `x`
# that was initialized on line 1.
# This is possible because of different factors.
# First, the variable `x` from line 42 is available throughout
# the program and can be used in this context.
# Second, in ruby hash keys can be different objects including other variables.
# It is important to note that when using a variable as a key in this fashion,
# any change to either the variable x or the key x will be visible in both "places"
# since they are the same object.
# So, if a destructive method were to be called on variable x the state of the key x would also be altered.
# This demonstrates the concept of Variables as pointers because, `x` is pointing to a certaing string
# object and then it is reassigned to point to another string object.

total = 0
[1, 2, 3].each do |number|
  total += number
end
puts total

# me - 9 min
# On line 73 a main scoped variable total is initialized to point to an Integer 0.
# Subsequently, on line 74 `Array#each1 method is called on array object `[1, 2, 3]`
# and a `do...end` block is defined, with the block parameter `number`. Each method
# will pass in turn every element of the array that it is called on to the block.
# Within the block `+` method is called and the total is reassigned to the result of adding
# the current value of total and the current element that of the array during the iteration.
# `+=` is syntactical sugar of a shortcut for `total = total + number`
# The value of `total` has been changed in the block. This is possible because the `total` variable
# initialized in the main scope/outer scope
# is available in the inner/block scope and so its value can be changed.

# On lin 77 we call the `puts` method and pass it `total`. This will print `6` and return `nil`
# because `puts` always returns `nil`
# The concept represented here is local variable scope, namely that a variable initialized
# in the main/outer scope is available in the inner/block scope.

# stuff that I would add:
# When iteration ends `each` will return nil which is not used in this code snippet
# On the last line `Kernel#puts` method is invoked and `total` passed in as an argument.
# Puts has a side-effect of printing and it returns nil, which is unused in this snippet.

def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)

# On line 105 a local variable `a` is initialized to an array of 3 elements, all String objects.
# On the last line `test` method is invoked and the previously initialized array `a` is passed in as an argument.
#
# The `test` method is defined on lines 101-103. It takes 1 parameter, `b`
# When we invoked this method, `a` and `b` become aliases, they point to the same object.
#
# Within the body of the method Array#map method is called on `b` and a block is passed to `map`. The block is
# denoted by `{}`. Within the block a block scoped local variable `letter` is initialized, it acts like a placeholder
# for every element of the array in turn. So map will first pass to the block `"a"`, then `"b"` and finally `"c"`.
# Map method returns a new array of transformed elements. It transforms its caller according to the return value
# of the block. So the map method call will transform each element of the array passed to it into a new array,
# with the same number of elements elements, in this case strings,
# each containing the subsequent letter that map passed to the block, at each iteration. The letter is interpolated into
# each string/element of the array.
# The test method, like every method in Ruby implicitly
# returns the last evaluated expression and so when we invoke `test` on line 106, nothing will be printed but
# the return value will be the array ["I like the letter: a", "I like the letter: b", "I like the letter: c"].
#
# Invoking test and passing it locally scoped `a` on line 106 does not change the value of the original variable `a`
# initialized on line 105. If we wanted to change the value of `a` to the return value of the method we could have
# done this like so a = test(a)
# Concepts demonstrated here are array transformation, string interpolation. String interpolation works only with
# double quotes.
#
# stuff that I would add:
# When `test` is invoked the variable `a` which belongs to the outer scope and the variable `b`
# which is scoped at the method definition level, become aliases and point to the same object.
# On line 2 map is called on b and will return a new array of transformed elements.
# map has as an argument the code block contained within {} curly braces.
# This code block will execute for each iteration of map and the return value of the code block will be used
# in the new array that map creates. Within the code block the inner variable letter is initialized,
# this variable is only accessible within this code block.
# On each iteration letter will become an alias for each element 'a', 'b', 'c' respectively.
# This value will in turn be used within string interpolation.
# The expression #{letter} will evaluate to the current letter of the iteration
# and the resultant string will be returned on that iteration and mapped to the new array.
# So map will return ["I like the letter: a", "I like the letter: b", "I like the letter: c"]
# as will the method test since that is the last line of code to be evaluated within the method.

def include?(arr, search_item)
  !arr.each { |item| return true if item == search_item }
end

include?([1, 2, 3, 4, 5], 6)

# On line 151 we're calling the `include?` method, passing it 2 arguments, an Array literal `[1, 2, 3, 4, 5]`
# and an Integer `6`.
# The `include?` method is defined on lines 147-149.
# This method takes 2 arguments, `arr` and `search_item`.
# In the body of the method we are calling `Array#each` method and passing it a block with the block parameter
# `item`. The each method will pass every element of the argument array to the block parameter and inside the block
# the element will be compared with the item that has been passed to the method as the second argument,
# namely integer 6.
# The method will return true immediately after the block finds an element from the argument array that is equal to the
# 2nd argument that was passed to the method when it was invoked. `if conditional` makes sure of that.
# Well, in this case the if conditional does not evaluate to `true` for any of the elements of the array
# and so the block will return false.
# `array#each` returns its caller so `[1, 2, 3, 4, 5]` is returned. `!` is used to return the boolean equivalent
# of [1, 2, 3, 4, 5], which is `false`.
# This code will return false.

def merge(array_1, array_2)
  array_1 | array_2
end

arr1, arr2 = ['hello'], ['hello', 'world']
merged = merge(arr1, arr2)
merged[0][0] = 'J' # we reassigned the first element of arr1 to point to 'J'
p merged #['Jello', 'world']
p arr1 #['Jello']
p arr2 #['hello', 'world']

# On line 173 we can see multiple assignment, `['hello']` is assigned to arr1 and  `['hello', 'world']` is assigned to
# arr2.
# On the following line the return value of the `merge` method with 2 arguments, the previously initialized
# arr1 and arr2, is assigned to 'merged'.
# The `merge` method is defined on lines 169-171, with 2 parameters, array_1 and `array_2`.
# When we invoke the `merge` method, its parameters become aliases with `arr1` and `arr2`. This means `that array_1`
# and `array1` is the same object, the same goes for `array_2` and `array2`.
# Within the body of the method, the `|` method is called, this is the method that creates a union of the 2
# array objects, removing duplicates and preserving element order. This line returns an array ['hello', 'world'] and,
# since this is the last evaluated line in the method, this is the method's return value.
# On line 175 the first character of the first array element is retrieved by using bracket notation Array[].
# Then the and mutative method []= takes over and the first character of the first element of the merged
# array is now pointing to `J` instead of `h`.
# When we print `merged` on line 176, we see ['Jello', 'world'].
# It is important to notice that this change affected also the original array because `merged[0]` and `arr1[0]`
# are in fact pointing to the same object.
# `hello` from `arr2` was not affected because it is not a part of merged, it was removed by `merge` method
# since it was a duplicate value and `|` removed duplicates.
# So when we print `arr1` and `arr2` on lines 177 and 178, we see that the first array changed and is pointing now to
# ['Jello'], while the second array is still pointing to where it was pointing before being passed as an argument to
# `merge`, namely ['hello', 'world'].

def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

short_long_short('abc', 'defgh')

# On line 210 the `short_long_short` method is invoked and 2 string objects, 'abc' and 'defgh' are passed
# as arguments to the method.
# The method is defined on lines 202-208 with 2 parameters, string1 and string2.
# In the body of this method there is an `if conditional` with a certain condition passed to it.
# The condition uses the `>` method to compare the return value of the `length` method called on `str1` and the
# return value of calling the `length` method on `str2`. if this comparison evaluates to true, i.e. the size of
# `str1` is greater than the size of `str2`, then the return value of the method will be the string consisting of
# adding str2, str1 and str2.
# If the condition will evaluate to `false` on the other hand, the return value of the method will be also a string
# but it will be the return value of calling the `+` method as well, but on `str1`, `str2` and `str1`, so the order
# of concatenated strings will be different.
# In this case, when we invoke the method and strings `"abc"` and `"defgh"` become aliases with `str1` and `str2`,
# the `else` branch of the `if conditional` will be executed and the method will return the result of concatenating
# str1, str2 and str1, namely `"abcdefghabc"`. Nothing will be printed.