#  Write a function, negate, that converts all â€œyesâ€ words to "no" and "no"
# words to "yes" in a sentence. The comparison for "yes" and "no" should be case
# insensitive."yes" and "no" should be negated even if ending with ., ?, ,, or !.
#
# A:
# - INIT `new_str` to store result
#
# -SPLIT str arg into array
#
# -IDENTIFY all yes and no versions and store in a {}
# --key: version, value: the opposite that is required
#
# -ITERATE over the arr and if the word at the current iteration exists in the {} as key,
# --change it for the value
# --otherwise add it to the new_str as it is
#
# -join new_str because it's currently an array
#
# -account for spaces??
def negate(str)
  new_str = []

  reference = { 'Yes' => 'No', 'Yes.' => 'No.', 'Yes,' => 'No,', 'Yes?' => 'No?', 'Yes!' => 'No!', 'yes.' => 'no.',
                'yes' => 'no', 'yes,' => 'no,', 'yes?' => 'no?', 'yes!' => 'no!', 'No' => 'Yes', 'No.' => 'Yes.', 'No,' => 'Yes,', 'No?' => 'Yes?', 'No!' => 'Yes!', 'no' => 'yes', 'no.' => 'yes.', 'no,' => 'yes,', 'no?' => 'yes?', 'no!' => 'yes!' }

  arr = str.split.each do |word|
    new_str << if reference.keys.include?(word)
                 reference[word]
               else
                 word
               end
  end

  new_str.join(' ')
end
puts negate('Yes, I said no but now I say yes.') == 'No, I said yes but now I say no.'
puts negate('no way, yes way!') == 'yes way, no way!'
puts negate('Yesterday is not today?') == 'Yesterday is not today?'
puts negate('No, I do not know!') == 'Yes, I do not know!'

puts 'refactor'

def negate(str)
  new_str = []

  reference = { 'Yes' => 'No', 'Yes.' => 'No.', 'Yes,' => 'No,', 'Yes?' => 'No?', 'Yes!' => 'No!', 'yes.' => 'no.',
                'yes' => 'no', 'yes,' => 'no,', 'yes?' => 'no?', 'yes!' => 'no!', 'No' => 'Yes', 'No.' => 'Yes.', 'No,' => 'Yes,', 'No?' => 'Yes?', 'No!' => 'Yes!', 'no' => 'yes', 'no.' => 'yes.', 'no,' => 'yes,', 'no?' => 'yes?', 'no!' => 'yes!' }

  arr = str.split.each do |word|
    new_str << word unless reference.keys.include?(word)
    new_str << reference[word] if reference.keys.include?(word)
  end

  new_str.join(' ')
end
puts negate('Yes, I said no but now I say yes.') == 'No, I said yes but now I say no.'
puts negate('no way, yes way!') == 'yes way, no way!'
puts negate('Yesterday is not today?') == 'Yesterday is not today?'
puts negate('No, I do not know!') == 'Yes, I do not know!'
