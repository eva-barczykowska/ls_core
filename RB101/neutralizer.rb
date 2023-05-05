# Neutralizer
# We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

def neutralize(sentence)
  result = []
  words = sentence.split(' ')

  words.each do |word|
    result << word unless negative?(word)
  end

  result.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
#=> These cards are part of a board game.

=begin
A good way to see what is happening is to inspect word and words for each iteration of the block on lines 3-5.
In the following example we decided to simply insert a few print statements.
We also use Enumerable#each_with_index instead of each, in order to see which index of the words array we are at.
=end
def neutralize(sentence)
  words = sentence.split(' ')
  words.each_with_index do |word, index|
    p index
    p word
    p words
    words.delete(word) if negative?(word)
    p words
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')

=begin
At index 0, nothing interesting happens. When the iteration is at index 1, the element is "dull".
Since it counts as negative, it is deleted from the array. As a consequence, each subsequent word is shifted
one position to the left. In particular, the word that was previously at position 2, "boring", is now at position 1.
So in the next step, when the iteration is at index 2, it finds "cards". Our mutation of the array caused it to skip
"boring".
=end

puts
# ls solution
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
#=> These cards are part of a board game.

puts

# also this
def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end
puts neutralize('These dull boring cards are part of a chaotic board game.')