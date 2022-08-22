def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end


p leading_substrings('abcde')
=begin
VERY HELPFUL
Take from the feedback what helps you and leave the rest behind.

***(The thing that I practice to find explanations like these is try to figure out
the context that my audience needs explained to them.

I have to put myself back in my own perspective from when I did not know what this was and what questions I had.)***

In the body of the `leading_substrings` method, we first initialize a `result` variable to an empty array.
We then invoke the `Integer#upto` method.
The `upto` method takes the given block and executes it a number of times,
defined by the lower and upper bounds that `upto` is provided.
The lower bound is defined by the `integer` that the `upto` method is called on
and the upper bound is defined by the `limit` argument that is passed to `upto`.
In our code, the lower bound is defined as `0` and the upper bound is defined as `string.size - 1`,
which represents the length of the input `string`.

The #upto method also takes a block and we use `index` as the block parameter.

When the `leading_substrings` method is called, numbers from 0 to 4 will be passed in turn
as a block argument to the `upto` method and then,
because in the body of the block we call the `String[range]` method,
a substring will be extracted from position 0 to the position equal to the `index`
block variable, i.e. subsequently str[0..0], str[0..1], str[0..2], str[0..3], str[0..4].
Those 5 sub-strings, as they are extracted from our argument string, will be
appended to the `result` array as its elements.

Finally, the result array will be returned.
If we pass a string ‘abcde’ as an argument, an array `[“a”, “ab”, “abc”, “abcd”, “abcde”]` will be returned from our method.
=end
