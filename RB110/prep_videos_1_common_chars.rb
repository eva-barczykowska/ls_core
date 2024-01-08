# Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

=begin
Goal: intake an array of strings and output an array of all characters that show up in all strings in that array.
input: array
output: array

Rules:
- input made up of lowercase letters
- include duplicates that show up in all letters
- if no shared letters, return an empty array

N:
- count

E:
input: (["bella","label","roller"])
out: ["e", "l", "l"]
Explanation: the three letters in the output array show up in all three words of the input array. 'l' is a duplicate that shows up twice in each word. Therefore, it shows up twice in the output.

input: ["cool","lock","cook"])
output: ["c", "o"]
Ex: all three words of the input array share 'c', 'o'

input: ["hello","goodbye","booya", "random"])
output: ["o"]
Ex: all four words only share one letter in common >> 'o'

input: (["aabbaaaa","ccdddddd","eeffee", "ggrrrrr", "yyyzzz"])
output: []
Ex: no matching letters across the words of the array >> []

D:
input: array
intermediate: array of common characters, hash of the character count?
output: array

A:
input: `array`
- initialize `result` to store the common characters >> []
- iterate over the characters of the first word of the array >> ['b', 'e', 'l', 'l', 'a']
  - if current letter is found in all of the remaining words of the array
    - push current letter into `result` >> ['e']
    - iterate over the remaining words of the array
      - initialize `word_array` to an array of characters of the word
      - initialize `index` to the result of calling index method on `word_array` with `char` as an argument
      - delete current letter at an index from the remaining elements in the array >>
      - join the array of characters
- return `result`
=end

def common_chars(array)
  result = []

  first_word = array.shift # "bella"

  first_word.chars.each do |char|
    if array.all? { |word| word.include?(char) }
      result << char
      array.map! do |word|
        word_array = word.chars
        index = word_array.index(char)
        word_array.delete_at(index)
        word_array.join
      end
    end
  end
  result
end
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

puts

def common_chars(arr)
  first = arr.shift
  hash = {}

  first.chars.uniq do |char|
    hash[char] = first.chars.count(char) # here my count is not reliable
  end

  hash.each do |k, v|
    arr.each do |word|
      if word.chars.count(k) < hash[k]
        hash[k] = word.chars.count(k) # now I have proper count
      end
    end
  end

  return_str = ''
  hash.each do |k, v| # add key to the string as many times as value says
    return_str << k * v
  end

  return_str.chars # need to return an array
end
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

puts

def letter_freq(word)
  word.chars.each_with_object({}) do | letter, let_freq |
    let_freq.key?(letter) ? let_freq[letter] += 1 : let_freq[letter] = 1
  end
end

def common_chars(words)
  results = []
  words.map! { |word| letter_freq(word) }
  common_let(words).each do |letter, freq|
    freq.times { results << letter }
  end
  results
end

def common_let(words)
  common_let = words.first
  common_let.each do |letter, freq|
    words.each do |word|
      if word.key?(letter)
        temp = nil
        if word[letter] <= common_let[letter]
          temp = word[letter]
        else
          temp = common_let[letter]
        end
        common_let[letter]=temp
      else
        common_let[letter] = 0
      end
    end
  end
  common_let.keep_if { |_, freq| freq.zero? == false }
end
p common_chars(["bella","label","roller"]) == ["e", "l", "l"]
p common_chars(["cool","lock","cook"]) == ["c", "o"]
p common_chars(["hello","goodbye","booya", "random"]) == ["o"]
p common_chars(["aabbaaaa","ccdddddd","eeffee", "ggrrrrr", "yyyzzz"]) == []

