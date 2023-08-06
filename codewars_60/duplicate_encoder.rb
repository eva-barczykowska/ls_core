#The goal of this exercise is to convert a string to a new string where each character in the new string is "("
# if that character appears only once in the original string, or ")" if that character appears more than once
# in the original string. Ignore capitalization when determining if a character is a duplicate.

# ************** Problem **************
# -write a method that takes a str as an argument
# -the method return a string as well
# -but the chars are replaced by ( or )
# -( if the char has appeared only once in the string and ) if the char has appeared more than once
# -ignore capitalization
# ************** Examples **************
# p duplicate_encode("din") == "((("
# => because d, e, i appear only once in the string
# p duplicate_encode("recede") #== "()()()"
# => r appears only once so (
# => e appears more than once so )
# => c appears only once so (
# => e appears more than once so )
# => c appears only once so (
# => e appears more than once so )

# p duplicate_encode("Success") == ")())())" #"should ignore case"
# => s appears more than once (we ignore case!) so )
# => u appears only once so (
# => c appears more than once so )
#  => c appears more than once so )
# => e appears only once so (
# => s appears more than once so )
# => s appears more than once so )
# p duplicate_encode("(( @") == "))(("
# ************** Data Structures **************
# Input:str
#
# Output: new string
# ************** Notes **************
# ************** Algorithm **************
# -initialiaze an empty `new_str` to store result
#-iterate over the str
# -for each character in the str
# -if a character appears more than once, add to new_str ), else add (
# -join and return new_str
# ************** Code **************
# ************** Refactor **************

def duplicate_encode(word)
  new_str = ''
  word = word.downcase

  word.each_char do |char|
    count = word.count(char)
    if count > 1
      new_str << ")"
    else
      new_str << "("
    end
  end

  new_str
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())" #"should ignore case"
p duplicate_encode("(( @") == "))(("
p duplicate_encode("EveeeRaaaaAYeC") == ")()))()))))()("