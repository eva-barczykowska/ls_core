# Code Snippets to analyze/describe

###### For all the snippets describe what is happening with specific focus on return values, expected output and the concept demonstrated.
# Be particular about using clear and accurate language.

#1.
p 2 <=> 1
p 1 <=> 2
p 2 <=> 2

p 'b' <=> 'a'
p 'a' <=> 'b'
p 'a' <=> 'a'

p 1 <=> 'a'

# On lines 1-3 a rocket operator symbol is used to compare integers. This operator is used for comparison and returns -1
# if the operand on the left side of the operator is smaller than the operand on the right side of the operator,
# 0, if they are equal and 1 if the operand on the right hand side is greater.
# The lines will return 1, -1 and 0 respectively.

# For strings, their value in the ASCII table is used when comparing with the <=> operator.
# The lines will return 1, -1 and 0 respectively.

# Last line will output NIL because the objects we are trying to compare are different object types.


#2.
'a' <=> 'b'
'apple' <=> 'ape'
'cat' <=> 'catty'

# First line will return -1 because the rocket operator `<=>` compares strings according to their value in the ASCII
# table. `"a"` has a lower value than `"b"`, which we can compare calling the `#ord` method on each of these strings.

# Second line returns 1 because characters from the first and second word are compared and when we reach second `p` from
# `"apple"`, we compare it with `"e"` from `"ape"`. The former has a greater value in the ASCII table then the latter
# and so the string `"apple"` is deemed greater. This line returns 1.

# Last line returns -1 because the second out of the 2 compared strings is longer.


#3.
def remove_evens!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

remove_evens!([1, 2, 3, 4, 5, 6])
=begin
This is a method definition denoted by the words `def..end`. The method has 1 parameter, an array called `arr`.

Within the method body `cloned_arr` is initialised to point to the return value of invoking `dup` method on the `arr`,
which is passed as an argument when this method is called. The `dup` method makes a `shallow copy` of an argument. This
means that it copies the object, in this case the array but the objects/elements inside this array are not copied
but shared.

What happens next, on 3rd line, `each` method is called on the `cloned_arr` and a block parameter `|num|` is passed to
`each`. At the moment of executing, each element from the `cloned_arr` will be in turn passed to this block parameter.
Within the block, denoted by the words `do..end`, we have an `if condition` stating that if the number at the current
iteration is evenly divisible by 2 (i.e. leaves no remainder), then we want to delete that number, for which we
call the `delete` method on the `arr` argument and pass the `num` as the element to be deleted. We are performing this action
on the array argument  `arr`, not on the copy `cloned_arr`. So what will happen to the elements of `cloned_arr`?

Well, because the elements of `cloned_arr` and `arr` are shared, whichever action we perfom on the elements of one array,
this action will be visible also in the other array. In this case the destructive `delete` method is called
on `arr` and the elements that are evenly divisible by 2 will be deleted from both 'arr' and cloned `arr`.

This code will return `[1, 3, 5].`
The concept demonstrated here is shallow copy. Btw, making a deep copy is very difficult in Ruby, but possible.
=end

#4.
array = ['a', 'b', 'c', 'd', 'e']

array.each do |letter|
  letter.upcase!
end

p array
=begin
On the first line main scope variable `array` is initialized to an array `['a', 'b', 'c', 'd', 'e']`.

On the second line, the `Array#each` method is invoked on `array`. This method takes a block, here denoted by the words
`do..end`, and a block parameter `letter`, to which each element of the calling array will be passed in turn at the time
of execution. Within the block body the destructive `upcase!` method is called on each element that is passed in turn
to `letter`.

What will be returned by this code is the array `['A', 'B', 'C', 'D', 'E']`, this is because each element of the
calling array was permamently changed by invoking on it the destructive `upcase!` method.

The last line is a call to `p` method. This method is alias for the `inspect` method and what it does is to print
the object and then return it. So, `['A', 'B', 'C', 'D', 'E']` will be first printed and then returned.

The concepts represented here are iteration and mutation.

=end


#5.
names = ["george", "bobbi", "joel", "susan"]
names = names.each do |name|
          name.capitalize
        end

p names
=begin
On the first line main scoped variable `names` is initialized to an array of 4 elements, ["george", "bobbi", "joel", "susan"].

On the next line `names` array is reassigned to point to the return value of calling the `each` method on it.
`each` takes a block, denoted here by `do..end` and a block parameter `|name|`. Within the body of the block, the
non-destructive version of the `capitalize` method is called on each element of the `names` array when it is passed
to the block. This method returns each element of the array with the first character upcased. However, this
does not matter because `each` doesn't use the return value of the block but returns its caller instead.

When we use the `p` method on the last line and pass it `names` as an argument, we will get the array
["george", "bobbi", "joel", "susan"], which is actually the same calling array as seen on line 2.

The concept represented here is that of iteration, return value from the block and return value of each.
=end

#6.
names = ["george", "bobbi", "joel", "susan"]
names.each do |name|
  puts name.capitalize
end
=begin
On the first line `names` variable is initialized to an array `["george", "bobbi", "joel", "susan"]`.

On the next line the `Array#each` method is invoked on the array referenced by `names`. A block with the block parameter
`|name|` is passed to `each` and it is to this block parameter that each subsequent element of the calling array will be passed to
during execution. Within the block (delimited by the words `do..end`) we invoke the `puts` method and pass to it
the return value of calling the `capitalize` method on each element of the array.

`puts` is a method that outputs the string representation of the object passed to it so in this case we will see that all
elements of the `names` array are output capitalized and on separate lines like so:
George
Bobbi
Joel
Susan

what is returned, however, is the calling array, `["george", "bobbi", "joel", "susan"]` and this is because `each` does
not take into consideration the return value of the block passed to it but rather returns the calling object.
=end

#7.
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
=begin
`Array#each` method is called on the array `[[1, 2], [3, 4]]`, a block denoted by the keywords `do..end` is
passed to `each`, with the block parameter `arr`. Within the block `Kernel#puts` method is invoked and the return value
of invoking the `first` method on `arr` is passed to it as an argument. `arr.first` will return in turn `1` and `3` and
these are the values that will be passed to `puts` and output to the console.

As for the return value. this code returns the calling array, `[[1, 2], [3, 4]]` because the `each` method does not take
into consideration the return value of the block but returns the array it was invoked on instead.

The concept represented here is iteration and return value of the block.
=end

#8.
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
=begin
`Array#map` method is invoked on the elements referenced by the `array`,  `[[1, 2], [3, 4]]`. `map` takes a block, denoted
by the keywords `do..end`, and a block parameter `arr`, to which each element of the array will be passed, first `[1, 2]`
and then `[3, 4]`. Within the body of the block, `Kernel#puts` method is invoked and the return value of invoking `first`
method on the `arr` is passed to it. So first `first` will return `1` and then, from the second array passed to `arr`,
it will return `3`. So `1` and `3` will be output to the console as a result of being used as arguments to `puts`.

`map` uses the return value of the block to transform the calling array and return a new array, with elements
provided by the return value of the block. However, the block in both cases returns `nil` because the `puts` method always
returns `nil` and the `puts` method is the last executed method in the block.

As a result this code will output to the console 1 and 3 on separate lines and return [[nil], [nil]].

The concept represented here is iteration because `map` is an iterating method. Another concept is the
return value of the block,`map` uses it to transform the array it was invoked on and to return new array,
based on the return value of the block.
=end

#9.
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

=begin
`Array#each_with_index` method is called on array `[1, 2, 3]`. This method takes a block, denoted by the keywords `do..end`,
and 2 block parameters, in this case `num` and `index`.

Inside the body of the block the `Kernel#puts` method is invoked and a string is passed to it.
The string contains 2 interpolated values, `num` and `index`. The interpolation syntax is #{} and it will evaluate
`num` and `index` and insert the correct values in to the string, each time this string is output to the console.

Line 2 will output on separate lines
The index of 1 is 0.
The index of 2 is 1.
The index of 3 is 2.

and the code will return the calling array, namely `[1, 2, 3]`. This is because `each_with_index` is not concerned
with the return value of the block but returns the calling array instead, when called with a block. When called without it,
it returns an Enumerator object.

The concept represented here is interpolation, iteration and the return value of the block.
=end

#10.
{ a: "ant", b: "bear", c: "cat" }.each_with_index do |element, index|
  puts "The index of #{element} is #{index}."
end
=begin
`each_with_index` method is called on a hash `{ a: "ant", b: "bear", c: "cat" }`. This method takes a block, denoted here
by keywords `do..end` and 2 block parameters, here `element` and `index`.

