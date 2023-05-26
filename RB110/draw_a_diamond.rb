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
# -initialize ALPHABET, this will be useful :-)
# -create a method `get_diamond_base(letter_at_max_point)`
# -the above method will take care of the very top point and the very bottom point of the diamond
# -we can calculate the spaces before the top point of the diamond ("A") if we have `letter_at_max_point`, so the widest
#  part of the triangle
# `letter_at_max_point` is passed an an argument to the get_diamond base so we can find out which index it is in the
#  alphabet, eg.letter = E, spaces_before = alphabet.index("E"), this will be 4 because
# 4 spaces, letter A 4 spaces (but we worry only about spaces BEFORE and, from the 2nd row on, spaces IN BETWEEN letters)
# spaces_in_between = 0 in the first row of the diamond because there is only 1 letter
# -the above is our helper method to create top and bottom of the diamond

# -now we can write the main method
# -within this main method, at the beginning and end we will call the helper method to draw top and bottom of the diamond
# -then we will draw the rest of the diamond, we will use 2 loops to do that
# -the first loop will draw the first half, the ascending part
# -the second loop will build the second half, the descending part
# -we will calculate spaces before by using the index of the letter at max point - 1 (- 1 coz "A" is already drawn)
# we initialize index to 1 (coz "A" was at index 0 in the alphabet, so we've already used index 0 and the next one is 1)
# this is the first row where we will have to letters, B B, so we need to initialize `spaces_in_between` to `1`.

# while the index is less than the index of the target letter (letter at max point)
# -print the correct number of spaces before the letter
# -print the target letter (in the 2nd row it's B), this is the left border of the diamond
# -print the correct number of spaces in between, with B it's just 1 space
# print the correct letter (in the 2nd row it's B again), this is the right border of the diamond
# -decrease spaces before by 1 (because the diamond expands from the top point)
# -increase spaces between by 2 (because spaces increase as we draw the diamond)
# -increase index by 1 (because next row will have consecutive alphabet letter)
# -finish the loop

# -now start the decreasing loop (diamond reached its max width and now will decrease)
# -but we have to initialize some variables for the loop to access
# spaces before = 1, that is our target, and we will print letters until we reach this target
# -(we will decrease the distance between the borders of the diamond until space of 1 char is reached)
# -until space in between characters is 1 character
# -use letter_at_max_point to calculate the amount of spaces in between, (coz now we need to decrease them )-how?
# -retrieve index of the letter at max point, this is 4 in case of "E".
# - double to calculate all the spaces needed
# -and subtract 3, we need to subtract 2 spaces, coz this row is 2 spaces less than the previous one
# -and we also need to subtract 1 space for the letter "A" , so 2+1 = 3
# we are 1 row below the widest point of the diamond
# with each iteration:
# decrease index_of_current_letter by 1 so maybe reassign it while looping
# decrease the spaces_in_between by 2
# increase the spaces_before by one

#use the helper method again to draw the bottom of the diamond

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

puts
# could this be done also with rjust?
# -find out number of spaces for the first line
# -the first line will be that number of spaces plus the letter
# -2nd line will be 1 less space, letter for the left outline, 1 letter in between and 1 letter after for the right outline
# -then I will have to increase the space between by 2 and decrease the space from the left by one

# -print the first letter A
# -print the second row with the letters B B
# -continue in a loop until max width of the diamond was reached
# -while going, decrease number of spaces from the left by 1 and increase number of spaces inside the diamond
# once the widest point has been reached, now draw the other half, where the diamond decreases
#
# could come back to this, but study how rjust and ljust work first



