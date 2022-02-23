# Write a method that takes a string argument, and returns true if all of
# the alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.

# Explicit requirements:
# -a method that takes a string argument and returns true/false if all the alphabetic characters are uppercase, false if otherwise

# Data structures:
# -input: a string
# -output: a boolean - true/false

# Algorithm
# -split the string into an array
# -look at every character
# -check if each character is uppercase (change the case, as you're doing, and compare to the original character)
# -if all of them are upperscase, then return true
# -otherwise return false

# function isUppercase(str){
# const uppercaseChars = [...str].filter(char => char.toUpperCase() === char);
# return uppercaseChars.length === str.length;
# }

# console.log(isUppercase('t'));
# console.log(isUppercase('4SCORE!'));
# console.log(isUppercase(''));


# // a = [:foo, 'bar', 2, :bam]
# // a1 = a.select {|element| element.to_s.start_with?('b') }

def uppercase?(str)
  array = str.chars.all? { |char| char == char.upcase }
end

# // # const char = 'a';
# // # if (char.toUpperCase() === char) {
# // #   console.log(`Char is uppercase`);
# // # } else {
# // #   console.log(`Char is lowercase`);
# // # }
# //
p uppercase?('t') #== false
p uppercase?('T')# == true
p uppercase?('Four Score')# == false
p uppercase?('FOUR SCORE')# == true
p uppercase?('4SCORE!')# == true
p uppercase?('') #== #true

# In general, it's better to avoid including iplementation details in your algorithm.
# There are some areas where this can't really be avoided, like with conditional branching and looping.
# A question I see a lot, (in particular to looping) it's better to avoid specifying which loop you'll use in your algorithm.
# I mentioned `filter` above, because I wanted to indicate that my `uppercaseChars` variable was going to hold an array.
# The rest of my algorithm (my return line) depended on that data structure.
# - So my use of filter completely restricted my solution from then on out, because filter returns an array.

# ['a', 'B', 'c']
# start iteration over input
#   (0: 'a';   1: 'B';    2: 'c')
#   if current chracter is a capitalized character,
#     print the current character.
# end iteration
