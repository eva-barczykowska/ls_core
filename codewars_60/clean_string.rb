# Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"
# Your task is to process a string with "#" symbols.
#
# Problem
# ========
# -method takes a string, str can be empty
# -string contains, among other chars, #
# -# means that the char before gets deleted (and the hash gets deleted too)
#
# Example
# ======
# p clean_string('abc#d##c') == "ac"
# =>
# 'abc#d##c'
# ab--d##c
# ab--#c
# ac
#
# p clean_string('abc####d##c#') == ""
# =>
# '##'
# all ##s have to go
#
# p clean_string("#######") == ""
# => if only ##s, return empty str
# p clean_string("") == ""
# => if arg "", return ""
#
# ALgorith
# ========
# if number of ##s greater than number of non-hashes, RETURN empty str
# when str is empty or when str contains only hashes, RETURN empty str
#
# -INIT `processed` = []
# -TRANFORM str arg to an `arr`
# -ITERATE the arr
# --if the char at the current iteration is not a #
# --add it to `processed`
# -if it is a #
# -remove the last char from processed and move on

def clean_string(str)
  processed = []

  str.chars.each do |char|
    if char != '#'
      processed << char
    else
      processed.pop
    end
  end

  processed.join
end
p clean_string('abc#d##c') == 'ac'
p clean_string('abc####d##c#') == ''
p clean_string('#######') == ''
p clean_string('') == ''
