# INTERVIEW ASSESSMENT
#
# - Zoom & Coderpad
# - One hour. Two problems.
# - Focus: Structured problem-solving approach, Ruby fluency, Communication ability.
# - No documentation but personal notes okay.
# - Don't be afraid to spend lots of time on PEDA before jumping into C.
# - Make sure you understand the problem.
#   - Feel free to ask questions.
#   - ***Check test cases for implicit rules***.
#   - Write down what you find out to refer back to later.
# - Develop your algorithm from a top-down approach.
# - Test code frequently and verbally explain your expectations.
# - Preparation: RB101-RB109 Small Problems, Pair up with other students.
# - Codewars, esp. the problem set that circulates around

# Practice
# Re-order the characters of a string, so that they are concatenated into
# a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing
# the english alphabet letters.

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

# Have the method letter_changes(str) take the str parameter being passed and
# modify it using the following algorithm.

#Replace every letter in the string
# with the 3rd letter following it in the alphabet
# (ie. c becomes f, Z becomes C).
# Then return this modified string.

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')