It is an iterating method so at the time of processing the hash, each hash will be passed to `element` and each index
will be passed to `index`. Within the body of the block `Kernel#puts` method is invoked and a string `"The index of #{element} is #{index}."`
is passed to it as an argument. Within this string we see interpolation syntax `#{}`, which will convert `element` and
`syntax` to the correct values from the calling hash, each time those values will be passed to the block.

So line 2 will be executed 3 times and it will output to the console:
The index of [:a, "ant"] is 0.
The index of [:b, "bear"] is 1.
The index of [:c, "cat"] is 2.

So each `element` is output as an array and each index is output as an integer.
As for the return value of this code, it will return `{ a: "ant", b: "bear", c: "cat" }` because `each_with_index`, when
called with the block, returns the calling object. If called without a block, it returns an Enumerator object.
=end

#11.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.select { |n| n.odd? }
=begin
On line 1 `arr` variable is initialized to reference the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 2 `select` method is called on the `arr` and a block `{}` is passed to it, with the block parameter 'n'.
Within the block`odd?` method is called on the element from the calling array, `arr`, passed to 'n'.
 `odd?` evaluates whether the integer is odd or not. If it is odd, the `odd?` method returns true and that value is
in turn used by `select` in order to select elements from the calling array and place them in a new array,
which will be ultimately returned.

`odd?` method returns true for 1, 3, 5, 7 and 9 and it is these integers that will be picked by `select`, placed in a
new array and that array will be returned. The last line of code returns `[1, 3, 5, 7, 9]`.

The concept represented here is iteration because `select` is an iterating method. Also return value of the block since
`select` is using it.
=end

#12.
snowy_owl = {
  "type"=>"Bird",
  "diet"=>"Carnivore",
  "life_span"=>"10 years"
}

snowy_owl.select do |key, value|
  key == "type"
end
=begin
On line 1 a hash `snowy_owl` is created. It contains 3 keys, which are string objects and 3 values, which are also string
objects.

On line 7 the `select` method is called on the hash referenced by `snowy_owl` and 2 parameters are passed to the block
that `select` takes as an argument, the parameters are `key` and `value`. To these parameters hash's keys and values will
be bound in turn at the time of execution.

Within the block an expression `key == "type"` is evaluated. The `==` method is used here. This expression will evaluate as true only for the first
key-value pair from the hash. `select` selects elements of the calling hash according to the return value of the
block and when the return value of the block is truthy for a given element/pair, then `select` takes that element/pair
and places it in a new array, which will be ultimately returned by `select`.

So in this case, `select` method invocation returns `{"type"=>"Bird"}`.

This code represents the concept of selection because the `select` method is used, also iteration, because `select` is an
iterating method. Also, the return value of the block because `select` is using it.
=end

#13.
arr_a = %w(ant bat cat)
arr_b = arr_a.dup

arr_b.map! { |word| word.upcase }

p arr_a
p arr_b
=begin
On line 1 a syntactic sugar syntax `%w(ant bat cat)` is used to create an array of 3 elements, `["ant", "bat", "cat"]` and make
it reference `arr_a`.

On line 2, `arr_b` is created and made reference the return value of invoking the `dup` method on `arr_a`. This method
creates a shallow copy of an object, this means that only the object is copied, elements inside this object are shared.

On line 2 destructive `map!` method is called on `arr_b`, so on the object and not its elements. Within the block
that this method takes as an argument a non-destructive method `upcase` is used on every object from this `arr_b`.

On one but last line we invoke the p method and pass it `arr_a` as an argument. This prints and returns `["ant", "bat", "cat"]`.

On the last line again the `p` method is invoked and this time `arr_b` is passed to it as an argument. This prints and
returns `["ANT", "BAT", "CAT"]`. This is because we used the mutating method `map!`, which means that the method will
use the return value of the block to transorm its elements. Elements are shared, as said above, but we are mutating not
the elements, but the object itself. That is why the changes will reflect in the mutated object, `arr_b` but not
`arr_a`.

This code represents the concept called shallow copy, namely that it is possible to create a shallow copy in Ruby, using
the `dup` or `clone` method. Shallow copy means that only the objec is copied but its elements are shared, not copied.
This is in opposition to deep copy, which is very difficult to do in Ruby.
=end

#14.
arr_a = %w(ant bat cat)
arr_b = arr_a.dup

arr_b[1].upcase!
p arr_a
p arr_b
=begin
On line 1 a syntactic sugar `%w(ant bat cat)` is used to create an array ["ant", "bat", "cat"] and assign it to `arr_a`.
On line 2 `arr_b` is initialized to the return value of calling the `dup` method on `arr_a`.

The `dup` method is creating a shallow copy of the caller, this means that only the object is copied (in this case the
Array object) but the elements inside this array are shared, not copied. What consequence this has is that when we
mutate any of the objects in any of the arrays, `arr_a` or `arr_b`, changes will reflect in both arrays.

The mutation happens on line 4 when a destructive method `upcase!` is called on the element at index 1 of the `arr_b`.
The return value of this code will be `"BAT" `.

When we decide to print both arrays `arr_a` and `arr_b` on lines 5 and 6, we see that the descructive action performed
on the first element of `arr_b` is also reflecting in the first element of `arr_a`. The penultimate and last line of code
both print ["ant", "BAT", "cat"].

The concept represented here is that of a shallow copy (as explained above). There is also `deep copy` but that is very
difficult to do in Ruby but possible, it is called Marshalling.
=end

#15.
arr_a = %w(ant bat cat)
arr_b = arr_a.dup

arr_b.map! { |word| word.upcase! }

p arr_a
p arr_b
=begin
On the first line a syntactic sugar `%w(ant bat cat)` is used to initialize an array ["ant", "bat", "cat"] and assign it to
`arr_a`.

On line 2 `arr_b` is initialized to the return value of invoking the `dup` method on `arr_a`. The `dup` method created
a shallow copy of the object, which means only the object is copied but the elements that it contains are not copied but
shared. This has consequences, i.e. if we perform destructive changes on any of the elements inside any of the arrays,
these chagnes will be visible in both arrays, `arr_a` and `arr_b`.

On line 4 we invoke the destructive version of the `map!` method on `arr_b`. This method takes a block denoted by the
syntax `{}` and a block element `|word|`. At the time of execution, each element of the calling array will be passed to
the block parameter. Inside the block, the destructive method `upcase!` is invoked on each element of the array. This
method will return all elements of the calling array upcased.

On the last 2 lines we invoke the `p` method which outputs to the console and returns the object passed to it as an
argument, here its `arr_a` and `arr_b.`

These lines both output `["ANT", "BAT", "CAT"]`, this is because the `upcase!` method used inside the block performed
permanent changes on the elements in both arrays, this is because these elements are shared so they reference the
same values. We needn't have used the mutating `map!`, the elements would have been still mutated anyway but the use of
mutating `upcase!` on each of the elements.

The concept demonstrated here is that of shallow copy vs. deep copy. Ruby offers us `dup` and `clone` methods to make a
copy of an element but those are shallow copies as explained above. It is difficult (but possible) to make a deep copy,
this is called marshalling.
=end

#16.
['dog', 'cat', 'pig'].sort_by do |word|
  word[1]
end
=begin
On the first line the `sort_by` method is called on an array `['dog', 'cat', 'pig']`. The method takes a block denoted
by the keywords `do..end` and also a block parameter `|word|`, to which each element of the array will be bound in turn
at the time of execution. Within the block we have an expression `word[1]`, which is our criteria of sorting. The method
is supposed to sort all elements of the caller based on the character at index 1 in each word. This will be `"o"`, `"a"` and
`"i"` consecutively.

As a result, the sorted array will be `["cat", "pig", "dog"] `.

The concept demonstrated here is sorting and return value of the block, specifically how sort uses the return value
of its block as the basis on which to sort the calling array.
=end

#17.
[[2, 4], [2, 1, 4], [0, 1, 2], [3, 2, 0], [0, 1], [3, 2, 5]].sort
=begin
The `sort` method is invoked on the nested array `[[2, 4], [2, 1, 4], [0, 1, 2], [3, 2, 0], [0, 1], [3, 2, 5]]`.

`sort` will first look at the element at index 0 of each array and sort according to the integer that is at that position.
Then the method will look at the consecutive numbers in each nested array. Arrays that have same numbers un to a point but
one of them is longer like for example `[0, 1]` and `[0, 1, 2]` - among these two, the longer array is considered greater
and will be placed after the shorter array.

The return value of this code will be `[0, 1], [0, 1, 2], [2, 1, 4], [2, 4], [3, 2, 0], [3, 2, 5]]`. This code doesn't print
anything.

