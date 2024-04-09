# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).
#
# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.
#
# P:
# -look for an odd number that is a multiple of 7
# -whose digits occur exactly once
# -method returns next `featured number` greater than the argument
#
# Examples:
# featured(12) == 21
# =>13, 14, 15, 16, 17, 18, 19, 20, 21 => 21 because it needs to be ODD
#
# featured(20) == 21
# =>
#
# featured(21) == 35
#
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987
#
# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
# => arg has to be smaller than <
#
# A
# - start counting from arg up unless argument is bigger than 9_999_999_999
# -if it is bigger, return the str "There is no possible number that fulfills those requirements"
#
# -range from arg to 9_999_999_999, convert to an array
# -find in the array the next number that is
# -odd
# -divisible by 7
# -and its digits are uniq
#
# Notes
# num.odd? && (num % 7 == 0) && (num.to_s.size == num.to_s.chars.uniq.size)
#
# PLAN B
# - start counting from arg up unless argument is bigger than 9_999_999_999
# -if it is bigger, return the str "There is no possible number that fulfills those requirements"
#
# -in a loop add 1 to the current number(starting with the argument)
# -each time check the number using the code from notes
# -break if the current created number fullfills the requirements
#
# write extra method to find out if number is my target number
# def featured(num)
#   if num >= 9_999_999_999
#     "There is no possible number that fulfills those requirements"
#   else
#     (num...9_999_999_999).to_a.find { |n| n.odd? && (n % 7 == 0) && (n.to_s.size == n.to_s.chars.uniq.size) }
#   end
# end

def is_target_number?(n)
  n.odd? && (n % 7 == 0) && (n.to_s.size == n.to_s.chars.uniq.size)
end

def featured(num)
  if num >= 9_999_999_999
    'There is no possible number that fulfills those requirements'
  else
    counter = num + 1
    loop do
      return counter if is_target_number?(counter)

      counter += 1
    end
  end
end
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
