=begin
Your task is to Reverse and Combine Words.

Input: String containing different "words" separated by spaces

1. More than one word? Reverse each word and combine first with second, third
with fourth and so on...
(odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…
=end

# Input: String
# Output: String

# Rules:
# - every word should be reversed
# - every other word joined
# - keep doing it until only 1 word without spaces is the result

# Algorithm:
# - start loop
#   - split the string into words -> `words`
#   - iterate and reverse each word
#   - join the words -> index 0 with index 1, 2 with 3.. an so on
#   - join all the words with a ' '
#   - break if array has only one word
# - end loop
# - return word jointed ' '

def reverse_and_combine_text(string)
  loop do
    words = string.split(' ')
    return string if words.size == 1
    words = words.map(&:reverse)
    joined_words = []
    index = 0
    while index < words.size
      joined_words << words[index, 2].join
      index += 2
    end
    string = joined_words.join(' ')
  end
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"
