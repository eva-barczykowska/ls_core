# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again.
# You may assume that the strings are of different lengths.

# input: 2 strings
# output: 1 string
# data structures: string
# explicit requirements:
# -it has to be a string
# - take 2 arguments, strings
# algorithm:
# - find out which string of the two is the longest
# - concatenate short + long + short
# - return the result of concatenanting

def short_long_short(str1, str2)
  if str1.size > str2.size
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# ls solution
# There are also other algorithms to use other than the if/else logic.
# For example, we could put string1 and string2 in an array, and then
# sort the array according to the element's length. Then just concatenate
# the elements in the array, knowing that the shortest one is first.

def short_long_short(string1, string2)
  arr = [string1, string2].sort_by { |el| el.length } # .sort_by(&:length)
  arr.first + arr.last + arr.first
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
p short_long_short('check', 'chuck')

puts ""
# I liked this solution because it accounts for strings being same:
def short_long_short(str1, str2)
  compare = str1.size <=> str2.size
  output = ''
  case compare
  when 1
    output << "#{str2}" + "#{str1}" + "#{str2}"
  when -1
    output << "#{str1}" + "#{str2}" + "#{str1}"
  else
    output << "They are the same."
  end
  output
end
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
p short_long_short('check', 'chuck') == "They are the same."

# if strings are of the same length, the first one passed gets the first place
# in the concatenated string
