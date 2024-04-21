# Given a String as an argument, return an Array of all consecutive numbers from the String.
# Consecutive numbers being: a series of numbers containing no other non-numeric characters.
# Consecutive numbers must be larger than 1 digit, otherwise do not add these to the returned array.
# Note: Spaces DO NOT break a series of numbers
#
# P:
# - method takes a string that includes numbers
# - method returns all consecutive numbers from the String in an array
# - conseq. numbers are a series of numbers wihtout other non-numeric characters
# - conseq. numbers must be larger than 1 digit
# - spaces do not break series of numbers
#
# E:
# p numbers_from_string('Ruby3.32') = [32]
# =>3 is a single number so we don't consider it => 32
#
# p numbers_from_string('abc1234abc') == [1234]
# =>
#
# p numbers_from_string('11abc1!23abc') == [11, 23]
# => 1 is a single number
#
# p numbers_from_string('hello world!') == []
# => []
#
# p numbers_from_string('1 2 3 4') == [1234]
# -spacs don't break the sequence
#
# p numbers_from_string('12abc7f24ghi1678!') == [12, 24, 1678]
# =>
#
# DS:
# input: str
# output: arr
#
# A:
# -INIT `result`
# - delete spaces
#
# - INIT a `temp` variable
# - ITERATE with a loop over each characters until nil is reached
#
# --if a character belongs to string-numbers, add it to temp
#
# --add this character to temp unless next character is not a number
# --if not, append temp to `result` unless temp.empty? or unless temp.size == 1
#
# RETURN `result`
def numbers_from_string(str)
  result = []
  str = str.delete(' ')

  temp = ''
  counter = 0
  while counter < str.size + 1
    if str[counter].to_i != 0
      temp << str[counter]
    else
      result << temp.to_i unless temp.size == 1 || temp.empty?
      temp = ''
    end
    counter += 1
  end

  result
end

p numbers_from_string('Ruby3.32') == [32]
p numbers_from_string('abc1234abc') == [1234]
p numbers_from_string('11abc1!23abc') == [11, 23]
p numbers_from_string('hello world!') == []
p numbers_from_string('1 2 3 4') == [1234]
p numbers_from_string('12abc7f24ghi1678!') == [12, 24, 1678]
# -note down the errors that I always make

# Given a String as an argument, return an Array of all consecutive numbers from the String.
# Consecutive numbers being: a series of numbers containing no other non-numeric characters.
# Consecutive numbers must be larger than 1 digit, otherwise do not add these to the returned array.
# Note: Spaces DO NOT break a series of numbers
#
# Problem: Given a string of characters, return an array of itnegers
#
# Rules:
# - Return array is going to consist of integers
#   - consectuive numbers
#     - a number that is created by one character after another
#   - Only looking for consecutive numbers that are > 1 digit long
# - Spaces DO NOT break a series of numbers
#   - this mean spaces can be ignored
#   - do not break chain of consectuive digits
# - return empty array if my given string any digits
#
# Examples
# - 'Ruby3.32' -> [32]
#   '3', '32'
#
# - 'abc1234abc -> [1234]
#
# - 11abc1!23abc' -> [11, 23]
#   - '11', '1', '23'
#
# - '1 2 3 4' -> [1234]
#   - '1', '12', '123'...
#   - [1234] # figure out way to remove al whitespace from string at very beginning
#
# - '12abc7f24ghi1678!' -> [12, 24, 1678]
#
# Algorithm:
# - CREATE an array of digits 0..9
# - RETIRN [] if my givne string doesn't have any digits
# - DELETE all occurrence of whitspcae
#     - # chars->join , #delete ' '
# - CONVERT all chars that aren't digits into whitespace
#   - #gsub!
# - CONVERT array fo transofrmed chars back into string
# - CONVERT string of whitepsace/digits into an array of numbers
#     - #split
# - SET valid_nums to SELECT all numbers that are > 1char
#     - #select
#     - if my number.size > 1
#       - select it
# - TRANSFORM all selected numbers into integers
#     - map #to_i
# - RETURN array of integers

DIGITS = ('0'..'9').to_a

def numbers_from_string(str)
  str.delete!(' ')

  str.gsub!(/[^0-9]/, ' ') # remove all letters

  valid_nums = str.split.select { |num| num.size > 1 }
  valid_nums.map { |num| num.to_i }
end

p numbers_from_string('Ruby3.32') == [32]
p numbers_from_string('abc1234abc') == [1234]
p numbers_from_string('11abc1!23abc') == [11, 23]
p numbers_from_string('hello world!') == []
p numbers_from_string('1 2 3 4') == [1234]
p numbers_from_string('12abc7f24ghi1678!') == [12, 24, 1678]