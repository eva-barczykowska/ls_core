=begin
Letter Counter (Part 1)
Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

PEDAC
-I have to write a method that takes a string
-that string will have space separated words, 1 or more
-the method returns a hash
-the key in the hash is the number of characters, the value is how many words we
have with that many characters

Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

Data structures
-input: string
-output: hash

Algorithm
-if it is an empty string, just return an empty hash
-divide the string to get separate words
-create result hash
-look at every word in the array and count its characters
-the number of those characters will be the key in the hash
-check if that key already exists in the hash and if it doesn't, add it and make
the value as 1
-if that key already exists, increase the value by 1
-return the hash
=end

def word_sizes(str)
  h = {}
  if str.empty?
    return {}
  else
    arr = str.split(" ")
    arr.each do |word|
      if !h.keys.include?(word.size)
        h[word.size] = 1
      else
        h[word.size] += 1
      end
    end
  end
 h
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

puts ""

# ls solution
def word_sizes(words_string)
  counts = Hash.new(0) #we use the default value form of initializing counts to avoid the nil exception/try it without
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

puts ""

def word_sizes(string)
  string.split.group_by do |word|
    word.size
  end.transform_values do |word|
    word.size
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

puts ""

sentence = "ewa is very lucky" # =>["ewa", "is", "very", "lucky"]
p sentence.split.group_by do |word|
  word.size
end

#=> {3=>["ewa"], 2=>["is"], 4=>["very"], 5=>["lucky"]}

puts ""

def word_sizes(sentence)
  sentence.split.map(&:size).tally.sort.to_h
end

# *** after split # =>["ewa", "is", "very", "lucky"]
# *** after tally # =>[3, 2, 4, 5]
# *** after sort #=> [[2, 1], [3, 1], [4, 1], [5, 1]]

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
