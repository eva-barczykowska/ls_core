# DropCaps means that the first letter of the starting word of the paragraph should be in caps
# and the remaining lowercase, just like you see in the newspaper.

# But for a change, let"s do that for each and every word of the given String.
# Your task is to capitalize every word that has length greater than 2, leaving smaller words as they are.
# *should work also on Leading and Trailing Spaces and caps.

# P: we have a string, can contain multiple spaces and words
# method needs to leave the spaces intact but capitalize every word if its size is greater than 2
# A:
# convert string into an array of words
# access each word
# determine exact match between word in array and word in string
# if match
# check if length > 2
# convert convert first char to uppercase

def drop_cap(str)
  arr = str.split

  arr.each do |word| # each is passing each word to the block parameter word:["apple"], ["apple", "of", "banana"] ["one", "space"] ["one", "space"]
    if str.scan(word)[0].size > 2 # scan returns SINGLE WORD as an array, so we do [0] to extract first (and only!) word (to have str, otherwise it's an array so we'd be asking about array.size) in that array and ask if its size is > 2
      str.sub!(word, word.capitalize)
    end
  end

  str
  end

p drop_cap("apple") == "Apple"
p drop_cap("apple of banana")  == "Apple of Banana"
p drop_cap("one   space") == "One   Space"
p drop_cap("   space WALK   ") == "   Space Walk   "

puts

def drop_cap(str)
  arr = str.split

  arr.each { |word| str.sub!(word, word.capitalize) if str.scan(word)[0].size > 2 }

  str
end

p drop_cap("apple") == "Apple"
p drop_cap("apple of banana")  == "Apple of Banana"
p drop_cap("one   space") == "One   Space"
p drop_cap("   space WALK   ") == "   Space Walk   "

puts

def drop_cap(string)
  array = string.split

  array.map do |word|
    string[word] = word.capitalize if word.length > 2 # can use string here!
  end

  string
end

p drop_cap("apple") == "Apple"
p drop_cap("apple of banana")  == "Apple of Banana"
p drop_cap("one   space") == "One   Space"
p drop_cap("   space WALK   ") == "   Space Walk   "


puts

def drop_cap(string)

  string.split { |word| string.gsub!(word, word.capitalize) if word.size > 2 }

end

p drop_cap("apple") == "Apple"
p drop_cap("apple of banana")  == "Apple of Banana"
p drop_cap("one   space") == "One   Space"
p drop_cap("   space WALK   ") == "   Space Walk   "