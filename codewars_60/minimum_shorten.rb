# # Implement the function/method, minimum shorten. The function shortens a
# sentence such that it will fit within the character limit set. It shortens
# by removing vowels in the sequence of a, e, i, o, and u. Start removing from
# the end of the sentence. If it can not be shortened to fit within character limit,
# return an empty string. Spaces don’t count for the limit.
#
# Problem
# -method shortens a sentence to fit into the limit
# -2 argument, string and limit
# -shortening is by removing vowels in sequence
# -vowels are [a, e, i, o, u]
# -we need to start removing FROM THE END!
# -if str cannot be shortened to the limit, empty str is returned
# -spaces don't coount for the limit, only letters
#
# Examples
# p minimum_shorten('eeea', 3) == 'eee'
# =>removed e, limit achieved
#
# p minimum_shorten("This is a test sentence", 18) == 'This is  test sentence'
# size is 19, limit 18, we start removing from a so this a is gone "This is A test sentence", result is ("This is test sentence"
#
# p minimum_shorten("Hello World", 8) == 'Hllo Wrld'
# size is 10, limit 8, we remove first e and then o, only the firt o from the end is removed
#
# p minimum_shorten("Short", 10) == 'Short'
# => return arg string is limit > str.size
#
# p minimum_shorten("A very long sentence with many vowels", 10) == ""
# => size is 31, limit is 10, how many vowels can we remove?
# "vry lng sntnc wth mny vwls", even if we remove ALL vowels, size is still 21, this means it's NOT POSSIBLE to achieve the required limit and "" has to be returned
#
# Notes
# -method for removing vowels
# -main method
#
# Algorithm
# - INITIALIZE VOWELS constant

# ACCOUNT for when the limit is > than str.size

# -TRANSFORM str into an array, REVERSE

# INIT `vowel_counter `
# -LOOP over the array of vowels using the counter
# --RETURN reversed and joined array if, when we disregard spaces, its size is equal to `limit`
# --RETURN "" if there are no vowels left in the array
# --VERIFY if the first vowel is in the array(find)
# --if it is, find its index
# --DELETE in the array the vowel at this index
# --else incrase `vowel_counter` to move to the next vowel

# --do this until you reached required str size or until vowels are over

VOWELS = %w[a e o u i]

def minimum_shorten(str, limit)
  return str if limit > str.size

  array = str.reverse.chars

  vowel_counter = 0
  loop do # vowels loop
    return array.reverse.join if array.reject { |ch| ch == ' ' }.size == limit
    return '' if array.none? { |letter| VOWELS.include?(letter) }

    if array.find { |ch| ch == VOWELS[vowel_counter] }
      index_of_vowel = array.index(VOWELS[vowel_counter])
      array.delete_at(index_of_vowel)
    else
      vowel_counter += 1
    end
  end
end

p minimum_shorten('eeea', 3) == 'eee'
p minimum_shorten('This is a test sentence', 18) == 'This is  test sentence'
p minimum_shorten('Hello World', 8) == 'Hllo Wrld'
p minimum_shorten('Short', 10) == 'Short'
p minimum_shorten('A very long sentence with many vowels', 10) == ''

puts
# Problem: Given a string and an integer arg, return a string
#
# Rules:
# - New string or mutate string?
# - Return string size has to be under or at least the integer given
# - Shorten by removing vowels a, e i , o u
#   - Start eliminating all a's, then 'e', then i's, etc...
#   - STart removing vowels from the end of the sentence
# - Return an empty string if the string size cannot fit in at least integer characters
# - Spaces dont count as characters
# - only remove vowels tha are lowercased?
#
# Examples:
# - "this is a test sentence", 18 char limit -> 19chars
#   - remove all A's starting from end -> 'this is test sentence' -> 18 chars
#
# - "Hello World", 8char limit -> 10 chars
#   - remove all e's first -> 'Hllo World' -> 9 chars
#   - remove all o's next -> 'Hllo Wrld' -> 8char limit thus dont remove all o's
#       - probably need to iterate thru words and then each word thru chars to not delete all vowels
#
# Algorithm:
# - RETURN empty string if string size with all vowels removed is over the integer arg
# - SET a variable to reference the index value of the last character
#
# - CREATE an array of chars from the string in reverse order
# - ITERATE over array of chars
#   - if the size of the array is <= char limit
#     - next
#   - else the size of the array is > than the char limit
#     - delete the current char if its an 'a'
#   - decremeent last_char variable to track index positions accordingly
# - ITERATE over chars
#   - repeat above process except for 'e'
# - ITERATE over chars
#   - repeat above process except for 'i'
# - ITERATE over chars
#   - repeat above process except for 'o'
# - ITERATE over chars
#   - repeat above process except for 'u'
# - RETURN mutated string
#