The concept represented here is sorting namely how sort analyzes the caller in order to return a result.
=end

#18.
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
=begin
`each_with_object` method is called on a hash `{ a: "ant", b: "bear", c: "cat" }`, with an argument of `[]`. This method
takes a block denoted by the keywords `do..end` and 2 block parameters, `|pair, array|`. Each key-value pair will be at
the time of execution bound in turn to the `pair` parameter and the `array` parameter is the so called `memo object`, what
this method will ultimately return (it's also the method's argument -  `[]`).

Within the block the `<<` method, also called `shovel` operator is used. This method appends to the memo object, which
at the beginning is just an empty array, the last element of the key-value pair that has been passed to he `pair` block
argument.

The `pair` is passed as an array, that's why we can use the array `last` method. The code in the block will append to
`[]` first "ant", then "bear" and finally "cat". So this code will return an array of 3 elements, ["ant", "bear", "cat"].

This code represents iteration and creation of an a new object out of the calling object.
=end

#19.
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
=begin
`each_with_object` method is invoked on a hash `{ a: "ant", b: "bear", c: "cat" }` and a `{}` object is passed to it as
an argument. This method takes a block denoted by the keywords `do..end` and block parameters `key, value`, to which each
key and value from the calling hash will be passed in turn at the time execution. There is also a third block parameter, `hash`, this is the so
called memo object, it's the object passed to the method as an argument and the object that will be gradually build while
iterating through the caller.

Within the block body we have the statement `hash[value] = key`, which is using hash element reference to assign the
current key to the current value in our memo object, the hash. What this code will do is to invert the current key-value
order and return the object indicated as an argument, so we see ` {"ant"=>:a, "bear"=>:b, "cat"=>:c}` as the return value.

The concept demonstrated here is iteration as well as block's return value, which is used by `each_with_object` to build
the new hash. Also `hash element reference` is demonstrated on line 2, where we use `[]=` method to assign the value to a key.
=end

#20.
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
=begin
`map` method is used on the array of 3 hashes, `[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]`. This method takes a block,
denoted here by the keywords `do..end` and it also takes a block parameter `hsh`, to which each consecutive hash from
the calling array will be in turn bound at the time of execution.

Inside the block body `incremented_hash` is initialized to an empty hash, `{}`.

Subsequently, the `each` method is invoked on the `hsh`, with the block and block parameters `key` and `value`. Within
the body that `each` takes as an argument, the `incremented_hash` is being populated with the value that is currently
bound to the block parameter `key` and the return value of invoking the `+` method on the value that is currently bound
to the block parameter `value` with 1 as a parameter.

When we return this `incremented_hash` on the last but one line, this is actually the return value of the outer block,
the block that belongs to `map` and this is the return value that `map` will use in order to transform the calling array
and return a new array.

This code returns `[{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]` and it demonstrates the concept of transformation
and also blocks because `map` method uses the return value of the block in as the basis for transformation of the caller.
We can say that this code also demonstrates iteration because we iterate through the hash passed from the calling array
to `hsh` block parameter. And also hash element assignment because we use the `[]=` syntax to assign values to keys in
the `incremented_hash`.

=end
#21.
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
=begin
`each_with_object` method is called on the array `[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]` with the `[]` passed to it
as an argument. The method takes a block denoted by the keywords `do..end` and it also takes 2 block parameters,
`hsh`, to which at the time of execution each hash will be bound and `arr`, the so called memo object, this is the object
that was passed to the method as an argument and the object that the method will ultimately return.

Within the body of the bock `incremented_hash` is initialized to an empty hash, `{}`.
On the next line, the `each` method is called on `hsh`, a block is passed to it with block parameters `key` and `value`,
to which each key and value from the current hash will be bound to at the time of execution. Within the block that `each`
takes the `[]=` method is invoked, hash element assignment in order to populate `incremented_hash` with the key that is
currently passed to the `key` parameter and the return value of invoking the `+` method on value that is currently passed
to `value` and passing `1` as an argument.

On the one but last line the `<<` method is invoked, called also the shovel operator. This method appends `incremented_hash`
to the array.

The result that `each_with_object` returns is the array `[{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]`, this is our
memo object and the array that was initially passed in as an argument to the method and that we build along the way.

The concepts demonstrated here are: iteration, return value from the method, and hash element assignment/setter.

*from chatGPT:
prompt:
I will give you a piece of code followed by its description. Please judge this description in terms of accuracy of the language.
--I've redone it
The each_with_object method is invoked on the array [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}], and an empty array []
is passed as an argument, serving as the memo object.
The method takes a block defined by do..end, with two block parameters: hsh, representing each hash during iteration,
and arr, which is the memo object.

Within the block, an empty hash `incremented_hash` is initialized. The each method is then invoked on hsh,
with a block taking key and value as parameters. In this block, each key-value pair is used to populate incremented_hash
by adding 1 to each value.

The << method (shovel operator) is invoked to append incremented_hash to the array `arr`.
The final result returned by `each_with_object` is the modified array [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}],
representing the memo object that was initially passed and iteratively built.

Key concepts demonstrated include iteration, method return values, and hash element assignment.
=end

#22.
a = [1, 2, 3]
a.map { |x| puts x**2 }
=begin
`a` is initialized on an array of 3 elements, `[1, 2, 3]`
On line 2 the `map` method is invoked on the array that `a` references. This method takes a block with block argument `x`, to which each element
of the calling array is bound in turn at the time of execution. Within the block, denoted by `{}` the `Kernel#puts`
method is invoked and the return value of invoking on x the `**` method with 2 as argument is passed to `puts`.

Puts outputs the string representation of its argument to the console so the code in the block outputs 1, 4, 9 on
separate lines. The return value of this code is however a new array [nil, nil, nil]. The reason for this is that
`puts` always returns nil and since `puts` is the last statement executed in the block, the block's return value is nil`,
which  is then used by `map` as the basis for transformation of the calling array.

What `map` does is it transforms the caller according to the return value of the block.
In this case, the return value of the block is nil for each element and so `nil` will be used by map to return a new
array transoformed according to the return value of the block for each element.

This code demonstrates the concept of iteration because `map` is an iterating method and also transformation, because `map`
considers the return value of the block to return a new transformed array.
=end

#23.
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el   # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
=begin
`map` method is invoked on a nested array. This outer map takes a block, delimited by the keywords `do..end` and also
a block parameter `arr`. At the time of execution each inner array will be bound to `arr` First `[[1, 2], [3, 4]]`, then
`[5, 6]`.
Further, on line 2 `map` is called again, this time on `arr`. A `do..end` block is passed to `map`, with the block
parameter `el`.
Within the inner map block, an `if..else` control flow structure is used. It allows to conditionally execute code based
on whethera condition is true or false. An expression `el.to_s.to_i == el` follows the if keyword. This expression evaluates
if the element currently passed to `el` is an integer (we use validation of invoking on it `to_s` method and then `to_i` method
and then comparing it with the element that `el` if referencing). If this expression evaluates as `true` that means that the
element bound to `el` is an integer and then the `+` method is invoked on that element, so we add `1` to that integer.

If the statement evaluates as false though, so if the object we are working with is not an integer,
`map` method is invoked on the element bound to `el`, a block is passed to it with the `n` as a block parameter and
within the block the `+` method is invoked on the element currently referenced by the block parameter `n` with `1`
passed as an argument to it. In other words, if it's an array, we iterate over it and add `1` to each element.

This code will return `[[[2, 3], [4, 5]], [6, 7]] `.

The snippet demonstrates how `map` can be used at different levels to transform an array. `map` is concerned with the
return value of the block, which it uses to transform its caller. It returns a new array based on the return value of
the block.
=end

#24.
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
=begin
`map` method is invoked on the array literal [[1, 2], [3, 4]]. A `do..end` block is passed to map, with the block parameter `arr`,
to which each element of the array will be in turn bound at the time of execution. Within the block passed to `map`,
there is another `map` method invocation, on the array bound to `arr`. Within the inner `do..end` block each element
of the array pointed to by `arr` will be passed to the block parameter `num`. In the body of that inner block, the `*` method
is invoked on num, so the integer to which `num` is currently pointing will be multiplied by 2. The result of that
multiplication / the return value of invoking the `*` method on `num` will be passed to inner map in order to transform the `arr`.
Then each transformed `arr`,  ``[2, 4]`` and ``[6, 8]` will be used to transform the caller on line 1, [[1, 2], [3, 4]].

This code will return a new array `[[2, 4], [6, 8]]` and this is because `map` transforms the calling object according
to the return value of the block.

The concept demonstrated here is iteration and transformation, specifically how map uses return value of the block in
order to return a new, transformed array.

=end
#25.
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
=begin
`map` method is called on the nested array literal `[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]`. A `do..end block is
passed to `map`, with the block parameter `element1`, to which each inner array will passed in turn at the time of
execution, first `[[1], [2], [3], [4]]` will be passed and then `[['a'], ['b'], ['c']]]`. Within the outer `map` block, `each` method
is invoked on the element referenced by `element1`. Again, a `do..end` block is passed to it, with the block parameter
`element2`, to which each element from the array referenced by `element1` will be bound.
Subsequently, within the block that belongs to `each`, `partition` method is invoked on each `element2`, a block is passed
to the `partition` method, with the block parameter `element3`, to which each element from the array bound to `element2`
will be passed at the time of execution.

