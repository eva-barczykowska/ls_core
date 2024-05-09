#
# Problem 11
# Create a method that takes a nonempty string as an argument and returns an array consisting of a string and an integer. If we call the string argument s, the string component of the returned array t, and the integer component of the returned array k, then s, t, and k must be related to each other such that s == t * k. The values of t and k should be the shortest possible substring and the largest possible repeat count that satisfies this equation.
#
# You may assume that the string argument consists entirely of lowercase alphabetic letters.
#
# p repeated_substring('xyzxyzxyz') == ['xyz', 3]
# p repeated_substring('xyxy') == ['xy', 2]
# p repeated_substring('xyz') == ['xyz', 1]
# p repeated_substring('aaaaaaaa') == ['a', 8]
# p repeated_substring('superduper') == ['superduper', 1]
#
# Problem
# ========
# -method takes an non-empty str
# -method returns an array of 1 str and 1 int, substrings and int
# -if we call the str argument s, it must be that s * int == target
# -values of s and k should be the shortest possible substrings and the largets possible repeat t
#
# Examples
# =========
# p repeated_substring('xyzxyzxyz') == ['xyz', 3]
# 'xyz--xyz--xyz' => 3
#
# p repeated_substring('xyxy') == ['xy', 2]
# 'xy-xy' => 2
#
# p repeated_substring('xyz') == ['xyz', 1]
# 'xyz' => if no greater int found, return 1
#
# p repeated_substring('aaaaaaaa') == ['a', 8]
# 'a a a a a a a a'
# => so we analyze from size 1 but we are looking for substrings greater than size 1
#
# p repeated_substring('superduper') == ['superduper', 1]
# => 'superduper' => only 1 is possible
#
# Algorithm
# =========
# CREATE `all_substrings`
#
# SELECT only those, which, multipled by a number, equal to the argument
#
# -work with their size
# ITERATE over `all_substrings`
# SELECT THOSE which, when their size used as a divisor for the string argument, leave no reminder
#
# `all_substrings`
# -INIT `int` which is the str.size divided by the substring size
# -arg size divided by substring size has to be 0
# -if it is:
#
# RETURN an array with [substring, int]
def repeated_substring(str)
  all_substrings = []

  (0...str.size).each do |start|
    (start...str.size).each do |finish|
      all_substrings << str[start..finish]
    end
  end

  all_substrings.select! { |substring| str.size % substring.size == 0 }

  all_substrings.each do |substring|
    int = str.size / substring.size
    return [substring, int] if substring * int == str
  end
end
p repeated_substring('xyzxyzxyz') #== ['xyz', 3]
p repeated_substring('xyxy') #== ['xy', 2]
p repeated_substring('xyz') #== ['xyz', 1]
p repeated_substring('aaaaaaaa') #== ['a', 8]
p repeated_substring('superduper') #== ['superduper', 1]

puts

def even_substrings(digits)
  count = 0
  n = digits.length

  # Iterate through all possible substrings
  (0...n).each do |i|
    (i...n).each do |j|
      substring = digits[i..j]

      # Check if the substring forms an even number
      count += 1 if substring.to_i.even?
    end
  end

  count
end

# Test cases
puts even_substrings('1432')      # Output: 6
puts even_substrings('3145926')   # Output: 16
puts even_substrings('2718281')   # Output: 16
puts even_substrings('13579')     # Output: 0
puts even_substrings('143232')    # Output: 12
