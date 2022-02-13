# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters
# of every word are swapped.
#
# You may assume that every word contains at least one letter, and that
# the string will always contain at least one word. You may also assume that
# each string contains nothing but words and spaces

#  Explicit requirement
# -a method
# -takes a string as an input
# -returns a string
# -in that string, first and last letters of every word are swapped
# -every word has at least 1 character
# -only words and spaces

# Data structures:
# input: string
# output: string

# Algorithm
# -split the string, you get an array
# -look at every word in the array
# -take its first letter and last letter
# -swap them
# -return the string
# -result variable where I append << the changed word?

# IMPORTANT CONCEPT
# # str[0], str[-1] = str[-1], str[0]
#
# str = 'what' #=> "what"
# tmp = str[0] #=> "w"
# str[0] = str[-1] #=> "t"
# str #=> "that"
# str[-1] #=> "t"
# str[-1] = tmp #=> "w"
# str #=> "thaw"

# COMMON IDIOM

# a, b = b, a
# When Ruby sees something like this, it effectively creates a temporary array
# with the values from the right side ([b, a]), and then assigns each element
# from that array into the corresponding named variable:

# a = b   # b is value from position 0 of temporary array (original value of b)
# b = a   # a is value from position 1 of temporary array (original value of a)

# Looked in another way, this is equivalent to:
# temporary = [b, a]
# a = temporary[0]
# b = temporary[1]

def swap(str)
  result = []
  array = str.split
  array.each do |word|
    word[0], word[-1] = word[-1], word[0]
    result << word
  end
  result.join(" ")
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
puts

# ls solution

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
puts

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end
# solution I liked

def letter_swap(str)
  array_of_words = str.split(' ')
  array_of_words.map! do |word|
    first_letter = word.chars.first
    last_letter = word.chars.last
    word[0] = last_letter
    word[-1] = first_letter
    word
  end
  array_of_words.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
puts

def swap(str)
  str.split.map { |word| word.size == 1 ? word : word[-1] + word[1..-2] + word[0] }.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
puts

def swap(string)
  swap_string = string.split(' ').each do |word|
    saved_letter = word[0]
    word[0] = word[-1]
    word[-1] = saved_letter
  end
  swap_string.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
puts

def swap(string)
  a = string.lines(' ', chomp: true).map do |n|
    if n.length < 2
      n
    else
      n = n.delete(n[0]).delete(n[-1]).prepend(n[-1]).concat(n[0])
    end
  end
  a.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
puts

def swap(words)
  swapped_words = words.split.map do |word|
                  first_char = word[0]
                  last_char = word[-1]

                  word[0] = last_char
                  word[-1] = first_char

                  word
                end

  swapped_words.join(" ")
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
puts

# Further exploration:

# def swap_first_last_characters(word)
#   word[0], word[-1] = word[-1], word[0]
#   word
# end
def swap_first_last_characters(a, b)
  p a.object_id
  p b.object_id
  a, b = b, a
end

def swap(words)
  result = words.split.map do |word|
    # swap_first_last_characters(word)
    p 'here'
    p word[0].object_id
    p word[-1].object_id
    swap_first_last_characters(word[0], word[-1])#these are copies of word[0], word[-1] because Sring#[] returns a substring
    p word[0].object_id #these 2 are different then the 2 on line 130 and 131
    p word[-1].object_id
    # documentation says: When the single Integer argument index is given,
    # returns the 1-character SUBSTRING found in self at offset index:
  end
  # p result
  result.join(' ')
end

# p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
swap('Abcde') #== 'ebcdA'
# p swap('a') #== 'a'

# Explanation:
# The method will not work as intended, for two reasons:
#
# a and b do not directly reference the characters stored at the first index
# of word and last index of word. This is because the elements which a and b
# are assigned to, word[0] and word[-1], merely return substring copies of
# the characters at the given indices. This can be observed by checking out
# the documentation for
# String#[]: https://docs.ruby-lang.org/en/master/String.html#method-i-5B-5D, or experimenting in irb.
#
# Even if a and b somehow did store direct references to the characters in word,
# the characters are not mutated directly in swap_first_last_characters.
# The variables a and b are merely reassigned to different objects.
# The objects themselves are not changed.
# We need to pass word directly into swap_first_last_characters
# to have any chance of mutating word.
#
# Point 1 was an important revelation for me, because I had originally assumed
# that in Ruby, referencing elements (characters) in strings was equivalent to
# referencing elements in arrays. But I was very wrong.
# In reality String#[] returns a new object,
# while Array#[] returns the object at that index directly.
# String#[]= is where the mutation magic happens.

# Another, shorter explanation
# Further Exploration: The first approach
# (passing word to swap_first_last_characters) works because the method uses
# indexed assignment, which mutates the caller. This allows the changes
# to be preserved and then the mutated words are carried over to the swap method
# where map returns a new array of the mutated words.
# 
# The second approach (passing first and last characters to
#   swap_first_last_characters does not work because regular assignment is used,
#   which does not mutate the caller, so the change is not preserved.
#   Even if the changes were preserved, it would not work because only
#   the letters would be returned to map . As a result, map would return
#   a new array of only the first and last letters.
