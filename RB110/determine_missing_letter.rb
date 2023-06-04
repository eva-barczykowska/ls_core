
=begin
Write a method that takes an array of consecutive letters as input and returns the missing letter.

p determine_missing_letter(['a','b','c','d','f']) == 'E'
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []
=end
# PEDAC TEMPLATE
#
# ************** Problem **************
# -write a method
# -the method takes an array of consecutive letters as input
# -amoung these leters, 1 letter is missing
# -the method returns the letter that is missing

# ************** Examples **************
# p determine_missing_letter(['a','b','c','d','f']) == 'E'
# => e is missing but notice that the method returns CAPITAL E when argument is in lowercase
# p determine_missing_letter(['o','q','r','s']) == 'P'
# => p is missing but notice that the method returns CAPITAL P when argument is in lowercase
# p determine_missing_letter(['H','J','K','L']) == 'i'
# => I is missing but notice that the method returns lowercase i when argument is in uppercase
# p determine_missing_letter([]) == []
# => empty array means empty array is returned, account for this as well
# ************** Data Structures **************
# Input: an array of letters, lowercase or uppercase
#   Middle: how I’m going to get from where I am to where I want to be
# Output: a lowercase or uppercase letter that was missing from the consecutive letters
# if the argument array elements are lowercase, then the return letter is uppercase and vice versa
#   ************** Algorithm **************
# -return an empty array if argument is an empty array
# - define alphabet, a range of letters from the first letter of the argument until the last
# - subtract the argument array from the defined alphabet, which letter is the result?
# - return that letter but in the opposite case than it is in the argument array
# ************** Code **************
def determine_missing_letter(array)
  return [] if array.empty?

  correct_alphabet = (array.first..array.last).to_a

  (correct_alphabet - array).join.swapcase
end
p determine_missing_letter(['a','b','c','d','f']) == 'E'
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []
