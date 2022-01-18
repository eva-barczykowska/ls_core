# Longest vowel chain
# The vowel substrings in the word codewarriors are o,e,a,io.
# The longest of these has a length of 2. Given a lowercase string that has
# alphabetic characters only and no spaces, return the length of the longest
# vowel substring. Vowels are any of aeiou.
#
# input: string
# output: integer, the number of consecutive vowel chain
# algorithm:
# -I'm going to look at every character in the string/iterate
# -if it is a vowel, I am going to increase the counter
# -if next character is a vowel, I am going to increase the counter, etc.
# if next character is not a vowel, I am going to save the keep the counter
# by saving it to a variable
# and I'm going to reset the counter (to be 0 for the next potential clusters)
# -then I am going to keep looking for another cluster
# -if all characters are finished, return the result, the biggest cluster

def solve(str)
  vowels = %w(a e i o u)
  vowel_cluster = 0
  res = []
  array = str.chars
  array.each_with_index do |char, index|
    if vowels.include?(char)
      vowel_cluster += 1 # at this point vowel_cluster is 4 for "iuuvgheaae"
      res << vowel_cluster if array.size == index + 1 # the end of the word
    else
      res << vowel_cluster
      vowel_cluster = 0
    end
  end
  res.max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4 # no next character -- it doesn't go to else
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
