# Create a function that takes a string as an argument and returns a coded (h4ck3r 5p34k) version of the string.
#
# Notes
# In order to work properly, the function should replace all "a"s with 4, "e"s with 3, "i"s with 1, "o"s with 0, and "s"s with 5.
# P:
# - Given a str, return a str where some letters are changed into numbers
# - a -> 4
# - s -> 5
# - o -> 0
# - i -> 1
# - e -> 3
# N:
# -zip to create a hash
# -each with index
# A:
# - create a an array of letters
# - create an array of numbers
# - zip letters with numbers to create a hash

# -iterate over the input str with index
# - if a char at the current index is a key in the hash, change it to the value from the hash

# - join the array and return the string

# Examples

def hacker_speak(str)
  letters = %(asoie).chars
  numbers = %(45013).chars

  h = letters.zip(numbers).to_h

  array = str.chars

  array.each_with_index do |char, index|
    if h.keys.include?(char)
      array[index] = h[char]
    end
  end

  array.join
end
p hacker_speak("javascript is cool") == "j4v45cr1pt 15 c00l"
p hacker_speak("programming is fun") == "pr0gr4mm1ng 15 fun"
p hacker_speak("become a coder") == "b3c0m3 4 c0d3r"

puts

# def hacker_speak(str)
#   letters = %(asoie).chars
#   numbers = %(45013).chars
#
#   h = letters.zip(numbers).to_h
#
#   new_str = ""
#
#   str.each_char do |char|
#     if h.include?(char)
#       new_str << eval("\"#{h[char]}\"") # eval("\" #{h[char]} \"")
#     else
#       new_str << char
#     end
#   end
#
#   new_str
# end
# p hacker_speak("javascript is cool") == "j4v45cr1pt 15 c00l"
# p hacker_speak("programming is fun") == "pr0gr4mm1ng 15 fun"
# p hacker_speak("become a coder") == "b3c0m3 4 c0d3r"

puts

def hacker_speak(str)
  new_str = ""

  letters = %w[a s o i e]
  numbers = %W[4 5 0 1 3]
  p numbers
  h = letters.zip(numbers).to_h
  p h

  str.each_char do |char|
    h.keys.include?(char) ? new_str << h[char] : new_str << char
  end

  new_str
end
p hacker_speak("javascript is cool") == "j4v45cr1pt 15 c00l"
p hacker_speak("programming is fun") == "pr0gr4mm1ng 15 fun"
p hacker_speak("become a coder") == "b3c0m3 4 c0d3r"

# puts
# numbers = %w[4 5 0 1 3] # I have an array of strings and I need an array of integers
# p numbers
