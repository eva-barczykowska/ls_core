=begin
Task
You'll have to translate a string to Pilot's alphabet (NATO phonetic alphabet).

Input:
If, you can read?
Output:
India Foxtrot , Yankee Oscar Uniform Charlie Alfa November Romeo Echo Alfa Delta ?
Note:

There is a preloaded dictionary that you can use, named NATO. It uses uppercase keys, e.g. NATO['A'] is "Alfa". See comments in the initial code to see how to access it in your language.
The set of used punctuation is ,.!?.
Punctuation should be kept in your return string, but spaces should not.
Xray should not have a dash within.
Every word and punctuation mark should be seperated by a space ' '.
There should be no trailing whitespace
PEDAC
P:
- code the given string according to the NATO code
- get nato from wikipedia

E
p to_nato(If, you can read?) == India Foxtrot , Yankee Oscar Uniform Charlie Alfa November Romeo Echo Alfa Delta ?
=> each letter is transformed to a code word
=> punctuation (,.!) is kept
=> spaces should not be kept - what does this mean?

DS:
input: string
output: coded string

A:
- upcase str
- for each letter in the string, get the code word and add it to result array
- ignore spaces, do nothing for the space
- add punctuation
=end

code_words = %w( alfa bravo charlie delta echo foxtrot golf hotel india juliett kilo lima mike november oscar papa quebec romeo sierra tango uniform victor whiskey xray yankee zulu).map { |w| w.capitalize }

REFERENCE = ('A'..'Z').to_a.zip(code_words).to_h
PUNCTUATION = %w(. , !, ?)

def to_nato(input_str)
  input_str = input_str.upcase
  coded = []

  counter = 0

  while counter < input_str.size
    if REFERENCE.keys.include?(input_str[counter])
      coded << REFERENCE[input_str[counter]]
    else PUNCTUATION.include?(input_str[counter])
    coded << input_str[counter]
    end
    counter += 1
  end

  coded.join(" ").squeeze(" ")
end

p to_nato("If, you can read?") == "India Foxtrot , Yankee Oscar Uniform Charlie Alfa November Romeo Echo Alfa Delta ?"