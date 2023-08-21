# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

# p least_common_char("Hello World") #== "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") #== "m"
# p least_common_char("Happy birthday!") #== ' '
# p least_common_char("aaaaaAAAA") #== 'a'

# # The tests above should print "true".
# P:
# -write a method that takes a str
# -the method returns the character that occurs least in the str
# -if there are multiple, return the one that occurs first
# N:
# -tally?
# E:
# p least_common_char("Hello World") #== "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") #== "m"
# =>downcase
# p least_common_char("Happy birthday!") #== ' '
# =>space matters!
# p least_common_char("aaaaaAAAA") #== 'a'
# DS:
# input: str
# output: str

# A:
# -downcase all characters
# -count all the characters and store the result in a hash
# -extract from the hash the key for the FIRST smallest value
#  --from values, find the minimum
#  --iterate over the hash and find the first key for which the value is the minimum

def least_common_char(str)
  h = str.downcase.split("").tally
  min = h.values.min

  h.each do |k, v|
    return k if v == min
  end

end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

puts

def least_common_char(str)
  str = str.downcase
  hsh = {}
  boolean = nil

  str.each_char { |char| hsh[char] = str.count(char) } # counting chars and storing them in a hash

  arr_of_sums = hsh.values
  p arr_of_sums # for Peter... [9, 8, 1, 3, 7, 3, 3, 3, 2, 1, 1, 1, 1, 1]

  least_sum =
    arr_of_sums.select do |sum|
      boolean = arr_of_sums.each.with_index.all? do |_, i|
        sum <= arr_of_sums[i] # 9<=0, 8 <= 1, 1 <= 3
      end
      break sum if boolean # sum returns 3
    end

  hsh.key(least_sum) # extracting the right key via value
end

# p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") == "m"
# p least_common_char("Happy birthday!") == ' '
# p least_common_char("aaaaaAAAA") == 'a'
