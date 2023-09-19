=begin
# Create a function that takes a string and returns the number (count) of vowels contained within it.

Rules:
Input: - string
Output: - integer

E:
count_vowels("Celebration") == 5
e, e, a, i, o

A:
 - initialize result to 0
 - initialize vowels variable and store a,e,o,i,u inside
 - iterate through the arg str and if a char is a vowel, add 1 to the result

- return the result
=end

VOWELS = %( a e o i u)
def count_vowels(str)
  result = 0

  str.chars.each do |ch|
    if VOWELS.include?(ch)
      result += 1
    end
  end

  result
end
p count_vowels("Celebration") == 5
p count_vowels("Palm") == 1
p count_vowels("Prediction") == 4