# Ben was tasked to write a simple ruby method to determine if an input string
# is an IP address representing dot-separated numbers. e.g. "10.4.5.11".
# He is not familiar with regular expressions. Alyssa supplied Ben with a method
# called is_an_ip_number? that determines if a string is a numeric string
# between 0 and 255 as required for IP numbers and asked Ben to use it.

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few
# things. You're not returning a false condition, and you're not handling
# the case that there are more or fewer than 4 components to the IP address
#   (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
# Help Ben fix his code.

# Data structures:
# input: string
# output: boolean, true or false
#
# Algorithm
# first check for an empty str, if it's empty, return false
# -then count the dots, if there are less or more than 3, then return false
# -then split the string on the dot and check if every element is less or equal
#  to 255, if yes, return true, if no, return false
# -else return true

def ip_number?(array)
  array.all? { |e| e.between?(0, 255) }
end

def dot_separated_ip_address?(input_string)
  return false if input_string.empty?
  return false if input_string.chars.count(".") != 3
  return false if input_string.split(".").any? { |element| element.to_i > 255 }
  input_string = input_string.split(".").map(&:to_i)
  ip_number?(input_string)
end

p dot_separated_ip_address?("")
p dot_separated_ip_address?("4.122.222.111.111")
p dot_separated_ip_address?("4.122.222.256")
p dot_separated_ip_address?("-1.0.0.0")
p dot_separated_ip_address?("4.122.222.244")
p dot_separated_ip_address?("0.0.0.0")
p dot_separated_ip_address?("255.255.255.255")
puts
# ls solution

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  p dot_separated_words
  return false unless dot_separated_words.size == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word) # this method was not provided
  end

  true
end

p dot_separated_ip_address?("")
p dot_separated_ip_address?("4.122.222.111.111")
p dot_separated_ip_address?("4.122.222.256")
p dot_separated_ip_address?("-1.0.0.0")
p dot_separated_ip_address?("4.122.222.244")
p dot_separated_ip_address?("0.0.0.0")
p dot_separated_ip_address?("255.255.255.255")
