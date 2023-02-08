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
