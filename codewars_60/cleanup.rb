# // Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# Problem
# ---------
# method takes a string, all lowercase and special chars
# method replaces special chars with spaces
# if we have more than 1  special char, the return str has just 1 space

# Exampels
# --------
# # p cleanup("---what's my +*& line?") == ' what s my line '
# " what s my  line? "

# Algo
# -----
# -DEFINE lowercase alphabet
# -replace with spaces any char that is not lowercase
# -remove excess spaces

# def cleanup(str)
#   lowercase = ('a'..'z').to_a
#   str.each_char do |char|
#     str.sub!(char, ' ') unless lowercase.include?(char)
#   end
#   str.squeeze
# end

# p cleanup("---what's my +*& line?") == ' what s my line '

# def cleanup(str)
#   str.each_char do |char|
#     str.sub!(char, ' ') unless ('a'..'z').include?(char)
#   end.squeeze
# end
# p cleanup("---what's my +*& line?") == ' what s my line '

# def cleanup(str)
#   new_str = str.sub(/./) do |char|
#     ('a'..'z').include?(char) ? char : ' '
#   end.squeeze
# end
# p cleanup("---what's my +*& line?") == ' what s my line '

# def cleanup(str)
#  lowercase = ('a'..'z').to_a
#  new_str = str.gsub(/./) do |char|
#     lowercase.include?(char) ? char : ' '
#  end
#  new_str.squeeze
# end
# p cleanup("---what's my +*& line?") == ' what s my line '

# def cleanup(str)
#   lowercase = ('a'..'z').to_a
#   str.gsub(/./) { |char| lowercase.include?(char) ? char : ' ' }.squeeze
#  end
#  p cleanup("---what's my +*& line?") == ' what s my line '

def cleanup(str)
  str.gsub(/./) { |char| ('a'..'z').include?(char) ? char : ' ' }.squeeze
end
p cleanup("---what's my +*& line?") == ' what s my line '
