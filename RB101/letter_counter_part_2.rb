=begin
Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.
=end

# How to exclude non-letters

def word_sizes(str)
  str = str.gsub(/[^A-z \s]/, "")
  p str
  arr = str.split
  p arr
  arr = arr.map(&:size)
  p arr
  arr = arr.tally
  p arr
  arr = arr.sort
  p arr
  arr = arr.to_h
  p arr
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

puts ""

def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) {|word, hsh| hsh[word.count "A-z"] += 1}
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

puts ""

def word_sizes(words)
  sizes = Hash.new(0)

  words.split.each do |word|
    sizes[word.count('A-z')] += 1 #=>["Four", "four", "score", "and", "seven"]
  end

  sizes
end
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
