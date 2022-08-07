=begin
ddaaiillyy ddoouubbllee
Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

PEDAC
Problem:
-write a method that takes a string and returns a new string
-the new string has all the consecutive dupplicate characters collapsed into a single character

Examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

Data Structures
input: string
output: new string

Algorithm
-initialize result variable to an empty array
-split the string and look at every character in turn
-add characters to the new string in turn but while adding, if the character you
 are about to add is same as the previous character you've added, skip it and
 go to the next character
-once finished iterating over the argument, join the result string and return it

Code
=end

def crunch(str)
  result = []
  str.split("") do |char|
    result << char unless result.last == char
  end
  result.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''


puts ""
#ls solution

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

#write PEDAC for the ls solution
# -initialize the index variable to integer 0
# -initialize the variable that will be my result, crunch_text
# -use a loop to go over the text and while looping add the character at
#  the current index unless that character is the same as a character at the previous index
# -increase the index
# -end the loop when the index is 1 less than the text length(because the text starts from 0)
# -return the crunch_text variable

puts ""

#Further exploration
# You may have noticed that we continue iterating until index points past the end
# of the string. As a result, on the last iteration text[index] is the last
# character in text, while text[index + 1] is nil. Why do we do this?
# What happens if we stop iterating when index is equal to text.length?
# -the last character will not be included in the result string

def crunch(text)
  index = 0
  crunch_text = ''
  text = text.chars
  while index <= text.length - 1 #here when the text lengh is 1, it will result in 0 and nothing will be added
    # p text[index]
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

p 'xxx'
p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''

# Can you determine why we didn't useString#each_char or String#chars to iterate
# through the string? How would you update this method to use String#each_char or String#chars?

puts ""
def crunch(string)
  counter = 0
  clean = ''
  until counter == string.length
    if string[counter] != string[counter + 1]
      clean << string[counter]
    end
    counter += 1
  end
  clean
end
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

puts ""

#with_object can create the string without needing to initialize it above the iterator:
def crunch(string)
  string.each_char.with_object('') do |letter, new_string|
    new_string << letter unless new_string[-1] == letter
  end
end
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

puts ""

def crunch(str)
  str.chars.slice_when {|chr1, chr2| chr1 != chr2}.map(&:uniq).join
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''

puts ""
def crunch(str)
  str.gsub(/(.)\1+/, '\1')
end
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
