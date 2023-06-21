# 12. Detect Pangram
# (https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby)
# 6 kyu
=begin
A panagram is a sentence that contains every single letter of the alphabet at least once.
For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram,
because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not.
Ignore numbers and punctuation.
=end
# PEDAC TEMPLATE

# ************** Problem **************
# pangram: a sentence that contains every letter of the alphabet at least once

# Questions:

# ************** Examples **************
# p panagram?("The quick brown fox jumps over the lazy dog.") == true
# -> it contains every letter of the alhabet at least once
# p panagram?("This is not a pangram.") == false
# -> it does not contain every letter of the alhabet

# ************** Data Structures **************
# input: string
# medium: array
# output: boolean
# ************** Algorithm **************
# -fine alphabet
# -downcase the arg string
# -divide str into characters
# -ask if all the characters from the alphabet are contained in the
#  array
#  -if yes, return true
# -else returns false


# ************** Code **************

ALPHABET = ('a'..'z').to_a

def panagram?(str)
  array = str.downcase.chars
  ALPHABET.all? { |ch| array.include?(ch) }
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

puts

def pangram?(string)
  clean_string = string.downcase.delete('^a-z')
  array = clean_string.chars.uniq.sort
  alphabet = ('a'..'z').to_a
  if alphabet == array
    return true
  else
    return false
  end

end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false