However, all that happens in the block does not matter because map transforms its caller according to the return
value of the block but on the second line `each` method is invoked on each array passed to `element`
and `each` method returns its caller, which is the return value of the block passed to `map and is then used for transformation. `map` will return a new array but with the
same elements as the calling array.

The concept represented here is return value of the block and how important it is to the return value of the method.
Map uses return value of the block as the basis of transforming the array it's invoked on while each is not concerned
with the return value of the block at all but it always returns its caller instead.
=end

#26.
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
=begin
`map` method is called on an array literal `[[8, 13, 27], ['apple', 'banana', 'cantaloupe']]`. A `do..end` block is passed
to it with the block parameter `arr`, to which each inner array will be bound in turn at the time of execution.

On line 2 `select` method is called on the array referenced by `arr`, a `do..end` block is passed to it with the block
parameter `item`, to which each element from the array that `arr` is pointing to will be bound.

First inner array has only integer objects, second array only string objects. The condition `if..else` on lines 3-7
is checking if the element referenced by `item` is an integer or a string. In first 3 cases, this is true so the if
branch will be executed and its return value will be passed to `select` From the first array, only `27` is greater than `13`
so the expression `item > 13` will evaluate false for the first 2 integers and true for the last integer, `27`. This integer
will be selected by `select` from the first array.
As for the second array, the `else` branch will be executed because the expression if item.to_s.to_i == item, which is
integer validation will evaluate false for all the elements in the array `['apple', 'banana', 'cantaloupe']`.
The `else` branch code is returning true or false, depending whether the size of the string referenced by `item` is greater
than 6 or not (the `<` method is invoked on the return value of `size` method invoked on the string that `item` is pointing
to). The return value of this expression is also the return value of the block and the return values will be `false`, `false`
and `true` respectively. Because the return value is true only for the last element, only this element will be selected
and placed in the new array by `select`.

Select returns `[27]` and `["cantaloupe"]`, which are then in turn used by `map` to transform the calling array and return
a new array.This code returns `[[27], ["apple"]]`.

The concept represented here is the return value of the block and iterating methods `map` and `select`, specifically how both
are concerned with the return value of the block but how they are using it in a different way. For `select` the truthiness
of the return value of the block is important, if the return value of the block evaluates as true, then the element is
selected and placed in a new array. `map` method however uses the return value of the block as the basis for transformation
and it returns a new, transformed array. The size of the array returned by`select` will be same or lesser than the size
of the caller. `map` always returns the array of the same size as the caller.
=end


#27.
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
=begin
In this code snippet, on the first line we call the `Array#select` method on the array of hashes, `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]`.
This method takes a block, the block parameter is called 'hash' and to this block parameter each hash from our calling array will be passed in turn.

Within the block that belongs to `#select`, the `all?` method is called on the hash passed to the block. This method also takes a block,
denoted by the words `do..end`. The block parameters, to which each hash key and value are passed subsequently, are called `key` and
`value`. Within the block belonging to the `all?` method, a statement `value[0] == key.to_s` is evaluated. This statement
will return `true` if the first character of a value passed to the block is equal to the return value of the `to_s` method invoked
on the key. If this statement returns `true` for all key-value pairs in the hash, then the `all?` method will return true, otherwise
it will return false.

Well this statement returns true for all key-value pairs only in the case of the last hash, `{ c: 'cat' }`.
This means that lines 2-4 will will evaluate as true for the hash { c: 'cat' } and false for the hash { a: 'ant', b: 'elephant' }.

The return values will be used by the select method to determine which element to select. The `select` method selects elements
from the caller based on the return value of the block. If the return value of the block is truthy, like in the case of
{ c: 'cat' }, then the element is selected and placed in a new array.

So this code returns [{:c=>"cat"}].
=end

#28.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
arr.select do |hash|
  hash.all? do |key, value|
    value.all? do |num|
      num.even?
    end
  end
end
=begin
feedback from Alli:
-focus on how the block's return value is used by the method
-don't write things that are a part of the `1st exam`
-focus on what they are asking about/for
=end

=begin
On line 1 an array of hashes is initialized to reference a variable `arr`.

On line 2 `select` method is invoked on `arr`. `select` takes a `do..end` block and a block parameter `hash`. On each
iteration a consecutive element from the calling array will be passed to the block and bound to `hash`, first
`{a: [1, 2, 3]}` will be passed, then `{b: [2, 4, 6], c: [3, 6], d: [4]}` and finally `{e: [8], f: [6, 10]}`.

Within the block that `select` takes as an argument `all?` method is invoked on the hash bound to `hash`, `do..end`
block is passed with the block parameters `key` and `value`, to which each hash key and value from `hash` will be bound
in turn at the time of execution.

Within the above block, `all?` method is called on the element that `value` is bound to, a block is passed to it as
an argument, with the block parameter `num`. Within the block `even?` method is invoked on all integers in turn
 bound to `num` and if all the integers in the array pointing to `value` are even, then the `all?` method retuns `true`.
This above is true only for `{e: [8], f: [6, 10]}`, the return value of that block evaluates as true only for that element.

This return value is then passed to select, which considers the return value of the block.
If it is truthy for a given element, `select` takes that element and places it in the new array.
Line 5, the return a truthy value only only for the hash `{e: [8], f: [6, 10]}`,
which means this is the element that will be selected by `select` and returned in a new array.

The return value of this code is `[{:e=>[8], :f=>[6, 10]}]`.

This snippet demonstrates how important the return value of the block is for iterating methods `select` and `all?`.
=end

#29
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end

#30
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd
p even
=begin
On line 1 we have multiple variable assignment. The return value of invoking the `partition` method on array literal
[1, 2, 3] is assigned to variables `odd` and `even`. The `partition` method takes a block with the block parameter
`num`, to which each element from the calling array will be in turn bound at the time of execution.

Within the body of the block, the `odd?` method is invoked on the element bound to `num`. If that element is even,
the method will return `true`, which will be the base for the partition method to place the number bound to `num` in the
first array, the array for which the block return value evaluates as true. The elements from the caller, for which the
block return value evaluates as false will be placed in the second array that partition returns.

Both of these arrays are assigned to `odd` and `even` so when we invoke the `p` method on last and one but last line
and pass `odd` and `even` to it respectively, the return value will be `[1, 3] ` and `[2]`

This code demonstrates how the `partition` method uses the return value of the block as the basis for splitting the
elements in the calling array into 2 inner arrays.
=end

#31.
experiment = [["???", "!!!", "?!?!"], ["select_me!", "please_select_me?", "how about_me?"], ["what does it mean to be a string?", 'true']]

experiment2 = experiment.each do |array|
  array.map { |string| string.include?('?') }
end

p experiment
p experiment2
=begin
On line 1 `experiment` nested array is initialized.

On line 2, the `each` method is invoked on it with a `do..end` block and block parameter `array`.

On the next line, `map` is called on the element bound to `array`, map is passed a `{}` block with the block argument
`string`. Within the block, the `include?` method is invoked on the string passed to `str` and `('?')` is passed as
an argument. `map` returns a new array based on the return value of the block, which evaluates as true for all
elements passed to `str`. Therefore, the return value of line 4 is `true, true, true` respectively.

The return value of line 4 doesn't matter though because each does not consider it but returns the calling object instead.

So when we invoke the `p` method on line 7 and 8 and pass `experiment` and `experiment2`, the output to the console, and
also the return value will be same for both lines, namely ` [["???", "!!!", "?!?!"], ["select_me!", "please_select_me?", "how about_me?"], ["what does it mean to be a string?", "true"]] `
=end

#32.
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
=begin
On line 1 an `array` is initialized and made reference `[1, 2, 3, 4, 5]`.

On line 3 `select` method is invoked on this array. A `do..end` is passed to it as an argument, with block parameter
`num`, to which each element of the `arr` will be in turn bound at the time of execution.

