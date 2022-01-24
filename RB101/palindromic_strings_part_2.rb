# Write another method that returns true if the string passed as an argument is
# a palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters.
#  If you wish, you may simplify things by calling the palindrome? method you
# wrote in the previous exercise.
#
# Explicit requrements:
# a method that returns true if argument is a palindrome, false otherwise
# method should be case insensitive
# method should ignore all non_alphanumberic characters
# Data structure:
# Input: string
# Output: true or false

# Algorithm:
# -make the case of both strigns equal
# -get rid of spaces
# -consider only letters/get rid of non numerical characters
# -compare 1st string to the 2nd reversed
# .gsub(/[^0-9a-z]/i, '') removes all non-letter characters and spaces
# .gsub(/[^0-9a-z ]/i, '') removes all non-letter characters but leaves spaces

def real_palindrome?(str)
  str1 = str.downcase.gsub(/[^0-9a-z]/i, '')
  str2 = str.downcase.gsub(/[^0-9a-z]/i, '').reverse
  str1 == str2
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# ls solution:
# here we used the previously written method palindrome?

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
