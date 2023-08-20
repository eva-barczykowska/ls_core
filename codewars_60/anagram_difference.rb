=begin
30. Anagram difference
(https://www.codewars.com/kata/5b1b27c8f60e99a467000041)
6 kyu
Given two words, how many letters do you have to remove from them to make them anagrams?
Example
First word : c od e w ar s (4 letters removed) - o, d, w s - removed
Second word : ha c k er r a nk (6 letters removed) - h, a, k, r, n, k
Result : 10
Hints
A word is an anagram of another word if they have the same letters (usually in a different order).
Do not worry about case. All inputs will be lowercase.
PEDAC TEMPLATE

************** Problem **************
-an anagram of another word is a word that has same letters as the first word
-write a method that takes 2 string arguments
-the method has to return the number of letters that I need to remove from the 1st or 2nd word
-so I have to compare both strings and find the letters that are present in both strings
-these will be my anagram letters
-strings can be empty, then return 0
-if any of the string arguments are of size 1, return 1
Questions:

************** Examples **************
1: c od e w ar s - left: c, e, a, r, REMOVED - o, d, w, s
2. ha c k er r a nk - left: c e r a, REMOVED - h, a, k, r, n, k

p anagram_difference('', '') == 0
->empty strings return 0

p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
-> for the 2 words to be anagrams, 1 letter has to be removed from 1st word

p anagram_difference('ab', 'ba') == 0
-> because they already are anagrams

p anagram_difference('ab', 'cd') == 4
->remove 2 from 1st str and remove 2 from 2nd string ???? - this one is a bit tricky
->if they are totally different, sum their size and return that number

p anagram_difference('aab', 'a') == 2
->because I need to remove a and b from the 1st str arg

p anagram_difference('a', 'aab') == 2
->because I need to remove a and b from the 2nd str arg

p anagram_difference('codewars', 'hackerrank') == 10
-sort letters of both strings

************** Data Structures **************
input: a string
output: an integer

************** Algorithm **************
-account for the first 3 test scenarios first

-find letters which are both in str1 and str2
-initialize `keep` and `res`
-iterate over both strings and if the letter is in both, add it to `keep`
-now we have the target letters that we want to keep from each string
-the rest are those that need to be discarded but I need to count them

-calculate how many letters I have in each string, use hash for that
after tally, we have this:
{"a"=>1, "c"=>1, "e"=>1, "r"=>1} # anagram letters
{"a"=>1, "c"=>1, "d"=>1, "e"=>1, "o"=>1, "r"=>1, "s"=>1, "w"=>1} # str1
{"a"=>2, "c"=>1, "e"=>1, "h"=>1, "k"=>2, "n"=>1, "r"=>2} # str2

-iterate over each hash, created from str1 and str2
-and if the letters(keys of the hash) are not in keep array,
-add them to `res` and discard the key (if you discard the key, value will be discarded as well)

-you will be left with only the anagram letters, the problem is that we need only exactly the same number of those
-if there are more, we need to count them because we would need to remove them so that the both strings are anagrams

-get only the values and compare them, loop over the 2 arrays comparing values
-if the value in the 1st array is greater, add to `res` the difference arr1[counter] - arr2[counter]
-elsif the value in the 2nd array is greater, add to `res` the difference arr2[counter] - arr1[counter]
-if they are equal, do nothing

return the res array

************** Code **************
=end
def anagram_difference(str1, str2)
  return 0 if str1.empty? && str2.empty?
  return 1 if str1.empty? || str2.empty?
  return str1.size + str2.size if (str1.chars | str2.chars).size == (str1.size + str2.size)

  keep = []
  res = 0

  str1.chars.each do |char| # finding out which letters are in both strings so that we can form anagrams
    if str2.include?(char)
      keep << char
    end
  end.sort #["a", "c", "e", "r"] - I want to keep these, these are the anagram letters

  # keep = keep.tally #chars and how many of them {"a"=>1, "c"=>1, "e"=>1, "r"=>1}
  hsh1 = str1.chars.sort.tally
  hsh2 = str2.chars.sort.tally
  # {"a"=>1, "c"=>1, "d"=>1, "e"=>1, "o"=>1, "r"=>1, "s"=>1, "w"=>1}
  # {"a"=>2, "c"=>1, "e"=>1, "h"=>1, "k"=>2, "n"=>1, "r"=>2}

  hsh1.each do |k, v|  # take care of those letters that are different from our anagram letters
    if !keep.include?(k)
      res += v
      hsh1.delete(k) # delete the key (value will get deleted as well) once the value has been counted
    end
  end

  hsh2.each do |k, v| # take care of those letters that are different from our anagram letters
    if !keep.include?(k)
      res += v
      hsh2.delete(k) # delete the key (value will get deleted as well) once the value has been counted
    end
  end
  # p hsh1 # {"a"=>1, "c"=>1, "e"=>1, "r"=>1}
  # p hsh2 # {"a"=>2, "c"=>1, "e"=>1, "r"=>2}
  arr1 = hsh1.values # [1, 1, 1, 1]
  arr2 = hsh2.values # [2, 1, 1, 2]

  counter = 0
  loop do
    if arr1[counter] > arr2[counter]
      res += (arr1[counter] - arr2[counter])
    elsif arr1[counter] < arr2[counter]
      res += (arr2[counter] - arr1[counter])
    else
      res = res
    end
    counter += 1
    break if counter >= arr1.size
  end

  res
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1 # common character is a, b doesn't belong so reject it
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2 #common characters are a so I need to remove 1b but also 1a remove all characters until words are anagrams
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10

puts
# my session with Sedrick - correcting my algorithm
# PEDAC TEMPLATE
#
# ************** Problem **************
# -my method takes 2 words
# -it returns a number
# -that number means how many letters have to be removed from both of them so that they are anagrams
# /so that they sound the same
# ************** Examples **************
#    p anagram_difference('', '') == 0
#    =>0 coz empty strings
#     p anagram_difference('a', '') == 1
#     => 1 coz a has to be removed
#     p anagram_difference('', 'a') == 1
#     =>1 coz a has to be removed
#     p anagram_difference('ab', 'a') == 1
#     1 coz b has to be removed
#     p anagram_difference('ab', 'ba') == 0
#     ab and ba are anagrams so 0
#     p anagram_difference('ab', 'cd') == 4
#     =>they are totally different so we sum 2 + 2
#     p anagram_difference('aab','a') == 2
#     => 2 because a and b has to be removed
#     p anagram_difference('a', 'aab') == 2
#     2 because a and b has to be removed
#     p anagram_difference('codewars', 'hackerrank') == 10
#     => c od e w ar s (4 letters removed) | common letters are A C E R
#     => ha c k er r a nk (6 letters removed)
#
# ************** Data Structures **************
# Input: 2 strings, any or both could be empty
# Output: an integer
# ************** Algorithm **************

#    => c od e w ar s (4 letters removed) which leaves OD AR
#    => : ha c k er r a nk (6 letters removed) which leaves HA ER NK

# -convert strings into arrays
# -sort them

# find common characters in `arr1` and `arr2`

# initialize `counter`
# -loop over `arr1` from 0 to its size
# -if a char in `arr1` is different that a char at counter in `common`, delete the char at this index in arr 1 and add 1 to `result` and do not increase counter because indices will shift!
# -else just increase counter

# -now process the same way `arr2`

# -loop over `arr2`
# initialize `counter` to 0
# -if a char in `arr2` is different than the char at the same counter in `common`,
# delete the char in `arr2` and add 1 to `result` and do not increase counter because indices will shift!

# else just increase counter

# -  return result
# ************** Code **************

def anagram_difference(str1, str2)
  arr1 = str1.chars.sort
  arr2 = str2.chars.sort

  common = arr1 & arr2
  res = 0

  counter = 0
  while counter < arr1.size
    if common[counter] != arr1[counter]
      arr1.shift[counter]
      res += 1
    else
      counter += 1
    end
  end

  counter = 0
  while counter < arr2.size
    if common[counter] != arr2[counter]
      arr2.shift[counter]
      res += 1
    else
      counter += 1
    end
  end

  res
end
p anagram_difference('', '') == 0
p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab','a') == 2
p anagram_difference('a', 'aab') == 2
anagram_difference('codewars', 'hackerrank') == 10






