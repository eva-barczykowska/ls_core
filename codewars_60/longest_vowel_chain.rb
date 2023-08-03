# 5.Longest vowel chain
# (https://www.codewars.com/kata/59c5f4e9d751df43cf000035/train/ruby)
# 7 kyu
=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io.
The longest of these has a length of 2.
Given a lowercase string that has alphabetic characters only and no spaces,
return the length of the longest vowel substring. Vowels are any of aeiou.

PEDAC TEMPLATE

************** Problem **************
-write a method that takes a single string
-find all vowel substrings
-the method returns the length of the longest vowel substring
-vowels are aeiou

-create an array of every possible combination of the 5 vowels

Questions:

************** Examples **************
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5

************** Data Structures **************
input: string, no spaces, no special characters, lowercase
output: the longest vowel cluster/substring
************** Algorithm **************
-define an array `vowels`
-get all possible - combinations of the vowels (permutation)
-my permutations are arrays of strings
-join these permutations so that I get 1 big array with all possible combinations
(and not a nested array)

-find all substrings
-go through all these substrings and if they are same as any in the all_combinations array,
save them to the result array
-from the result array, select the longest string

suoidea
-s, su, suo, suoi, suoid, suoide, suoidea
-u, uo, uoi, uoid, uoide, uoidea
-o, oi, oid, oide, oidea
-i, id, ide, idea
-d, de, dea

compare substrings to 'aeiou'

'suoid' -'aeiou'

************** Code **************
=end
# def solve(str)
#   substrings = []
#   (0...str.size).each do |start_index|
#     (start_index...str.size).each do |end_index|
#     substrings << str[start_index..end_index]
#     end
#   end
#  substrings

# vowels = %W(a e i o u)
# combinations = vowels.permutation(5).to_a + vowels.permutation(4).to_a + vowels.permutation(3).to_a + vowels.permutation(2).to_a

# joined = combinations.map do |subarray|
#   subarray.join
# end

# all_combinations =  joined + vowels
# result = []
# # result = all_combinations &substrings # ["uoi", "ea", "oi", "uo", "a", "e", "i", "o", "u"]
# all_combinations.each do |combination|
#   result << combination if substrings.include?(combination)
# end # ["uoi", "ea", "oi", "uo", "a", "e", "i", "o", "u"]
# result.map {|e| e.size}.max
# result
# end

def substrings(string)
  (0...string.size).each_with_object([]) do |st_idx, sub_array|
    (st_idx...string.size).each do |end_idx|
      sub_array << string[st_idx..end_idx] if string[st_idx..end_idx].chars.all? {|char| char.match?(/[aeiou]/)}
    end
  end
end

# p substrings("suoidea")

def solve(string)
  substrings(string).max_by {|substring| substring.size}.size
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5

# vowels = %W(a e i o u)
# p vowels
# combinations = vowels.permutation(5).to_a + vowels.permutation(4).to_a + vowels.permutation(3).to_a + vowels.permutation(2).to_a
# joined = combinations.map do |subarray|
#   subarray.join
# end

# all_combinations =  joined + vowels
#
puts
puts "codewars"
# ************** Problem **************
# -write a method that takes a string as an argument
# -in that string find all substrings
# -in those substrings - what is the longest vowel substring?
# -return its length
# ************** Examples **************
# p solve("codewarriors") == 2
# p solve("suoidea") == 3
# p solve("iuuvgheaae") == 4
# p solve("ultrarevolutionariees") == 3
# p solve("strengthlessnesses") == 1
# p solve("cuboideonavicuare") == 2
# p solve("chrononhotonthuooaos") == 5
# ************** Data Structures **************
# Input: string

# Output: integer
# ************** Algorithm **************
# -create `substrings` variable
# -create a vowel variable containing all vowels
# -create all substrings from the string argument:
# -outer iteration: iterate from 0 to string.size - 1
# -inner iteration: iterate from start to str.size
# -extract all possible strings
# -append a string to`substrings`

# -now iterate over the substrings and transform them into the number of CONSECUTIVE vowels they have
# -return the maximum number
# ************** Code **************
# ************** Refactor **************
VOWELS = 'aeoiu'
def solve(str)
  substrings = []

  (0...str.size).each do |index1|
    (index1...str.size).each do |index2|
      substring = str[index1..index2]
      substrings << substring if substring.chars.all? { |char| VOWELS.include?(char) }
    end
  end

  return 0 if substrings.empty?

  substrings.max_by(&:size).size
end
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("prst")

puts "rewriting the code to be more efficient"
puts
# Why did my code time out?
# Our servers are configured to only allow a certain amount of time for your code to execute.
# In rare cases the server may be taking on too much work and simply wasn't able to run your code efficiently enough.
# Most of the time though this issue is caused by inefficient algorithms.
# If you see this error multiple times you should try to optimize your code further.
#
# initialize VOWELS constant
# -initialize `substrings` array
# -initialize `current_substring` string
#
# -iterate over each character of the argument string
# -initialize a variable for `current_character` to str[index] and `next_character` to str[index + 1]
# -if the current character is a vowel, add it to the current_substring variable
#
# -if next_character is not a vowel, is a consonant or it is nil (because current_character is last in the string),
# add the `current_substring` to `substrings` array
#
# -clear `current_substring` to '' so that you can start from scratch creating next current_substring
# -when finished iterating, means I have all consecutive vowel substrings
#
# -check which one is the biggest in size
# -return its size
VOWELS = 'aeoiu'
def solve(str)
  substrings = []
  current_substring = ''

  str.each_char.with_index do |char, index|
    current_char = str[index]
    next_char = str[index + 1]

    current_substring << current_char if VOWELS.include?(current_char)

    if next_char.nil? || !VOWELS.include?(next_char)
      substrings << current_substring
      current_substring = ''
    end
  end

  substrings.max_by(&:size).size
end
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("prst") == 0