Within the block we have an `if` condition. The code placed after the `if` modifier is the invocation of the `Integer#odd?`
method on the number referenced by `num.` If the condition evaluates as true, then the `Kernel#puts` method is invoked
and the integer referenced by `num` is passed an as argument. This condition will evaluate as true in case if integers
1, 3, 5 but this does not matter actually because the `puts` method, after outputting the mentioned integers, returns
`nil`. So, the return value of the block is `nil` for integers 1, 3, 5 and `false` for 2, 4, 6.

The `select` method considers the return value of the block. If it is truthy, the element is selected and placed in
a new array. Here in this example, both nil and false are consired `falsy` values, that is why nothing is selected and
`[]` is returned by this code. The code prints `1`, `3` and `5` on separate lines.
=end

#33
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
end
p new_array
=begin
On line `arr` is initialized to `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 3 `new_arr` is initialized and made reference to the return value of invoking `select` method on `arr`.
Select is passed a `do..end` block with the block parameter `n`, to which each element of the calling array will be in
turn bound at the time of execution.

Within the block we invoke the `+` method on the integer bound to `n`. The return value of this action is evaluates as
true for every element of the calling array. This is important because `select` considers the return value of the block.
If the return value of the block is truthy for a given element, then this element will be selected and placed in a new
array.

So when we pass `new_array` to the `p` method on the last line, we can see that the array printed and returned is
`[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`, which is same as the `arr` initialized on line 1. This is because the block taken by
select an an argument returned a respectively 2, 3, 4, 5, 6, 7. 8. 9. 10, 11 respectively. These are all truthy values
becasue only `nil` and `false` are considered `falsy` in Ruby.
=end

#34.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
  n + 1
  puts n
end
p new_array
=begin
An `arr` is initialized to `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` on line 1.

On line 2, `new_array` is initialized to the return value of invoking `select` on `arr.` `select` takes a `do..end`
block with the block parameter `n`, to which each element of the calling array will be in turn bound at the time of
execution. Within the block, the `+` method is invoked on the integer bound to `n` first and then, on the last line
of the block the integer bound to `n` is passed as an argument to the `puts` method.

This coude will output to the console numbers 2-11 printed on separate lines.


When we invoke the `p` method on the last line and pass `new_array` to it as an argument, an empty array will be printed:
`[]`. This is because `select` method consideres the return value of the block. If the return value of the block for a given
element is truthy, then that element is selected and placed in a new array. The block's return value evaluates as false
for all elements in the calling array, that is why select does not select any elements from the calling array but
returns an empty array instead.

Concept demonstrated here is how important the return value of the block is for `select` as it decides about the return
value of this method.
=end

#35.
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
=begin
A syntactic sugar syntax `%w(jump trip laugh run talk)` is used to initialize an array of strings `["jump", "trip", "laugh", "run", "talk"] `
Main scoped variable `words` is pointing to that array.

On line 3 `new_array` is initialized to the return value of `map` invoked on `words`. `map` takes a `do..end` block with
the block parameter `word`, to which each element of the calling array, a string, will be in turn bound at the time
of execution.

Within the block `start_with?` method is invoked on the string bound to `word`. I will return true in case of `"trip"`
and `"talk"` and false in case of all other strings.

`map` is concerned with that return value of the block because it uses it for transformation. It returns a new array
based on the return value of the block so it will be `[false, true, false, false, true]`, this array will be returned
by `map` and assigned to `new_array`.

So when we pass `new_array` as an argument to the `p` method on the last line, `[false, true, false, false, true]`
will be output and returned.

This snippet demonstrates the concept of transformation. `map` method considers the return value of the block, which is
the basis for transformation that `map` performs. Besides,`map` always returns a new array of the same size as the
array that it was invoked on.
=end

#36.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
            n + 1
            end
p incremented
=begin
On line 1 variable`arr` is initialized to reference an array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

On line 3 `incremented` is initialized and assigned the return value of calling `map` on `arr`.
`map` takes `do..end` block with the block parameter `n` to which each element of the calling array will be in turn
bound at the time of execution.

Within the block `+` method is invoked on the integer bound to `n`. The return value of the block is 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
respectively. The return value of the block is very important for map because it uses is to to tranform the calling
array and return a new one, tranformed on the basis of the return value of the block.

So `map` returns `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`, which is then assigned to `increment`

When we pass `incremented` to the `p` method on the last line, `2, 3, 4, 5, 6, 7, 8, 9, 10, 11` is output to the console
and also returned.

This code is an example of the concept of tranformation because `map` is an iterating method that tranforms the object
it is invoked on according to the return value of the block. Besides `map` always returns a new array of size equal
to the calling array size.
=end

#37.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
end
p new_array
=begin
On line 1 variable `arr` is initialized to an array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 3 `new_array` is initialized and made reference the return value of invoking `map` on `arr`.
`map` is passed a `do..end` block with the block parameter `n`, to which each element from the calling array will be in
turn bound at the time of execution.

Within the block the `>` method is called on the integer bound to `n`. This method will return `true` or `false`, depending
whether the integer bound to `n` is greater than 1 or not. So in case of 1, this line of code will return false, and in
case of all the other integers, it will return true. These return values are also the return values of the block (because this is the last line in the block), and they
are all truthy but the first one.

'map' uses the return value of the block for transformation so because of the above return values, `map` will return
`[false, true, true, true, true, true, true, true, true, true] `, and this array will be saved to `new_array`.

So when pass `new_array` as an argument to the `p` method on the last line, we will see `[false, true, true, true, true, true, true, true, true, true] `
output to the console and also returned.

This snippet demonstrates transformation and the importance of the block's return value, specifically that `map`
is concerned with the return value of the block because it uses it for transformation.
Also, `map` returns a new array of the same size as the calling array.
=end

#38.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
  puts n
end
p new_array
=begin
On line 1 local variable `arr` is initialized to an array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On line 2, `new_array` is initialized to the return value of invoking `map` on `arr`. A `do..end` block is passed to
`map` with the block parameter `n`, to which each element of the calling array is bound in turn at the time of
execution.

Within the block first `the `>` method is invoked on the integer bound to `n`. This will return `false`` in case of
the first integer and `true` in case of all others. However, this is not the return value of the block.
The return value of the block is its last line, `puts n`. `Kernel#puts` method is invoked and the integer referred to
by `n` is printed out to the console. So all the numbers from the calling array are printed and
for every printed number `nil` is returned because `puts` always returns `nil`.

`map` will use this return value as the basis for transformation.
This code will output to the console each number on from the calling array on a separate line and return
`[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil] `, which will be assigned to `new_array`.

So when we use the `p` method on the last line and pass `new_array` to it as an argument, it will output and return
`[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil] `.

This demonstrates how important the block's return value is to the iterating method `map`. This method transforms the calling
object based on the return value of the block and it returns a new array of the same size as the calling array.
=end

#39
a = "hello"

[1, 2, 3].map { |num| a }
=begin
On line 1 a local variable `a` is initialized to reference a string object `"hello"`.

On line 3 the `map` method is called on array literal `[1, 2, 3]`. A `{}` block is passed to it, with the block parameter
`num`, to which each element of the calling array is bound in turn at the time of execution.

The last expression in the block is `a`, which points to `"hello"`. This is the return value of the block for each
element bound to `num`. This return value of the block is used by `map` for transformation.

Thefore this code returns an array `["hello", "hello", "hello"]`.

This code demonstrates the concept of transformation and the importance of the return value of the block.
`map` is concerned with the return value of the block, the block returns `"hello"` for each element in the calling
array, which then maps uses to transorm the calling array and return a new one. `map` always returns an array of the same
size as the array that it was invoked on.
=end

#40.
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
=begin
`select` is called on array literal `[1, 2, 3]`. `select` takes a `do..end` block with the block parameter `num`, to which
each element of the calling array is in turn bound in at the time of execution.

Within the block first the `>` method is invoked on the integer bound to `n`. This method returns false for all the
elements as none of the integers is greater than 5.

The next line is what constitues the return value of the block as it is the last line of code executed in the block.
It is a string object `"hi"`.

`Select` method is concerned with the return value of the block, specifically if it is truthy or falsey. If the return
value of the block evaluates as true for a given element, this element is then selected and placed in a new array.
In this code, the return value of the block is `truthy` for all the elements of the calling array, that's why all of
them will be selected and placed in a new array.

So this code returns a new array, `[1, 2, 3]`.

The concept demonstrated here is that of selection and how important the return value of the block is to `select`.
`select` method considers the return value of the block. If the return value of the block for a given
element is truthy/evaluates as true, then that element is selected and placed in a new array.
`select` returns a new array of the same size or of smaller size than the size of the caller.
=end

#41.
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
=begin
`count` method is used on an array literal `['ant', 'bat', 'caterpillar']`. `count` is used with a `do..end` block
and a block parameter `str`, to which each elemnent of the calling array is in turn bound at the time of execution.

Within the block `<` method is invoked on the return value of invoking the `length` method on the string object
bound to `str`. This expression, when evaluated returns `true` for the first 2 elements of the calling array and `false`
for the last element.

`count` returns an integer representing the number of elements for which the block returns a truthy value.
so code returns `2`.

The concept demonstrated here is the importance of the block as an argument to the method. `count` with no argument
and a block given, calls the block on each element and returns the count of elements for which the block returns
a truthy value.
=end

#42.
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

#43.
['ant', 'bear', 'caterpillar'].pop.size
=begin
`pop`method is invoked on array literal  `['ant', 'bear', 'caterpillar']`. This method removes the last
element and returns it. So we will get `"caterpillar"` out as a return value of invoking `pop`. On that return value
`size` method is called, and it returns the integer signifying the size of that returned string, which is `11`.

The fact that `size` method is called on the return value of `pop` method demonstrates a concept called `method chaining`.
Also, another concept is `mutation` because `pop` is a mutating method, it permanently changes the calling array.
Mutating methods usually have a `!` at the end but not all of them, like for example `pop`.
=end

#44.
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
=begin
`any?` is called on array literal `[1, 2, 3]`. A `do..end` block is passed to `any?`, with a block parameter `num`,
to which each element of the calling array is bound in turn at the time of execution.

Within the block `puts` method is invoked and the array element referenced by `bound` is passed to it as an argument.
so first `1` will be passed and it will be output to the console.

Next the line that gets executed is `num.odd?`, so the `odd?` method is invoked on the integer bound to `num`,
`1`. When this evaluates as true, also the block return value evaluates as true because this is the last line
in the block and so `any?` finishes execution, returning `true.` This is because `any?` considers the return value
of the block and if it evaluates as true if the block evaluates as true for  at least
one element.

The concept demonstrated here is iteration and the importance of the block's return value since `any?` uses it to know
when to return. It doesn't iterate over all elements but only until the block's return value evaluates as true, which
here is already the element at index 0.
=end

#45.
arr = [1, 2, 3, 4, 5]
arr.take(2)
=begin
On line 1 a local variable `arr` is initialized to point to an array, `[1, 2, 3, 4, 5]`.
On the next line `take` method is invoked on `arr`, and passed integer `2` as an argument.

This method will returns a new array containing the number of elements stipulated in the argument, `[1, 2]`. The method
is non-destructive so it does not mutate the caller.

The concept demonstrated here is extraction of several consecutive elements of an array without mutating the caller.
=end

#46.
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
=begin
`map` method is called on a hash literal { a: 'ant', b: 'bear' }. A `do..end` block is passed to map with 2 block
parameters, `key` and `value`, to which each key and value from the calling hash is in turn passed at the time of
execution.

Within the block we have an `if` statement. After the `if` modifier, there is an expression `value.size > 3` will be
be evaluates for every value bound to `value`. If this expression returns true, then the if branch is executed further,
returning the value bound to `value`. As `map` iterates over keys and values of the hash, the above mentioned block
returns `false` for ``'ant' and true for `'bear'`. These are the return values of the block, which are in turn used
by map to tranform the calling object and return a new array, with the applied changes.

So `map` returns `[nil, "bear"]`.

This code demonstrates how important the block's return value is to the iterating method `map`, specifically that its
return value depends on it. `map` method considers the return value of the block as it is the basis for transformation
that it performs. `map` always returns a new array of the same size as the object that it was invoked on.
=end

#47.
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
=begin
`map` method is invoked on the array literal `[1, 2, 3]`. A `do..end` block is passed to it, with the block parameter
`num`, to which each element of the calling array is passed at the time of execution.

Within the block body we have  `if..else` statement, which will evaluate if the integer passed to `num` is greater than
`1` and if it is, this integer will be output to the console but the `puts` method and `nil` is the return value
of the block as it is the last statement executed in the block.

In case that the integer bound to `num` is not greater than `1`, so in case that condition evaluates as `false`,
then the `else` branch is executed and the integer bound to `num` is returned. This is also the return value of the
block as it's the last expression executed.

So, for the integer `1` bound to `num`, if `if..else` condition will evaluate as `false`, and so the  integer bound
to `nym` is used by `map`, in case of `2` and `3`, the condition evaluates as `true` and both of these numbers are
output to the console but the return value of the block (which `map` uses) is `nil`.

Therefore this code returns `[1, nil, nil] `.

The concept demonstrated is the importance of the return's block value for the iterating method `map.`
`map` considers the return value of the block as it uses it as the basis for
transformation of the calling array.`map` always returns a new array of the same size as the array that it was invoked on.
=end

#48.
[123, 432, 543, 642, 543, 256].sort_by do |num|
  num.digits.first
end
=begin
`sort_by` is used on an array literal `[123, 432, 543, 642, 543, 256]`. A `do..end` block is passed to it with the block
parameter `num`, to which each consecutive element from the array is bound at the time of execution.

Within the block `first` method is invoked on the return value of invoking `digits` method on the integer bound to
`num`. This is the basis/the criterion on which the integers in the caller need to be sorted. `digits` will split
the digits in the integer bound to `num` but this method returns an array of integers in reverse order, so for
`123`, it will be `[3, 2, 1]` and so on. This of course has consequences when it comes to sorting as the numbers
will be sorted accourding to the first number in the array returned by `digits`, so in case of the first number,
the integer considered for sorting will be `3`, in case of the 2nd number, `2`, in case of the third number `3`, etc.

So this code will return `[432, 642, 123, 543, 543, 256] `.


This code demonstrates the concept of sorting and the importance of the return value of the block for the `sort_by`
method as the method uses the return value of the block for each element as the basis on which the numbers are sorted.

This code also demonstates the concept of `method chaining` which is when a method is invoked on the return value of calling
another method on an object.
=end

#49.
contacts = {
  Jenny: '230-867-5309',
  Skylar: '432-555-5555',
  joe: '230-432-1234',
  Jimmy: '123-123-1234'
}

contacts.sort_by do |_, number|
  number.split('-')[0]
end
=begin
On line 1 local variable `contacts` is initialized to a hash object with 4 keys and values. Keys are symbol objects,
values are string objects.

`sort_by` method is invoked on `contacts` on the next line. A `do..end` method is passed to it, with 2 parameters,
to which each key and value is in turn bound to at the time of execution. The block parameters are `-`, which is
the convention for a parameter that we are not going to use, and `number`, this is the parameter that each value/string
from the hash will be bound.

The block passed to `sort_by` is very important because it contains the basis for sorting the calling hash. Within the
block the `[]`/string element reference method is used on the return value of the `split` method invoked on the string
passed to `number`. The block will return in turn the character/integer at index 0 of each array returned by `split`,
so it will return 2, 4, 2, 1. These are return values of the block, which will be used by `sort_by` to return a new
nested array. This outer array contains each hash from the caller in the sorted on the criterion of the first number
in each value.

This code returns a nested array, `[[:Jimmy, "123-123-1234"], [:Jenny, "230-867-5309"], [:joe, "230-432-1234"], [:Skylar, "432-555-5555"]]`.

This code demonstrates the concept of sorting and the importance of the return value of the block for the `sort_by`
method as the method uses the return value of the block for each element as the basis on which the numbers are sorted.

This code also demonstates the concept of `method chaining` which is when a method is invoked on the return value of calling
another method on an object.
=end

contacts = {
  Jenny: '230-867-5309',
  Skylar: '432-555-5555',
  joe: '230-432-1234',
  Jimmy: '123-123-1234'
}

contacts.sort_by do |name, _|
  name.capitalize
end
=begin
Local variable`contacs` is initialized to a hash with 4 keys and values, keys are all Symbol objects, values are Strings.

`sort_by` is invoked on `contacts` on line 3. A `do..end` block is passed to it, with the block parameters `name` and `-`,
to which each key and value is bound in turn at the time of execution.

`-` is the convention for a block variable that is unused.

Within the block the `capitalize` method is invoked on the key passed to `name`. This means that the names are to be
sorted on the basis of capital letters first, so for example `J` comes before `j`, as in the ASCII table. This can be
verified by calling the `.ord` numbers on both of them. For `J` it's 74, for `j` it's 106.

The return value of this code is a nested array `[[:Jenny, "230-867-5309"], [:Jimmy, "123-123-1234"], [:joe, "230-432-1234"], [:Skylar, "432-555-5555"]] `,

This code demonstrates a few things. first, `-`, which is the convention for a block variable that is unused.
More importantly it demonstrates sorting, specifically how `sort_by` uses the return value of the block for each
element in order to sort the elements in the calling object.
=end

#51.
hash = { chris: '510-204-5555', sam: '510-909-5526', adrienne: '650-433-2112' }

hash.sort_by do |name, number|
  p name.length * number.split('-')[2][0].to_i
end
=begin
On line 1 local variable `hash` is initialized to a hash with 3 elements, all keys are Symbol class objects, all values
are Strings. A `do..end` block is passed to `sort_by` with block parameters `name` and `number` to which each key and
each value are bound in turn at the time of execution.

Within the block, the `p` method is invoked and the expression `name.length * number.split('-')[2][0].to_i` is
passed to it. The argument passed to `p` is the return value of invoking the length method on the value bound to `name`
(this method call returns an integer) on which in turn the `*` method is invoked. The `*` method is passed an argument
that is the return value of the `to_i` method called on the return value of invoking the string element string element
reference method `[]`, called on array elements reference called on the return value of `split`.

For the first element key value pair, for `chris`, the `lengh` method returns integer `5`, for the '510-204-5555' the
`split` method returns `["510", "204", "5555"] `, the `p[2]` method returns `"5555"`, the `[0]` method returns
string `"5"`, the `to_i` method returns integer 5. So we have an expression 5 * 5 passed to `p`. This outputs to the
console `25` and returns 25. This is the return value of the block for for the first key-value pair in the calling hash.

The subsequent return values are `15` and `16` and according to these values, the return values of the block the calling
array will be sorted.

This code returns a nested array`[[:sam, "510-909-5526"], [:adrienne, "650-433-2112"], [:chris, "510-204-5555"]]`.

This code demonstrates chaining of the methods so invoking a method on the return value of another method(paragraph 2)

It also demonstrates the concept of sorting and the importance of the return value of the block for the `sort_by`
method as this method uses the return value of the block for each element as the basis for sorting the objects in the
caller. `sort_by` returns a nested array of the same size as the caller.
=end

#52
words = %w(cantaloupe apple durian bananas)

# default uses <=> to compare collection elements
words.min #SORTS LEXICOGRAPHICALLY
words.min(2)

# with a block
words.min { |a, b| a.size <=> b.size }
words.min(2) { |a, b| a.size <=> b.size }
=begin
On line 1 a local variable `words` is initialized to `["cantaloupe", "apple", "durian", "bananas"] `, using syntactical
sugar syntax `%w(cantaloupe apple durian bananas)`.

On line 4 the `min` value is called without an argument or a block on `words` array.
This returns the smallest element based on lexicographical order, which is `"apple".`
Whe we call the same method with an argument 2 and a block, the return value is `["apple", bananas]`, again this is
according to the lexicographical order so `a` comes first, then `b`, etc.

When we invoke the same method without an argument but with a block, the logic within the block is defining how we
want the elements to be compared. The spaceship operator `<=>`, which is a method is used and this operator is invoked
on the return value of the `size` method invoked on the element bound to `a` and `b`. This returns `"apple"`.

When we call the same method with an argument, `2`, and without a block ()on penultimate line) the returned object is
an array, `["apple", "bananas"]` because the `<=>` methods compares the elements lexicographically, returning - 1
if the first element is smaller, 0 if they're equal and 1 if the first element is greater. Therefore the `min` method with
integer `2` passed as an argument returns an array `["apple", "bananas"]`. These 2 elements are smallest lexicographically.

