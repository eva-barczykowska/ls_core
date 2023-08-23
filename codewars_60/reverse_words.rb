# Complete the function that accepts a string parameter, and reverses each word in the string.
# All spaces in the string should be retained.

# P:
# -write a method that reverses each word in a string
# -retain the string spaces
# -spaces can be more than one
#
# A:
# convert str argument to an array in order to be able to access each word
# iterate over the array accessing each word
# ask if str has this word (scan)
# if it does, then replace this word with the reversed version of it
def reverse_words(str)
  arr = str.split

  arr.each do |word|
    if str.scan(word)
      str.sub!(word, word.reverse)
    end
  end
  str
end


p reverse_words('The quick brown fox jumps over the lazy dog.') == 'ehT kciuq nworb xof spmuj revo eht yzal .god'
p reverse_words('apple') == 'elppa'
p reverse_words('a b c d') == 'a b c d'
p reverse_words('double  spaced  words') == 'elbuod  decaps  sdrow'

puts

def reverse_words(str)
  str.split { |word| str.sub!(word, word.reverse) if str.scan(word) }
end

p reverse_words('The quick brown fox jumps over the lazy dog.') == 'ehT kciuq nworb xof spmuj revo eht yzal .god'
p reverse_words('apple') == 'elppa'
p reverse_words('a b c d') == 'a b c d'
p reverse_words('double  spaced  words') == 'elbuod  decaps  sdrow'

