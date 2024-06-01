# You have managed to intercept an important message and you are trying to read it.

# You realise that the message has been encoded and can be decoded by switching each letter with a corresponding letter.

# You also notice that each letter is paired with the letter that it coincides with when the alphabet is reversed.

# For example: "a" is encoded with "z", "b" with "y", "c" with "x", etc
# You read the first sentence:
# "r slkv mlylwb wvxlwvh gsrh nvhhztv"
# After a few minutes you manage to decode it:
# "i hope nobody decodes this message"

# Create a function that will instantly decode any of these messages
# You can assume no punctuation or capitals, only lower case letters, but remember spaces!

# Problem
# ========
# -method takes a string as an argument
# -method decodes the string and returns the decoded string
# -decoding key:
# --each letter is swapped with the letter that coincides with then when the alphabet is reversed

# -only lowercase characters, no punctuation
# -be mindful of spaces

# Algorithm
# ==========
# - zip `alphabet` with its reversed version [['z' => 'a'], ['s'=>'h']] etc.
# - ITERATE over the string and build a new string, `decoded`:
# --if REFERENCE has a character you're iterating over as a key, append its counterpart, value
# --if it doesn't(because it's a space), append the space

# -join array on a space and RETURN the decoded string

# Examples
# =========
# decode("svool") == "hello"
# decode("r slkv mlylwb wvxlwvh gsrh nvhhztv" == "i hope nobody decodes this message")

reversed = *('a'..'z').to_a.reverse
normal = *('a'..'z')
REFERENCE = reversed.zip(normal).to_h

def decode(str)
  decoded = ''

  str.chars.each do |char|
    decoded << (REFERENCE[char] || char)
  end

  decoded
end
p decode('svool') #== "hello"
p decode('r slkv mlylwb wvxlwvh gsrh nvhhztv') #== "i hope nobody decodes this message"

puts

def decode(message)
  alpha = ('a'..'z').to_a.join
  message.tr(alpha, alpha.reverse)
end
p decode('svool') #== "hello"
p decode('r slkv mlylwb wvxlwvh gsrh nvhhztv') #== "i hope nobody decodes this message"

puts
def decode(message)
  alphabet = ('a'..'z').to_a

  h = Hash[alphabet.reverse.zip(alphabet)]
  p h
  message.chars.map { |char| h.fetch(char, ' ') }.join
end
p decode('svool') #== "hello"
# p decode("r slkv mlylwb wvxlwvh gsrh nvhhztv") #== "i hope nobody decodes this message"
# fetch
# fetch(key) → object
# fetch(key, default_value) → object # nice! fetch can take a second argument, default
