# Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# ()
# )( -no!
#
# Problem:
# -write a method that returns true or false
# -true if parentheses are balanced, false if they're not
# -balanced means each ( has a )
#
#
# Examples:
# balanced?('What (is) this?') == true
# =>
# balanced?('What is) this?') == false
# => 1 missing
# balanced?('What (is this?') == false
# => 1 missing
# balanced?('((What) (is this))?') == true
# =>
# balanced?('((What)) (is this))?') == false
# =>       ('What is this)?')
# balanced?('Hey!') == true
# =>
# balanced?(')Hey!(') == false
# balanced?')Hey!(' == false
#
# balanced?('What ((is))) up(') == false
#
# balanced?('What ())(is() up') == false
#
# DS:
# input: str with parentheses
# output: true or false depends if parethensis are matching ()
#
# A:

# -define alphabet, lower and upper
# - delete all chars that are non ( or ) (all alphabet char) plus also delete punctuation marks
#
# -how to verify that every ( has a )?
#
# -delete () until no more () are found
# -mutate the string, in a loop replace each occurence of () with nothing
# -do this until no more () are found
#
# -now if the resulting string is empty, return true, else return false
def balanced?(str)
  uppercase = *('A'..'Z').to_a << '?' << '!' << '.' << ' '
  lowercase = *('a'..'z')
  alphabet = lowercase + uppercase

  str = str.chars.reject { |char| alphabet.include?(char) }.join

  str.gsub!('()', '') while str.include?('()')

  str.empty?
end
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false

puts

# ls solution

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false

puts
# a very interesting idea of actually counting ( and ) and replacing them by +1 and -1 and then checking if they even out
# initialize `parenthesis` to 0
# iterate over each character
# add 1 to `parenthesis` if you find (
# substract 1 from `parenthesis` if you find )
# at the end, the value of `parenthesis` should be 0 to return true
# if it is not, return false

def balanced?(str)
  parenthesis = 0
  str.each_char do |char|
    parenthesis += 1 if char == '('
    parenthesis -= 1 if char == ')'
    break if parenthesis < 0
  end

  parenthesis == 0
end
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
