# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.

# Requirements:
# write a method
# input: array of strings
# output: array of the same string values but with vowels removed
#
# Data structures:
# input: array of strings
# output: array of strings
#
# Algorithm:
# - define the wovels
# -iterate thought the array of strings and access the elements
# -if the current character is in the array of wowels, delete it
# -return the array of strings but without vowels

def remove_vowels(array)
  array.map do |str|
    str.delete("aeouiAEOUI")
  end
end

["abcdefghijklmnopqrstuvwxyz"]
["green", "YELLOW", "black", "white"]
["ABC", "AEIOU", "XYZ"]

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
