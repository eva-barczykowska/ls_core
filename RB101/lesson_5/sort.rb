# sort method can sort numbers in place

prices = [77, 39, 99, 65]
p prices.object_id
p prices.sort #==> sort will return a NEW ARRAY with the results
p prices.sort.object_id


# also descending
p prices.sort { |a, b| b <=> a}

puts
# sort_by
# by string length
# by string contents
# by whether the number is even or odd

p letters = 'abcd'.split('').shuffle
p letters.sort
p words = "hello there Amy, Ewa, Kim".split # by default first takes into consideration capital letters
p words.sort

p country = "United States of America".split(" ")
p country.sort

p phonemes = ['aab', 'baa', 'aba']
p phonemes.sort # aab, aba, baa

puts
p strings_of_numbers = '1234'.split('').shuffle
p strings_of_numbers.sort
p different_string_digits = %w( 12 333 1055 10444).shuffle # these are NOT NUMBERS!!!
p different_string_digits.sort # ["10444", "1055", "12", "333"]
# looking in turn at first digit, if it's the same then second digit: 1,1-0, 1-1-4, 1-2, 333

puts
p quote = "To be or not to be, this is the question".split.shuffle
p quote.sort_by(&:length)
p quote.sort_by(&:length)

p words = %w( crocodile, zebra, xylophone, anaconda)
p words.sort_by{|word| word[1]} # e n r y respectively
p words.sort_by{|word| word.size}

puts

# We can do cool things, like sorting words that start with a capital letter & leaving everything else in place.
text = "calendar Cat tap Lamp"
def sort_by_capital_word(text)
  text
    .split
    .sort_by { |w| w[0].match?(/[A-Z]/) ? 0 : 1 }
    .join(" ")
end

p sort_by_capital_word("calendar Cat tap Lamp")

# "Cat Lamp calendar tap"

# puts
p strings = %w(foo test blog a)
p strings.sort_by { |str| -str.length } # instead of using the .reverse method after sorting

puts

# sort list of strings that contain numbers
p music = %w(21.mp3 10.mp3 5.mp3 40.mp3)
p music.sort_by { |s| s.to_i } # ["5.mp3", "10.mp3", "21.mp3", "40.mp3"]