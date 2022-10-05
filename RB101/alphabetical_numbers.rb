# Alphabetical Numbers
# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:
#
# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
# thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen


# PEDAC
# -write a method that takes an Array of Integers between 0 and 19
# -the method returns an Array of Integers sorted based on the English words for each number
# - eight - E
# - eighteen - E
# - eleven - E
# - fifteen - F
# - five - F
# - four - F
# - fourteen - F
# - nine - N
#
# Examples
# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
#
# Data Structures
# input: an array of Integers
# output: an array of Integers
#
# Algorithm
# -create a hash with keys and values where
# -keys are words and values are digits, e.g. { one: 1 }
# -initiale result value
# -iterate over the created hash and
# -sort the keys alphabetically
# -for those values that are passed as arguments, select keys and
# -insert them into the result array
# -so I may have an argument (1..3) and my hash { one: 1, two: 2, three: 3 } etc.
# -the result should be [1, 3, 2] because sorted keys are [one:, three: two:]
# -I am sorting alphabetically the keys in the hash but inserting only the values to the result array

def alphabetic_number_sort(array)
  result = {}
  reference = { "zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10, "eleven": 11, "twelve": 12, "thirteen": 13, "fourteen": 14, "fifteen": 15, "sixteen": 16, "seventeen": 17, "eighteen": 18, "nineteen": 19 }
  reference = reference.sort_by{ |k,v| k } # this gives me [[:eight, 8], [:eighteen, 18], [:eleven, 11], [:fifteen, 15], [:five, 5], [:four, 4], [:fourteen, 14], [:nine, 9], [:nineteen, 19], [:one, 1], [:seven, 7], [:seventeen, 17], [:six, 6], [:sixteen, 16], [:ten, 10], [:thirteen, 13], [:three, 3], [:twelve, 12], [:two, 2], [:zero, 0]]
  reference.each do |k,v|
    p "this is my key #{k} and this is my value #{v}" # "this is my key eight and this is my value 8"
    if array.include?(v)
      result[k] = v
    end
  end
  p "This is the result #{result}"
    result.values
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
p alphabetic_number_sort((1..3).to_a) == [1, 3, 2]

puts ""
# Algorithm 2
# initialize result array
# -define a reference hash
# -iterate through the input array and delete the key and value pairs for values from the array that are not there in the hash
# -sort the hash by the keys and output values

def alphabetic_number_sort(array)
  result = []
  reference = { "zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5,
    "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10, "eleven": 11,
    "twelve": 12, "thirteen": 13, "fourteen": 14, "fifteen": 15, "sixteen": 16,
    "seventeen": 17, "eighteen": 18, "nineteen": 19
  }
  reference.each do |k, v|
      reference = reference.delete_if{ |k,v| !array.include?(v)}.sort_by{ |k,v| k }
  end
  reference.each { |arr| result << arr.last }
  result
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
p alphabetic_number_sort((1..3).to_a) == [1, 3, 2]

puts ""

puts "ls solution"
# ls solution
NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)


def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] } # |number| so [1, 3, 2], these numbers are our indices
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
p alphabetic_number_sort((1..3).to_a) == [1, 3, 2]

# what's the return value of the block?
p NUMBER_WORDS[1] #= "one"
p NUMBER_WORDS[2] #= "two"
p NUMBER_WORDS[3] #= "three" and these strings are the return value of the block which is passed to sort_by and they are SORTED ALPHABETICALLY

# The secret to solving this problem is to use a data structure of some kind
# (NUMBER_WORDS in this case) to map numbers to their English names
# coz we can actually use numbers as our indices to extract the particular word
# from the data structure(NUMBER_WORDS) that we've created.
#
#  Once you've done this, read the documentation for Enumerable#sort_by,
#  and construct a call that sorts the numbers by each number's corresponding English name.

puts ""

# other solutions
def alphabetic_number_sort(arr)
  words_array = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
  "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen",
  "nineteen"]

  alpha_words = arr.map do |int| # passing [1, 2, 3]
    words_array[int] # int is also the index so -- replacing 1, 2, 3 with words, this will give us [one, two, three]
  end

  numeric_sorted = alpha_words.sort.map do |word| # sort will give me ["one", "three", "two"], map will transform words into their indexes
    words_array.index(word)
  end

  numeric_sorted
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
p alphabetic_number_sort((1..3).to_a) == [1, 3, 2]

puts ""


ENGLISH_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
INTEGERS = (0..19).to_a
INTEGERS_TO_WORDS = INTEGERS.zip(ENGLISH_WORDS).to_h

def alphabetic_number_sort(arr)
  arr.sort_by { |int| INTEGERS_TO_WORDS[int]}
end


p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
p alphabetic_number_sort((1..3).to_a) == [1, 3, 2]

puts ""

# Further exploration
# For an extra challenge, rewrite your method to use Enumerable#sort

WORD_VALUES = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(int_keys)
  pair_chart = int_keys.zip(WORD_VALUES)
  p pair_chart
  pair_chart.sort { |(a,b),(c,d)| b <=> d }.map {|a,_| a }
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
p alphabetic_number_sort((1..3).to_a) == [1, 3, 2] # this method fails if the input array does not start form zero

puts ""

def alphabetic_number_sort(num_arr)
  words = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten,
    eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen,
    eighteen, nineteen)
  sorted_pair_arr = words.zip(num_arr).sort
  p sorted_pair_arr
  sorted_pair_arr.map {|pair| pair[1]}
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
p alphabetic_number_sort((1..3).to_a) == [1, 3, 2] # this method fails if the input array does not start form zero

puts ""

NUM_WORDS = %w( zero one two three four
five six seven eight nine ten eleven twelve
thirteen fourteen fifteen sixteen seventeen
eighteen nineteen)

def alphabetic_number_sort(array)
  array.sort { |number1, number2| NUM_WORDS[number1] <=> NUM_WORDS[number2] }
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
p alphabetic_number_sort((1..3).to_a) == [1, 3, 2] # this method fails if the input array does not start form zero

# Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?
# possible explanation:
# Since the array we want to sort is initialized within the method call itself,
# there isn't actually anything to mutate in terms of scope beyond the method itself.
# At least, after the method call, the only way to access the result is
# by assigning the return value to some other variable like...
# sorted_arr = alphabetic_number_sort((0..19).to_a)
# Therefore calling sort_by! is pointless, because there's no variable to mutate
# as it was initialized within the method call and has only that scope
# If the method call looked something like this...
#
# arr = (0..19).to_a
# alphabetic_number_sort(arr)
#
# Then using sort_by! would be acceptable, but only if the method itself
# ended in something that returns nil, so you're ONLY mutating
# and not returning a value.
