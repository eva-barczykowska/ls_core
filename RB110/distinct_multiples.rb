# Problem 16
# Create a method that returns the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. You may assume that the input string contains only alphanumeric characters.
#
# p distinct_multiples('xyz') == 0               # (none
# p distinct_multiples('xxyypzzr') == 3          # x, y, z
# p distinct_multiples('xXyYpzZr') == 3          # x, y, z
# p distinct_multiples('unununium') == 2         # u, n
# p distinct_multiples('multiplicity') == 3      # l, t, i
# p distinct_multiples('7657') == 1              # 7
# p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
# p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5
#
# Problem
# =======
# -method takes a str as an argument
# -method returns the number of distinct case-insensitive alphabetic characters and numeric digits
# that occur more than once in the string
# -case doesn't matter
#
# Examples
# ========
# p distinct_multiples('xyz') == 0               # (none)
# => none occurs more than once
#
# p distinct_multiples('xxyypzzr') == 3          # x, y, z
# => x, y z occur more than once
#
# p distinct_multiples('xXyYpzZr') == 3          # x, y, z
# => same as above
# p distinct_multiples('unununium') == 2         # u, n
# => u, n
# p distinct_multiples('multiplicity') == 3      # l, t, i
# => l, t, i
# p distinct_multiples('7657') == 1              # 7
# => 7
#
# p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
# p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5
#
# Algorithm
# ==========
# DOWNCASE the str
#
# TRANSFORM to array
#
# TALLY the chars, store result in `count`
#
# SELECT from the hash keys for values that occur MORE THAN ONCE
def distinct_multiples(str)
  count = str.downcase.chars.tally

  count = count.select { |_key, value| value > 1 }.keys

  return 0 if count.empty?

  count.size
end
p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5

puts

def distinct_multiples(str)
  count = str.downcase.chars.tally.select { |_key, value| value > 1 }.keys
  count.size
end

puts

def distinct_multiples(str)
  str.downcase.chars.tally.select { |_key, value| value > 1 }.keys.size
end