As for the last line, it returns `["apple", "durian"]` because these 2 elements are smallest when we compare them by size.

The concept demonstrated here is how important the return value of the block is and that we can be more intentional
as to how we want to employ the method to give us the return values based on our specific requirements. It also demonstrates
the difference between using the `min` method with or without an argument and with or without a block.
=end

#53
words = %w(cantaloupe apple durian)

# sort by amount of vowels
words.min_by { |word| word.count("aeiou") }

words.min_by(2) { |word| word.count("aeiou") }

# #54.
# def add_one_to(nums)
#   0.upto(nums.length) do |i|
#     nums[i] += 1
#   end
#   nums
# end
#
# numbers = [0, 1, 2, 3, 4]
#
# p add_one_to(numbers)
# p numbers
#
# ```
#
# ```ruby
# #55.
# def test(b)
#   b.map {|letter| "I like the letter: #{letter}"}
# end
#
# a = ['a', 'b', 'c']
# test(a)
#
# ```
#
# ```ruby
# #56.
# [1, 2, 3].reject do |num|
#   puts num > 2
# end
#
# ```
#
# ```ruby
# #57.
# { a: "ant", b: "bear", c: "cat" }.include?("ant")
#
# ```
#
# ```ruby
# #58.
# { flour: '1c', sugar: '.5c', eggs: 2 }.first(2)
#
# ```
# 58.
arr = [-10, nil, 'false', [], true]

