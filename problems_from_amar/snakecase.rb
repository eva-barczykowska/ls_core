#  Write a function, snakecase, that transforms each word in a
# sentence to alternate between lower (even index value) and upper
# (odd index value) cases when the word before or after it  begins with "s".
# Problem
# =======
# -method takes a string/sentence
# -method returns sentence in which each word is modified provided that word was preceded
#  or followed by a word starting with "s"
#  -the way to transform is:
#  ++ letters at even indices - LOWERCASE
#  ++ letters at odd indices - UPPERCASE
#
# Test cases
# ============
#
# p snakecase("Snakes slither silently") == "sNaKeS sLiThEr sIlEnTlY"
# => all transformed because for all there is a word before/after that starts with "s"
#
# puts snakecase("simple sentence structure") == "sImPlE sEnTeNcE sTrUcTuRe"
# => same
#
# puts snakecase("apples are sweet") == "apples aRe sweet"
# only middle words is tranformed, because it is followed by a word starting with "s"
#
# puts snakecase("swiftly swimming swans") == "sWiFtLy sWiMmInG sWaNs"
# => all are transformed
#
# puts snakecase("the sun sets slowly") == "tHe sUn sEtS sLoWlY"
# => same
#
# p snakecase("A quick brown fox") == "A quick brown fox"
# => nothing is tranformed
# *** ACCOUNT FOR CASE!!!
# Algorithm
# ==========
# - DEFINE helper method `tranform_word` with a single word as an arg
# - iterate over the chars in the word with index
# - if index is EVEN, lowercase the letter
# -if index is ODD, uppercase the letter
#
# RETURN tranformed word
#
# ***
# MAIN method
# -INIT new_string, DOWNCASE the str
# -INIT `indices`
# -TRANSFORM str to array
# -ITERATE over the array
# --if index = 0, if the word(downcased) at index after starts with "s", add that index to `indices`
# --if index = arr.size - 1, if the word(downcased) at index before starts with "s", add that index to `indices`
# -else add index to indices if the word (downcased index before or after starts with 's'
# -RETRIEVE INDICES and store them/append them to `indices`
#
# -ITERATE over the array with index
# -if the current index is in `indices` array
# - pass it to `change_word` method as an arguemnt and save return value to `new_string`
# -else just save to `new_str` the word the way it is
#
# -JOIN new str
# -RETURN new_str
#
# ???can I mutate the word???
# =
def change_word(word)
  new_word = ''
  word = word.each_char.with_index do |char, index|
    new_word << char.downcase if index.even?
    new_word << char.upcase if index.odd?
  end

  new_word
end
# p change_word("Snakes")

def snakecase(sentence)
  result = []
  arr = sentence.downcase.split
  indices = []

  arr.each.with_index do |_word, index|
    if index == 0
      indices << index if arr[index + 1].start_with?('s')
    elsif index == arr.size - 1
      indices << index if arr[index - 1].start_with?('s')
    elsif arr[index - 1].start_with?('s') || arr[index + 1].start_with?('s')
      indices << index
    end
  end

  return sentence if indices.empty?

  new_str = []
  arr.each.with_index do |word, index|
    new_str << if indices.include?(index)
                 change_word(word)
               else
                 word
               end
  end

  new_str.join(' ')
end

p snakecase('Snakes slither silently') == 'sNaKeS sLiThEr sIlEnTlY'
puts snakecase('simple sentence structure') == 'sImPlE sEnTeNcE sTrUcTuRe'
puts snakecase('apples are sweet') == 'apples aRe sweet'
puts snakecase('swiftly swimming swans') == 'sWiFtLy sWiMmInG sWaNs'
puts snakecase('the sun sets slowly') == 'tHe sUn sEtS sLoWlY'
p snakecase('A quick brown fox') == 'A quick brown fox'
