# ddaaiillyy ddoouubbllee
# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!

# Problem
# -write a method
# -the method takes a str as an argument
# -the method needs to reduce multiple same characters to just 1 character

# Examples
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

# Data Structures
# input - a str
# output - a NEW str

# Algorithm
# -Initialize a result variable and point it to an empty str
# -initialize a counter
# -iterate over the argument str
# -see if the 2nd character is NOT same as first
# -if 2nd character is NOT same as first, add the first one to the result
# -advance the counter and now look at the 3rd character and 2nd character
# -do the same for all the characters
# -return the result string

def crunch(str)
  result = ''
  counter = 0
  while counter < str.size
    if str[counter + 1] != str[counter] # last counter is 5, 'o', which is compared with counter + 1 so with nil
      result << str[counter]
    end
    counter += 1
  end
  result
end

p crunch('halloo') == 'halo'
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

puts

=begin
Question:
ddaaiillyy ddoouubbllee
Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze or
String#squeeze!.

-----------------------
Input: String
Output: New string with consecutive duplicates removed
Rules:
  Explicit Requirements
    - Method takes a string argument
    - Method ALWAYS returns a NEW STRING
      - Contains value of original string with all consecutive duplicate
        characters collapsed (ie: aaedd => aed)
    - May not use String#squeeze or String#squeeze!

  Implicit Requirements
    - Not worried about spaces
    - Empty string returns new empty string

-----------------------
Examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == '' # maybe return a String.new?

-----------------------
Data Structure: Array to iterate through words
Algorithm:
1. Create method `crunch` with one param `str`
  a. Explicitly return new empty string if `str` is empty
  b. Explicitly return duplicate of string if `str` size is 1
  c. Initialize `result` to an empty array
  d. Initialize `placeholder` to an empty array
  e. Initialize `arr` to `str` split into array
  f. Iterate through `arr` array for each `word`
    1. Initialize `current_letter` an empty string
    2. Iterate through `word` for each `char`
      a. If `char` is equal to `current_letter` next
      b. Else push `char` into `placeholder` array, and set `current_letter` to
        `char`
    3. Join the `placeholder` array and push it into the `result` array
    4. Reassign `placeholder` to an empty array for the next iteration
  g. Implicitly return `result`
-----------------------
Code:
=end

def crunch(str)
  # return String.new if str.empty? # String.new satisifes new string req.
  # return str.dup if str.size.eql?(1) # dup method satisfies new string req.
  result = []
  placeholder = [] # placeholder is a temporary array for a single word
  arr = str.split
  arr.each do |word|
    current_letter = ''
    word.each_char do |char|
      if char.eql?(current_letter)
        next
      else
        placeholder << char
        current_letter = char
      end
    end
    result << placeholder.join
    placeholder = [] # that's why we reassign it to an empty array once we're done with a single word and want to start with the next one
  end
  result.join(" ")
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# AJ's solution
