# Write a program that will take a string of digits and return all the possible consecutive number series of
# a specified length in that string.

# For example, the string "01234" has the following 3-digit series:
# "01234" => "01234"
#             ^^^  starting at index 0 take the 3 digit substring => 012
#              ^^^ starting at index 1 take the 3 digit substring =>  123
#               ^^^ starting at index 2 take the 3 digit substring =>  234

# 012  => take this slice
#  123 => next iteration
#   234 => always slice 3 chars, until the string length - 3

# substrings of 3 characters
def substrings(str)
  result = []
  starting_index = 0

  while (starting_index <= str.length - 3)
    num_chars = 3
    while (starting_index <= str.length - 3)
      substring = str.slice(starting_index, num_chars)
      result << substring
      starting_index += 1
    end
  end
  result
end
p substrings("01234") == ["012", "123", "234"]
substrings = substrings("01234")

nums = substrings.map! { |string| string.chars.map { |char| char.to_i } }
p nums

# How to convert this and not lose the leading 0
# -convert to chars first
# -map each element to_i

# Likewise, here are the 4-digit series:

# For example, the string "01234" has the following 3-digit series:
# "01234" => "01234"
#             ^^^^  starting at index 0 take the 3 digit substring => 0123
#              ^^^^ starting at index 1 take the 3 digit substring =>  1234

# substrings of 4 characters
def substrings(str)
  result = []
  start = 0
  num_of_chars_to_slice = 4

  while start <= str.length - num_of_chars_to_slice
      result << str.slice(start, num_of_chars_to_slice)
      start += 1
    end
  result
end

p substrings("01234") ==  ["0123", "1234"]

puts
puts "all possible substrings"
# now generate all possible substrings
# the smallest substring would be of size 1

def all_substrings(str)
  result = []
  start = 0

  while start <= str.length - 1
    num_of_chars_to_slice = 1  # where I declare this variable is CRUCIAL, it needs to be declared here for the inner loop to be able to access it
    while num_of_chars_to_slice <= str.length - start # gradually slicing forward, this will execute twice, while 1 < 4 and while 2 < 3
      substring = str.slice(start, num_of_chars_to_slice)
      result << substring
      num_of_chars_to_slice += 1
    end
    start += 1
  end
  result
end
p all_substrings("halo") #== ["h", "ha" "hal", "halo", "a", "al", "alo", "l" "lo", "o"]
p all_substrings("halo") == ["h", "ha", "hal", "halo", "a", "al", "alo", "l", "lo", "o"]

#once again describing
def all_substrings(str)
  result = []
  start = 0

  while start <= str.length - 1 # while 0 < 4 so index is 0
    chars_to_take = 1  # where I declare this variable is CRUCIAL, it needs to be declared here for the inner loop to be able to access it
    while chars_to_take <= str.length - start # gradually slicing forward, this will evaluate as true twice, while 1 < 4, i.e.(1<(4-0)) and while 2 < 3, i.e(2<(4-1)) so:
      substring = str.slice(start, chars_to_take)                                                  # slice(0, 1), slice(0, 2), slice(0, 3), slice(0,4)
      result << substring                                                                          # ----h----------ha ------------hal---------halo
      chars_to_take += 1
    end
    start += 1       #and after increasing start, which is the index, we will slice                 # slice(1, 1), slice(1, 2), slice(1, 3), slice(1,4)
  end                                                                                               # a ------------al -----------alo
  result
end
p all_substrings("halo") #== ["h", "ha" "hal", "halo", "a", "al", "alo", "l" "lo", "o"]
p all_substrings("halo") == ["h", "ha", "hal", "halo", "a", "al", "alo", "l", "lo", "o"]
# puts
#
# def not_all_substrings(str)
#   result = []
#   start = 0
#
#   num_of_chars_to_slice = 1
#
#   while start <= str.length - 1
#
#     while num_of_chars_to_slice <= str.length - start # gradually slicing forward
#       substring = str.slice(start, num_of_chars_to_slice)
#       result << substring
#       num_of_chars_to_slice += 1
#     end
#     start += 1
#   end
#   result
# end
#
# p not_all_substrings("halo") #== ["h", "ha" "hal", "halo"]
# p not_all_substrings("halo") == ["h", "ha" "hal", "halo"]
