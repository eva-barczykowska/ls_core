=begin
Given two strings, return the characters that are not common in the two strings.

uniq_chars("xyab","xzca") == "ybzc"
uniq_chars("a","z") == "az"
uniq_chars("abcd","de") == "abce"
uniq_chars("abc","abba") == "c"
uniq_chars("xyz","zxy") == ""

A:
- count chars in both strings and save result in a hash
- extract keys from both hashes made from s1 and s2, these are letters in both strings

- compare values in both hashes and find common ones
- iterate over keys in both hashes and if a letter is in `common`, don't add it to the result
- (reject a letter if it's on `common`)
=end
def uniq_chars(s1, s2)
  arr1 = s1.chars.tally
  arr2 = s2.chars.tally

  common = arr1.keys.sort & arr2.keys.sort
  # ["a", "b", "x", "y"] arr1
  # ["a", "c", "x", "z"] arr2

  result = arr1.keys + arr2.keys

  result.reject { |k| common.include?(k) }.join
end
p uniq_chars("xyab","xzca") == "ybzc"
p uniq_chars("a","z") == "az"
p uniq_chars("abcd","de") == "abce"
p uniq_chars("abc","abba") == "c"
p uniq_chars("xyz","zxy") == ""

# refactor
def uniq_chars(s1, s2)
  arr1 = s1.chars.tally.keys
  arr2 = s2.chars.tally.keys

  common = arr1 & arr2

  (arr1 + arr2).reject { |k| common.include?(k) }.join
end
p uniq_chars("xyab","xzca") == "ybzc"
p uniq_chars("a","z") == "az"
p uniq_chars("abcd","de") == "abce"
p uniq_chars("abc","abba") == "c"
p uniq_chars("xyz","zxy") == ""
puts

# Sylvain
def not_common_letters(str1, str2) # this method takes care of just 1 strong
  str1.chars.reject do |char|
    str2.include?(char)
  end
end

def uniq_chars(str1, str2)
  result = []
  result << not_common_letters(str1, str2) # that is why here we have to call it twice
  result << not_common_letters(str2, str1)
  result.join
end

p not_common_letters("xyab","xzca")
p not_common_letters("xyab","xzcam")

p uniq_chars("xyab","xzca") == "ybzc"
p uniq_chars("a","z") == "az"
p uniq_chars("abcd","de") == "abce"
p uniq_chars("abc","abba") == "c"
p uniq_chars("xyz","zxy") == ""

puts

# Nick
def uniq_chars str1, str2
  arr1 = str1.chars.uniq
  arr2 = str2.chars.uniq

  intersection = arr1.intersection(arr2)

  arr1_subtracted = arr1.dup - intersection # very nice!
  arr2_subtracted = arr2.dup - intersection

  arr1_subtracted.join + arr2_subtracted.join
end
p uniq_chars("xyab","xzca") == "ybzc"
p uniq_chars("a","z") == "az"
p uniq_chars("abcd","de") == "abce"
p uniq_chars("abc","abba") == "c"
p uniq_chars("xyz","zxy") == ""
