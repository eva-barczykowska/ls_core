# Problem
# Build a diamond from letters, each consecutive row is a consecuitive alphabet letter
# get the max point of the diamond because based on that you can start calculating spaces
# diamond is empty inside
# assumption: the index of the letter is how many spaces to give it at the beginning before the A letter - ????
# spaces before decrease by 1, spaces inside increase by 2
#
# the number of initial spaces before is equal to the index of the max letter (E)
#
# Example:
#     A    centered on 9 ---- 4 spaces, letter, 4 spaces
#    B B                 -----3 spaces, letter, space_inside, letter
#   C   C                -----2 spaces, letter, space_inside * 3, letter
#  D     D               -----1 space, letter, space_inside * 5, letter
# E       E              -----0 spaces, letter, space_inside * 7, letter         => E is at index 4 of our alpha array - does this matter? yes, we need 4 spaces before we print A to start the diamond
#  D     D
#   C   C
#    B B
#     A

#   A    centered on 9  ---- 3 spaces, letter, 3 spaces
#  B B                  ---- 2 spaces, letter, space inside, letter, 2 spaces
# C   C                 ---- 1 spaces, letter, 3 spaces inside, letter, 1 space
#  B B
#   A

# Algorithm
# diamond(letter_at_max_point)
# find its index
# that index is the amount of spaces to start with,
# eg.letter = E, spaces_before = alphabet.index("E"), spaces_in_between = 0
# while the index of the current letter is less than the index of the target letter (letter at max point)
# index_of_current_letter = alphabet[0]
# with each iteration:
# increase index_of_current_letter by 1 so maybe reassign it while looping
# increase the spaces_in_between by 2
# decrease the spaces_before by one

ALPHABET = ("A".."Z").to_a

def get_diamond_base(letter_at_max_point)
  spaces_before = ALPHABET.index(letter_at_max_point) # 4
  base = "#{" " * spaces_before}#{ALPHABET[0]}"
  puts base
end

def get_diamond(letter_at_max_point)
  get_diamond_base(letter_at_max_point)

  spaces_before = ALPHABET.index(letter_at_max_point) - 1
  spaces_in_between = 1
  index = 1

  while index <= ALPHABET.index(letter_at_max_point)
  puts "#{" " * spaces_before}#{ALPHABET[index]}#{" " * spaces_in_between}#{ALPHABET[index]}"
    spaces_before -= 1
    spaces_in_between += 2
    index += 1
  end

  spaces_before = 1
  spaces_in_between = (ALPHABET.index(letter_at_max_point) * 2) - 3
  index = ALPHABET.index(letter_at_max_point) - 1
  until index == ALPHABET.index("A")
    puts "#{" " * spaces_before}#{ALPHABET[index]}#{" " * spaces_in_between}#{ALPHABET[index]}"
    spaces_before += 1
    spaces_in_between -= 2
    index -= 1
  end

  get_diamond_base(letter_at_max_point)

end

letter = "E"
get_diamond(letter)

letter = "H"
get_diamond(letter)

letter = "K"
get_diamond(letter)

letter = "Z"
get_diamond(letter)
