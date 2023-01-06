# Lettercase Counter
# Write a method that takes a string, and then returns
# a hash that contains 3 entries: one represents
# the number of characters in the string that are lowercase letters,
# one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# PEDAC
# Problem
# -write a method that takes a string as an argument
# -the method returns a hash
# -the hash has 3 keys and values
# -the keys are `lowercase`, `uppercase` and `neither`
# -the values for these keys are counts of the above

# Examples
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data structures
# input: a string
# output: a hash

# Algorithm
# -initialize a hash with 3 keys: lowercase, uppercase and neither
# -scan the string for lowercase characters, add the number for to the correct key
# -initialize uppercase alphabet and lowercase alphabet
# -scan for uppercase characters and add the number to the correct key
# -scan for neither/minus the number of lowercase and uppercase from the number of characters in the string

# Code

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def letter_case_count(str)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  array = str.split("")
  array.each do |character|
    if UPPERCASE.include?(character)
      result[:uppercase] += 1
    elsif LOWERCASE.include?(character)
      result[:lowercase] += 1
    else
      result[:neither] += 1
    end
  end
  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def letter_case_count(str)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  array = str.split("")
  array.each do |character|
    result[:uppercase] += 1 if UPPERCASE.include?(character)
    result[:lowercase] += 1 if LOWERCASE.include?(character)
    result[:neither] += 1 if !UPPERCASE.include?(character) && !LOWERCASE.include?(character)
  end
  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
