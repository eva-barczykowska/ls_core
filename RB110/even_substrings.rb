# If module is not included but not defined, error is: NameError: uninitialized constant Human::Speak
# from solution.rb:15:in `<class:Human>'
# If module is defined but not included, error is: NoMethodError: undefined method `speak' for #<Human:0x00007fe2e7add258>
# from solution.rb:21:in `<main>'

# Problem 10
# Create a method that takes a string of digits as an argument and returns the number of even-numbered substrings that can be formed. For example, in the case of '1432', the even-numbered substrings are '14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.
#
# If a substring occurs more than once, you should count each occurrence as a separate substring.
# p even_substrings('1432') == 6
# p even_substrings('3145926') == 16
# p even_substrings('2718281') == 16
# p even_substrings('13579') == 0
# p even_substrings('143232') == 12
#
# Problem
# ========
# -method takes a string argument
# -method returns number of EVEN-NUMBERED substrings that can be formed
# what does it mean EVEN-NUMBERED?
# -substrings which REPRESENT EVEN NUMBERS
#
# Examples
# ========
# p even_substrings('1432') == 6
# => '14', '1432', '4', '432', '32', and '2' => 6
# => even sized strings are selected OR numbers that are even
# ["1", "14", "143", "1432", "4", "43", "432", "3", "32", "2"]
# why 43 is not selected?
# Because we are counting substrings that REPRESENT EVEN NUMBERS
#
# p even_substrings('3145926') == 16
# =>
# p even_substrings('2718281') == 16
# p even_substrings('13579') == 0
# p even_substrings('143232') == 12
#
# Algorithm
# =========
# INIT `all_substrings`
#
# ITERATE over the str argument
# GET `all_substrings`
# -start with index 0 iterate until last index
# --start with index `start` iterate until last index
# --get a substring
# --store this subtring in `all_substrings`
#
# COUNT substrings, which, when converted to an Integer, are even
def even_substrings(number_string)
  all_substrings = []

  (0...number_string.size).each do |start|
    (start...number_string.size).each do |finish|
      substring = number_string[start..finish]
      all_substrings << substring
    end
  end
  all_substrings.count { |s| s.to_i.even? }
end
p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