selected = arr.map do |element|
  element
end

p selected
p selected.size

# `Array#map` method transforms the argument array according to the return value of the block and returns a new array.
# In this case, the return value of the block for each element passed to it, is the element itself.
#
# That is why each element will be returned by the block and used to transform the argument array, except that in this
# case we don't see any transformation because the array that `map` returns looks the same as the argument array.

# The array that map returns is stored in `selected`. When we print `selected` on penultimate line,
# we see ``[-10, nil, 'false', [], true]` so we see that `arr` and `selected` contain the same elements.

# When we print the size of `selected` on the last line, it's going to be 5,
# just like the size of the original array on the first line.
#
# This is because `map` returns and array that is of the same size as the original array on which `map` was called.

# This snippet represents the concept of transformation.


# 59.
# snippets from Ali
# Write a method that takes a nested array of sub-arrays of integers and returns a new array
# with each nested array sorted into an additional two sub-arrays with the the even integers in the first sub-array
# and the odd integers in the second.

# -first even, then odd
# def odd_and_even(arr)
#
#   arr.map do |subarray|
#     subarray.partition do |number|
#       number.even?
#    end
#   end
#
# end
#
# arr1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# p odd_and_even(arr1) == [[[2], [1, 3]], [[4, 6], [5]], [[8], [7, 9]]] ####[[2], [1, 3]] AND [[4, 6], [5]], [[8], [7, 9]]
#
# arr2 = [[1, 3, 5], [7, 9, 11]]
# p odd_and_even(arr2) == [[[], [1, 3, 5]], [[], [7, 9, 11]]]

# puts
#60
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2| # element2 is in turn [1][2][3][4]["a"]["b"]["c"]
    element2.partition do |element3| # it is an array so we can call partition on it
      element3.size > 1
    end
  end
=begin
  Explain the return value of this code.

The return value of this code is a new array  `[[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]`.

