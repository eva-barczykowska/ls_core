# Write a function, negate, that converts all â€œyesâ€ words to "no" and "no"
# words to "yes" in a sentence. The comparison for "yes" and "no" should be case
# insensitive."yes" and "no" should be negated even if ending with ., ?, ,, or !.
# P:
# -write method `negate`
# -method changes 'yes' to 'no' and vice versa in a string
# -yes and no should be case insensitive
# -even if they are followed by ? or !, they should be swapped
# -case is preserved
#
# E:
# puts negate("Yes, I said no but now I say yes.") # "No, I said yes but now I say no."
# =>              No         yes             no
#
# puts negate("no way, yes way!") # "yes way, no way!"
# =>
#
# puts negate("Yesterday is not today?") # "Yesterday is not today?"
# =>
#
# puts negate("No, I do not know!") # "Yes, I do not know!"
# =>             Yes
#
# DS:
# input: str
# output: str but with YES changed to NO and NO changed to YES
#
# notes:
# Yes - No
# yes - no
#
# No - Yes
# no - yes
#
# "Yes, I said no but now I say yes.".delete(".,?!")
#
# A:
# - KEEP punctuation in a {}
#
# -INIT new_str
# - delete punctuation
# -TRANSFORM to array
#
# -ITERATE
# --if the word at the current iteration is "Yes", change it to 'No' + space
# --if the word at the current iteration is "yes", change it to 'no' + space
# --if the word at the current iteration is "No", change it to 'Yes' + space
# --if the word at the current iteration is "no", change it to 'yes' + space
#
# -remove space at the end
#
# -add punctunation back
#
# ALGORITHM
# =========
#
# + build new String based on helper methods
#
# + ITERATE over the array and look at every word
# + if a word is 'yes' or 'no' (or a variation with punctuation), change word
# ++ append the changed word to the new_str
# + else append the word to new_str as it is
#

def swap_no(word)
  if word == 'No'
    'Yes'
  elsif word == 'No,'
    'Yes,'
  elsif word == 'No.'
    'Yes.'
  elsif word == 'No!'
    'Yes!'
  elsif word == 'No?'
    'Yes?'
  elsif word == 'no'
    'yes'
  elsif word == 'no,'
    'yes,'
  elsif word == 'no.'
    'yes.'
  elsif word == 'no!'
    'yes!'
  elsif word == 'no?'
    'yes?'
  end
end

def swap_yes(word)
  if word == 'Yes'
    'No'
  elsif word == 'Yes,'
    'No,'
  elsif word == 'Yes.'
    'No.'
  elsif word == 'Yes!'
    'No!'
  elsif word == 'Yes?'
    'No?'
  elsif word == 'yes'
    'no'
  elsif word == 'yes,'
    'no,'
  elsif word == 'yes.'
    'no.'
  elsif word == 'yes!'
    'no!'
  elsif word == 'yes?'
    'no?'
  end
end
# str = "Yes"
# p swap_yes(str)

# check
def no?(word)
  # return boolean
  ['no', 'no.', 'no!', 'no?', 'no,'].include?(word.downcase)
end

def yes?(word)
  ['yes', 'yes.', 'yes!', 'yes?', 'yes,'].include?(word.downcase)
end

def negate(str)
  result = []

  array = str.split.each do |word|
    result << if no?(word)
                swap_no(word)
              elsif yes?(word)
                swap_yes(word)
              else
                word
              end
  end

  result.join(' ')
end

p negate('Yes, I said no but now I say yes.') == 'No, I said yes but now I say no.'
puts negate('no way, yes way!') == 'yes way, no way!'
puts negate('Yesterday is not today?') == 'Yesterday is not today?'
puts negate('No, I do not know!') == 'Yes, I do not know!'

