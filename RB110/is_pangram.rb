# Problem 12
# Create a method that takes a string as an argument and returns true if the string is a pangram, false if it is not.
#
# Pangrams are sentences that contain every letter of the alphabet at least once. For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram since it uses every letter at least once. Note that case is irrelevant.
#
# p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
# p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
# p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
# p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
# p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true
#
# my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
# p is_pangram(my_str) == true
#
# Problem
# =======
# -method takes a string argument
# -method returns true / false
# -based on the fact if str argument is/isn't a pangram
# -what is a PANGRAM?
# -sentence that contains every letter of the alphabet at least once
# -case is irrelevant
#
# Examples
# ========
# p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
# p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
# p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
# p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
# p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true
#
# Alphabet
# =========
# INIT alphabet to 'a'..'z' - this is my reference
#
# DOWNCASE the str
# TRANSFORM the str to an array of characters
#
# ITERATE over the alphabet reference
#
# RETURN true if all the letters of the alphabet are present in the string
def is_pangram(str)
  alphabet = *('a'..'z')

  arr = str.downcase.chars

  alphabet.all? { |char| arr.include?(char) }
end
p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram('A wizard’s job is to vex chumps quickly in fog.') == true
p is_pangram('A wizard’s task is to vex chumps quickly in fog.') == false
p is_pangram('A wizard’s job is to vex chumps quickly in golf.') == true
