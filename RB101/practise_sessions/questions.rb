require 'date'
p Date.new.strftime("%A, %b %d") # => "Monday, Jan 01"

# 1. Create a hash, in which the keys are elements of this array and values are indexes of those elements
%w(cat dog wombat)
hash = Hash.new
%w(cat dog wombat).each_with_index { |item, index|
  hash[item] = index
}
hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}

# 2.shortcuts, quick way of creating objects
p %w( hello there ) # an array of strings
p %(just a string) # just a string
p %/this is also a string/
p %s(symbolic) # a symbol
p (1..10).to_a.shuffle # an unordered array

random_str = (0..8).map {(65 + rand(61)).chr}.join
p random_str
# (0..8) - creates an array of 8 numbers
# (0..8).map - we will transform these numbers into characters
# (65 + rand(61) - generates a random characters between 65 and 126
#  .chr converts the integer into its character representation
#  .join joins the array so that we have a string

# First, we create an array with 8 elements by using a range (i.e. (0...8)).
# Then, we change each one of those elements by mapping through the array.
# And as the value replacing the element, we generate a random character.
# The character generation picks any number between 65 and 126 and calls
# chr on it to convert the int into its character representation.