puts
# > Verify if a given word counts as a `yes` or a `no`
#   - punctuation at end counts
#
# ===============================
# check - no
# -----
# "no"
# "no,"
# "no."
# "no!"
# "no?"
#
# check - yes
# ---------
# "yes"
# "yes,"
# "yes."
# "yes?"
# "yes!"
#
# check punctuation
# ------------------
# ".,?!"
#
# words
# -----
#   "Yes,"  # Not *** word <= 4 chars , Yes, No Not, not
#   "I"
#   "said"
#   "no" # if a word is <= 3 characters and includes? 'no'? && punctuation
#   "but"
#   "now"
#   "I"
#   "say"
#   "yes" # if a word is <= 4 characters and includes? 'yes'? && punctuation
#   "not"
#   "now"
#
#   Conditions
#     + a word's size is less than or equal 3
#     + matches `"no"`
#     + possibly includes punctuation
#       - `.`
#       - `,`
#       - `?`
#       - `!`
#
# > Account for case
#   > `#capitalized?`
# ==================
#
# example
# -------
# "No"
# str[0] == str[0].upcase # => `true` or `false`
#
# > Give a different answer based on case
# =======================================
# Examples
# ---------
# "No" =>  "Yes"
# if word == 'No'
#   'Yes'
# end
#
# check
# def no?(word)
#   # return boolean
# end
#
# def no?(word)
#   return "Yes if word == "No" || "No," || "No." || "No!" || "No?"
#   return "yes if word == "no" || "no," || "no." || "no!" || "no?"
# end
# => ['no', 'no.', 'no!', 'no?', 'no,'].include?(word.downcase)
#
# def yes?(word)
#   return "No if word == "Yes" || "Yes," || "Yes." || "Yes!" || "Yes?"
#   return "no if word == "yes" || "yes," || "yes." || "yes!" || "yes?"
# end
#
# ['yes', 'yes.', 'yes!', 'yes?', 'yes,'].include?(word.downcase)
#
# swap to swap all versions of no with yes and vice versa
# def swap_no(word)
#   if word == "No"
#     "Yes"
#   elsif word == "No,"
#     "Yes,"
#   elsif word == "No."
#     "Yes."
#   elsif word == "No!"
#     "Yes!"
#   elsif word == "No?"
#     "Yes?"
#   elsif word == 'no'
#     'yes'
#   elsif word == 'no,'
#     'yes,'
#   elsif word == 'no.'
#     'yes.'
#   elsif word == 'no!'
#     'yes!'
#   elsif word == 'no?'
#     'yes?'
#   else
#     word
#   end
# end

# puts negate("no way, yes way!") # "yes way, no way!"
# puts negate("Yesterday is not today?") # "Yesterday is not today?"
# puts negate("No, I do not know!") # "Yes, I do not know!"

# edward's solution
# INIT new_string
# ITERATE over the new_str words and for each word
#-- if its first 2 chars == "no" and the 3rd char doens't belong to the alphabet (coz it's punctuation), change the first 2 characters to "yes"
#--implicitly return word
#--do the same but for "No"
#--implicitly return word
#--if its first 2 chars == "yes" and the 3rd char doens't belong to the alphabet (coz it's punctuation), change the first 2 characters to "no"
#--implicitly return word
#--do the same but for "Yes"
#--implicitly return word

def negate(string)
  new_string = string.split.map! do |word|
    if word[0..1] == 'no' && !('a'..'z').to_a.include?(word[2]) # if 3rd char doens't belong to alphabet
      word[0..1] = 'yes'
      word
    elsif word[0..1] == 'No' && !('a'..'z').to_a.include?(word[2]) # same but for upper case "No"
      word[0..1] = 'Yes'
      word
    elsif word[0..2] == 'Yes' && !('a'..'z').to_a.include?(word[3]) # if 4th char doens't belong to alphabet
      word[0..2] = 'No'
      word
    elsif word[0..2] == 'yes' && !('a'..'z').to_a.include?(word[3]) # same but for lower case "yes"
      word[0..2] = 'no'
      word
    else
      word
    end
  end

  new_string.join(' ')
end

puts negate('Yes, I said no but now I say yes.') == 'No, I said yes but now I say no.'
puts negate('no way, yes way!') == 'yes way, no way!'
puts negate('Yesterday is not today?') == 'Yesterday is not today?'
puts negate('No, I do not know!') == 'Yes, I do not know!'