This is because the `Array#map` method transforms the calling array according to  the return value of the block
passed to it. The return value of the block is `[[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]` ,
since the `Array#each` method was invoked on each array passed to the block parameter `element1`.
each`  does not use the block’s return value but instead returns the object that it was called on.
This object, `[[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]` is now used by map for transformation, on line 1.

It could be added that it doesn’t matter that the `partition` method is invoked on the array passed to the
block parameter `element2`  on line 3 and also that then the partition method is passed a block with the
block parameter `element3` and then in turn the `size` method is called on the array passed to `element3` and that returns in turn integer 1, 1, 1, 1, 1, 1, 1 and then finally that the `<` method is called on that integer each time and this whole expression `1 < 1` returns `false` each time.  None of this matters because `each` doesn’t use the block’s return value.

The concept represented here is `transformation` and `iteration`, both `map` and `each` are iterating methods
but the first one uses the blocks return value to transform the caller and return a new array, while the
second does not use the blocks return value and returns the caller instead.
=end

#61
a = ["1","2","11","13","14"]
p a.sort
=begin
This code when printed will output `["1", "11", "13", "14", "2"] ` because sort compares strings character by character
according to their value in the ASCII table. So `"1"` will be followed by `"11"` because the second character that is
of the lowest value, of all second characters in all the strings is 1. Then the second characters are compared and that's
why `"12"` will come next and then `"13"` and `"14"`. Only then we look again at the first character, a character that is greater
than the previous first character used for comparison, `"1"`. Now the string is `"2"` and this is the string with the greatest
value of all of the strings in the calling array. That is why the string `"2"` comes as last, which would not happen if
we were comparing integers.
=end


#62
words = %w(card soap knife crab soapy coin sand king kill)
words.sort
=begin
The first line is using syntactic sugar `%w` to create an array of strings so the return value of this line is
`["card", "soap", "knife", "crab", "soapy", "coin", "sand", "king", "kill"] `.

The second line will sort these strings alphabetically using the `sort` method, which in turns uses the `<=>` symbol,
called rocket operator, to compare the strings. How the rocket operator works is that it compares every character in the
string and based on that decides which string will be considered smaller and which greater. If the strings are equal up
to the last character but one string is longer, the longer string will be considered greater. So the `<=>` will check
for the value of each character in the ASCII table and return -1 if the first character is lesser in value that tne second,
0 if they are equal, and 1 if the second character is greater.

The last line of this code will return `["card", "coin", "crab", "kill", "king", "knife", "sand", "soap", "soapy"].`
=end

#63
selected_foods = [['apple', 'kiwi'], ['artichoke', 'broccoli']].select do |arr|
  arr.select do |food|
    food.start_with?('a')
  end
end
p selected_foods
=begin
mine:
On the first line `selected_foods` is initialized to the return value of invoking `select` method on a nested array
[['apple', 'kiwi'], ['artichoke', 'broccoli']]. `select` takes a block with the block parameter `arr`, to which each
inner array will be passed in turn when `select` is invoked. So first, the array `['apple', 'kiwi']` and then ['artichoke', 'broccoli'].
will be passed to it. We can say that this is outer iteration.

Then the inner iteration starts. Within this inner iteration, select method is called in turn on each above mentioned
inner arrays, a block `do..end` is passed to it and within the block body `start_with?` method is invoked on each
element that is currently passed to the block parameter `|food|` and the string `"a"` is passed to it as an argument.

Select selects elements of an array based on the return value of the block, so if the block returns a truthy value, the
element will be selected. The inner select therefore selects `"apple"` from the first array and `"artichoke"` from the
second. These two elements will be in turn used by the outher select (on the first line) so that select will return
[[apple], [artichoke]] and it is this return value that will be saved to `selected_foods`.

So last line will output `[[apple], [artichoke]]`.

Elizabeth's:
#select method is invoked on array [['apple', 'kiwi'], ['artichoke', 'broccoli']] , the return value of this method is
assigned to the variable `selected_foods`.
The select method takes a block variable `arr` where each inner array that’s being processed is bound to in turn.
Inside the body of `select` method is another `select` method that is invoked on inner array `arr` and each element
of this inner array is bound to the block parameter `food` when the `arr` is being processed.

Inside the body of the second select method, `start_with?` method is invoked on the `arr` element that has been passed
to the block parameter `food`. The `start_with?` method has been passed an argument `"a"`.
This checks if `"a"` is the first character of the element passed to the `|food|` block parameter.

If this evaluates as true, then the element is selected by the inner `select` method. The select method looks at
whether the return value of the block is truthy and if it is, it selects the element and places it in a new array.
When the start_with? method returns, a truthy value is returned and passed to inner select in case of "apple" and
falsey in case of "kiwi".  In case of the second `arr`, a truthy value is returned passed to select in case of
"artichoke" and a falsy value in case of "broccoli".
So the inner select will return in turn ["apple"] and ["artichoke"].

Both of these are truthy values so when evaluating each `arr` on the first line of the code, outer `select` will take
this return value of the inner select and use it to select elements of `arr`.
Both elements passed to `arr` will be selected and so when we print `selected_foods` on the last line,
we will see [['apple', 'kiwi'], ['artichoke', 'broccoli']].

second try:
On the first line the Array#select method is called on a nested array. This method takes a block denoted by words
do..end and a block parameter |arr|, to which each inner array will be bound in turn. Within the body of the block,
select is called again, this time on arr so first on array ["apple", "kiwi"] and then on array ["artichoke", "broccoli"].
The block passed to the method has a parameter |food|, to which each element of arr will be passed in turn and
the code within the block body will be executed.

Inner select, on line 2, returns ["apple"] and ["artichoke"] because for those 2 elements the start_with? method
returns true. Since selects cares about the return value of the block and the return value is true for these 2 elements,
these elements are selected and placed in a new array [["apple"], ["artichoke"]].
This new array is then used by the outer select, on line 1.

Since both of these arrays are truthy values, outer select selects each arr according to the return value of the block
and so it will select all the arrays from the caller. This return value of invoking select is then saved to
selected_foods and when we use the p method on the last line and pass selected_foods as an argument,
[['apple', 'kiwi'], ['artichoke', 'broccoli']] is output. the `p` method always prints to the console the object
passed to it an argument and then returns that object.

The concept represented here is selection, specifically the fact that select uses the return value of the block
in order to select elements from the caller and place them in a new array.
=end

#64
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
=begin
Array#any? method is called on array object [1, 2, 3]. A block delimited by keywords `do..end` is passed to `any?`
with the block parameter `num`.
Each consecutive element from the calling array will be bound to `num` at the time of execution.
Within the body of the block first the `Kernel#puts` method is invoked and `num` is passed as an argument to it.
This will output 1 to the console.

After that, on the last line of the block, the odd? method is invoked on num. This method returns `true` if we have
at least one odd number in the calling array.  Once the last statement in the block evaluates as true for the
first element of the array, `1`, any? will return `true` without evaluating subsequent elements of the array.
So this code outputs `1` and returns `true`.

The concept represented here is `iteration` as well as `return value of the block` and how it is used by a method.
any? checks if the return value of the last line of the block is `truthy` and it returns true if it is.
The method returns `true` and stops iterating so the block will not be executed for the subsequent elements of the array.
=end

#65 redoing with remarks from Allister about putting more code references because there's a lot going on here
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
=begin
`Array#select` method is called on an array of 2 hashes, [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]. A block denoted by
the keywords `do..end` is passed to it, with the block parameter `hash`. Within this outer block, `all?` method is called
on each hash, so first on { a: 'ant', b: 'elephant' } and then on { c: 'cat' }. `all?` takes a block, denoted with the keywords
do..end and block parameters `key` and `value` to which at the time of execution each key and each value from the hash
will be passed. Within the inner block, the block that belongs to `all?` a statement value[0] == key.to_s is executed for
each key-value pair in the hash. This statement will evaluated as true if the first character in the value is equal to
the return value of `to_s` method called on the corresponding key. `all?` will take the return value of the block and,
if it evaluates as true for all key-value pairs in the processed hash, then `all?` will return true for the processed hash,
otherwise it will return false.
So here in this code `all?` will return false  for { a: 'ant', b: 'elephant' } and true for { c: 'cat' } because only in
{ c: 'cat' } the statement value[0] == key.to_s will evaluated as true. This true return value in in turn used by outer
`select`, on line one. `select` considers the return value of its block, if the return value for a given element, in this
case `hash` evaluates as truthy, that element is selected and placed in a new array.
So the return value of this code is [{ c: 'cat' }].

The concept represented here is that of iteration, both select and all? are iterators. Another concept is the return
value of the block and how it is used by a method. `all?` considers the return value of the block for each element it
processes and for all the processed elements the return value has to be truthy in order for the method to return `true`
As for select, it considers the return value of the block as well, if it is truthy for a given element, `select` will
take that element and place it in a new array, which will be ultimately returned.
=end

#66
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
end
=begin
Arrray#map method is called on the array literal [1, 2, 3]. The method takes a block, (delimited by do..end ) with
block parameter num, to which each consecutive element will be in turn bound at the time of execution.
Within the block we have a conditional `if..else` statement, a control flow structure that allows us to conditionally
execute code based on whether the condition is true or false.

The `if` keyword is followed by an expression `num > 1`, in other words the `>` method is called on num with 1 as
an argument passed to it. If this expression evaluates as true, the Kernel#puts method is invoked and num is passed to it
as an argument. Otherwise, if the condition evaluates as false, the else branch is executed and num is returned from the block.

This code will output 2 and 3 to the console and it will return  [1, nil, nil].
This is because map returns a new array, transformed according to the return value of the block.
In this case, the return value of the block is 1 for the first element, since 1 is not greater than 1 and so it gets
returned on line 5. This is the return value of the block for the first element of the calling array.
Then, the return value of the block for the second and third element is nil, this is because the last executed
expression in the block is puts num, and the puts method always returns nil.


* If the integer object referenced by num is bigger than 1 , the if branch is executed. Otherwise the else branch is executed.

When the if statement is executed, the puts method is invoked, outputting the integer object bound to num and returning
nil back to the map method. When the else statement is executed, the integer object referenced by num is returned and
nothing is output.
=end

words = %w(cantaloupe apple durian bananas)

words.min
words.min { |a, b| a.size <=> b.size }


words.min(2)
words.min(2) { |a, b| a.size <=> b.size }