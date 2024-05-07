#
# Problem 8
# Create a method that takes a non-empty string as an argument. The string consists entirely of lowercase alphabetic characters. The method should return the length of the longest vowel substring. The vowels of interest are "a", "e", "i", "o", and "u".
#
# p longest_vowel_substring('cwm') == 0
# p longest_vowel_substring('many') == 1
# p longest_vowel_substring('launchschoolstudents') == 2
# p longest_vowel_substring('eau') == 3
# p longest_vowel_substring('beauteous') == 3
# p longest_vowel_substring('sequoia') == 4
# p longest_vowel_substring('miaoued') == 5
#
# Problem
# ========
# -method takes non-empty str as an argument
# -only lowercase characters
# -method returns the lengh of the longest vowel substring
# -The vowels of interest are "a", "e", "i", "o", and "u"
#
# Examples
# ========
# p longest_vowel_substring('cwm') == 0
# =>no vowels
#
# p longest_vowel_substring('many') == 1
# => just 1, a
# p longest_vowel_substring('launchschoolstudents') == 2
# =>au, oo, u => 2
#
# p longest_vowel_substring('eau') == 3
# => eau
#
# p longest_vowel_substring('beauteous') == 3
# =>eau, eou => 3
#
# p longest_vowel_substring('sequoia') == 4
# => uoia
#
# p longest_vowel_substring('miaoued') == 5
# => iaoue
#
# Algorithm
# ==========
# DEFINE VOWELS array
# INIT `temp`
# INIT vowel_strings to []
#
# ITERATE over the str and retrieve vowel clusters
# -INIT counter to 0
# -while the char counter < str.size
# -if the char at current counter is a vowel, add it to `temp`
# -add `temp` to `vowel_strings` if you're on the last index and `temp` is not empty
# -else add `temp` to `vowel_strings` unless it's empty
# -reassign `temp` to ''
#
# -increase the counter by 1
#
# RETURN the max size of a string in `vowel_strings`
#
# Algorithm2
# ==========
# INIT VOWELS []
# ITERATE over the string
# INIT valid_substrings
# -start at index 0, finish at index - 1 -starting index
# --start at starting index and finish at index - 1
# --retrieve a `substring` and
# -store `substring `in `valid_substrings` only if all its characters are vowels
#
# SORT `valid_substrings` by size
# RETURN the longest
VOWELS = %w[a e o u i]

def longest_vowel_substring(str)
  vowel_strings = []
  counter = 0
  temp = ''
  while counter < str.size
    if VOWELS.include?(str[counter])
      temp += str[counter]
      vowel_strings << temp if counter == str.size - 1 && !temp.empty?
    else
      vowel_strings << temp unless temp.empty?
      temp = ''
    end
    counter += 1
  end

  return 0 if vowel_strings.empty?

  vowel_strings.sort_by { |vowel_string| vowel_string.size }.last.size
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5

puts

# INIT VOWELS []
# ITERATE over the string
# INIT valid_substrings
# -start at index 0, finish at index - 1 -starting index
# --start at starting index and finish at index - 1
# --retrieve a `substring` and
# -store `substring `in `valid_substrings` only if all its characters are vowels

# SORT `valid_substrings` by size
# RETURN the longest
VOWELS = %w[a e o u i]

def longest_vowel_substring(str)
  valid_substrings = []

  (0...str.size).each do |start|
    (start...str.size).each do |finish|
      substr = str[start..finish]
      valid_substrings << str[start..finish] if substr.chars.all? { |char| VOWELS.include?(char) }
    end
  end

  return valid_substrings.max_by(&:size).size unless valid_substrings.empty?

  0
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5
