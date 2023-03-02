=begin
35. Mexican Wave
(https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)
6 kyu

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
  Rules
1.  The input string will always be lower case but maybe empty.
  2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
  PEDAC TEMPLATE

************** Problem **************
-write a method that takes a string
-this method returns 'mexican wave':
                       -is a string argument is a word of 5 letters, I'll get 5 words BUT
-the first word starts with the capital letter and the rest chars are lowercase
-the second's word 2nd letter is capital
-the 3rd word's 3rd letter is capital
-the 4th word's 4th letter is capital
-the 5th word's 5th letter is capital

-if the str is empty, method returns will return an empty array
-if the character in the string is whitespace then pass over it as if it was an empty seat.

SPEND MORE TIME HERE, what if the string contains a space?
-the space is not counted as a character (so it is as if there was an empty seat)

Questions:

************** Examples **************
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
-this string has 8 characters if we exclude the space so we will print this string 8 times
-> T-1, W-2, O-3 space-4 W-5
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
-space is ignored, we don't take it into consideration when upcasing a letter

************** Data Structures **************
input: string, could be empty, could have spaces
middle: an array
output: a long string of strings, where in every word the next letter is capitalize, so in 1st word, first letter, etc.

************** Algorithm **************
-get rid of space from the string first and see what is the size of this string now
-use that number to print the string that many times (the original string, so with the space)

-now we need to divide this string into an array and
-loop - upcase in every word the character at the consecutive counter that is equal to the index
["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
  0-------------1-------------2--------------3-------------5(space)------6-------------7-------------8

-["two words", "two words", "two words", "two words", "two words", "two words", "two words", "two words"]
-iterate through this array and upcase the letter in each string that is at its consecutive counter
-but if the counter is a space, go to next iteration without upcasing the current element (the space that is!)

-so go over the array of strings
-in every string look at all the chars and their indexes
-if the char at the current counter is not equal to a space, capitalize this character and increase the counter
-else if the char at the current counter is equal to space, don't increase the counter
-otherwise go to next counter

-go to next word and next counter
-delete the space???

-check for the index value in the 1st word, it is a space " gap " => [" Gap ", " gAp ", " gaP "]
-if it is not equal to space, capitalize it and move to the next word
-else move on to the next character
-if it is, move to the next

************** Code **************
=end
def wave(str)
  res = []
  return [] if str.empty?
  target_str_size = str.chars.select { |char| char != " " }.size
  res << str until res.size == target_str_size
  ["two words", "two words", "two words", "two words", "two words", "two words", "two words", "two words"]
  final = []
  phrase = 0
  char = 0
  loop do
    if res[phrase][char] != " "
      # p "Phrase counter is #{phrase} and char is #{char}"
      # p "Phrase is -#{phrase}- and character is -#{res[phrase][char]}-"
      # s[0] = s[0].upcase!
      # how to change a word capitalizing the right letter???
      capitalized = res[phrase].sub(res[phrase][char], res[phrase][char].capitalize!) # problem that the are are 2 "W" in "two words" # -------> THIS IS THE PROBLEM
      # capitalized = res[phrase].chars.map! { |char| char.upcase! if res.index(char) == res.index(phrase)}
      final << capitalized

      phrase += 1
      char += 1
    elsif res[phrase][char] == " "
      char += 1
    end
    break if phrase >= res.size
  end
  # puts " 0-------------1-------------2--------------3-------------5(space)------6-------------7-------------8"

  final
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]


