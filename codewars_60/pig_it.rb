# Move the first letter of each word to the end of it, then add "ay" to the end of the word.
# pig_it('Pig latin is cool') # igPay atinlay siay oolcay
# pig_it('Hello world !')     # elloHay orldway !

# P:
# -I have a string of words
# -from each word:
# -I have to remove first letter
# -I have to add 'ay' to the end of the word
# -add ay only to the words, not punctuation

# pig_it('Pig latin is cool') == "igPay atinlay siay oolcay"
# pig_it('Hello world !')  == "elloHay orldway ! "

# DS:
# input: str
# output: str, transformed

# A:
# - split the string into single words
# - deal with each word separately:
# --remove first letter and stick it at the end
# --add 'ay' ending

# 1.process word
# 2.pig_it

upper = *('A'..'Z')
lower = *('a'..'z')
ALPHABET = upper + lower

def process(word)
  result = []

  word = word.chars
  # goes_to_the_end = word.shift if word.all? { |letter| ALPHABET.include?(letter) }
  goes_to_the_end = word.shift unless word.size == 1

  word.each do |char|
    if !ALPHABET.include?(char)
      result << char
      p "if branch is #{result}"
    else
      result = (word + [goes_to_the_end] + ['ay']) # I reassign it at each iteration
      p "else branch is #{result}"
    end
  end

  result.join
end

# p process('!') #== "igPay"

def pig_it(str)
  result = []

  arr = str.split
  arr.each do |word|
    result << process(word)
  end

  result.join(' ')
end
p pig_it('Pig latin is cool') == 'igPay atinlay siay oolcay'
p pig_it('Hello world !') == 'elloHay orldway !'
p pig_it('wor!ld') == 'or!ldway'

puts

# Problem: Create a method that accepts a string. Return a new string with the first letter of the input string moved to the end plus 'ay'
# Algorithm:
# Loop over each word in the string
# Construct a new word that consists of the final letters, first letter, and 'ay'
# Collect the new string into an Array
# Join the array to form output String

def pig_it(string)
  words = string.split.map do |word|
    if /[a-zA-Z]/ =~ word
      word[1..-1] + word[0] + 'ay'
    else
      word
    end
  end
  words.join(' ')
end

p pig_it('Pig latin is cool') == 'igPay atinlay siay oolcay'
p pig_it('Hello world !') == 'elloHay orldway !'

p pig_it('Pig latin is cool') == 'igPay atinlay siay oolcay'
p pig_it('Hello world !') == 'elloHay orldway !'
p pig_it('wor!ld') == 'or!ldway'
