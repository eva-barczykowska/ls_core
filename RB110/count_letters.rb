# Problem 6
# Create a method that takes a string argument and returns a hash in which the keys represent the lowercase letters in the string, and the values represent how often the corresponding letter occurs in the string.
#
# expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
# p count_letters('woebegone') == expected
#
# expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
#             'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
# p count_letters('lowercase/uppercase') == expected
#
# expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
# p count_letters('W. E. B. Du Bois') == expected
#
# p count_letters('x') == {'x' => 1}
# p count_letters('') == {}
# p count_letters('!!!') == {}
#
# Problem
# =======
# -method takes a string argument
# -method returns a HASH, in which keys are the LOWERCASE leters in the string and values are how often the letters occur
# -only letters are considered so e.g. !!! will return an empty {}
#
# Examples
# ========
# expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
# p count_letters('woebegone') == expected
# => only LOWERCASE letters are counted
#
# expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
#             'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
# p count_letters('lowercase/uppercase') == expected
# => non lowercase alphabet characters are not considered
#
# expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
# p count_letters('W. E. B. Du Bois') == expected
# => only lowercase letters are considered
#
# p count_letters('x') == {'x' => 1}, W E B are not counted
# p count_letters('') == {}
# =>
# p count_letters('!!!') == {}
# => !!! are not lowercase alphabet characters
#
# Algorithm
# ==========
# INIT lowercase alphabet LOWERCASE
#
# INIT `result`
#
# TRANSFORM to `array`
# -select characters that belong to LOWERCASE alphabet
# -use tally to count or count by hand
#
# RETURN `result `
LOWERCASE = *('a'..'z')

def count_letters(str)
  arr = str.chars.select { |char| LOWERCASE.include?(char) }.tally
end

expected = { 'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1 }
p count_letters('woebegone') == expected

expected = { 'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2, 'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2 }
p count_letters('lowercase/uppercase') == expected

expected = { 'u' => 1, 'o' => 1, 'i' => 1, 's' => 1 }
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == { 'x' => 1 }
p count_letters('') == {}
p count_letters('!!!') == {}
