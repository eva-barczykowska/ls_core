# Given a string, multiply each letter by the most recent preceding number in
# the string. Return a new string containing only the letters, multiplied by
# their preceding number.

# Problem
# =======
# -method takes a str with numbers
# -method returns a str in which letters from original str are multiplied by a number:
# -each letter is multiplied by a number found before it (closest)
#
# Examples:
# p mult_string('3abc') == 'aaabbbccc'
# => only 1 digit, 3 which is used for all of the letters
#
# p mult_string('123abc') == ')aaabbbccc'
# => the closest digit to all the letters is 3
#
# p mult_string('2g4ab13t0gh')) == 'ggaaaabbbbttt'
# => closest digit used
#
#
# p mult_string('1a5b20hi3cw')) == 'abbbbbcccwww'
# => there is a 0 here, else closest digit used
#
# Algorithm:
# =========
# -INIT DIGITS for reference
#
# -INIT new_str
# -INIT multiplier to 0
# -ITERATE over the characters in the str
# -if the char at curr iteration is a number, save it to `multiplier`
# -else use `multiplier` that I have to construct a new string from scratch
# -for that multiply current char times multiplier and append to `new_str`
#
# -RETURN `new_str`
DIGITS = %w[0 1 2 3 4 5 6 7 8 9]

def mult_string(str)
  new_str = ''
  multiplier = 0

  counter = 0
  while counter < str.size
    if DIGITS.include?(str[counter])
      multiplier = str[counter].to_i
    else
      new_str << str[counter] * multiplier
    end
    counter += 1
  end
  new_str
end
p mult_string('3abc') == 'aaabbbccc'
p mult_string('123abc') == 'aaabbbccc'
p mult_string('2g4ab13t0gh') == 'ggaaaabbbbttt'
p mult_string('1a5b20hi3cw') == 'abbbbbcccwww'
