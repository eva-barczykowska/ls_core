=begin
22. Scramblies
(https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby)
5 kyu
Complete the method scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged
to match str2, otherwise returns false.

  Notes:
  Only lower case letters will be used (a-z). No punctuation or digits will be included.
    Performance needs to be considered ????
               Input strings s1 and s2 are nil terminated.
    PEDAC TEMPLATE

************** Problem **************
-write a method that takes 2 strings
-can a portion of str1 characters be rearranged to match str2?
-the method returns true if yes, false otherwise

Questions: What does it mean s1 and s2 are nil terminated

************** Examples **************
p scramble('rkqodlw', 'world') == true
->because part of this string ('rkqodlw'), when rearranged is the same as str2
p scramble('cedewaraaossoqqyt', 'codewars') == true
->because part of this string ('cedewaraaossoqqyt'), when rearranged is the same as str2
p scramble('katas', 'steak') == false
->because 'e' and is missing to get 'staeak'
p scramble('scriptjava','javascript') == true
->because ALL of this string ('scriptjava'), when rearranged is the same as str2
p scramble('scriptingjava','javascript') == true
->because part of this string ('scriptingjava'), when rearranged is the same as str2

************** Data Structures **************
input: 2 strings
middle: array
output: boolean, true or false

************** Algorithm **************
-split both strings into an array
-ask if all characters of b are included in a
-if yes, method returns true
-otherwise method returns false
************** Code **************
=end
def scramble(s1, s2)
  s1 = s1.split("")
  s2 = s2.split("")
  s2.all? { |ch| s1.include?(ch) }
end
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true
p scramble('scriptingjava','jaavascript') == false # we added this one
# OR
def scramble(str1, str2) # doesnt work for last test we made up due to double ltrs
  str2.chars.all? do |char|
    str1.chars.include?(char)
  end
end
# OR
def scramble(string1, string2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  string1.chars.each {|letter| hash1[letter] += 1}
  string2.chars.each {|letter| hash2[letter] += 1}
  p hash1
  p hash2
  hash2.all? do |k, v| # a, 3
    hash1.keys.include?(k) && hash1[k] >= v # hash1[a] will retn 2, if 2 >= 3 then return true else return false
  end
end
# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('rkqodlw','world') == true
# p scramble('cedewaraaossoqqyt','codewars') == true
# p scramble('katas','steak') == false
# p scramble('scriptjava','javascript') == true
# p scramble('scriptingjava','javascript') == true
p scramble('scriptingjava','jaavascript') == false # we added this one

puts
# my solution with tally

def scramble(string1, string2)
  h1 = string1.chars.tally
  h2 = string2.chars.tally
  p h1
  p h2
  h2.all? do |key, value|
    h1.keys.include?(key) && h1[key] >= value
  end
end
# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('rkqodlw','world') == true
# p scramble('cedewaraaossoqqyt','codewars') == true
# p scramble('katas','steak') == false
# p scramble('scriptjava','javascript') == true
# p scramble('scriptingjava','javascript') == true
p scramble('scriptingjava','jaavascript') == false # we added this one


puts
puts "Sedrick's solution"

⋄≂≂▫≂≂▫≂≂▫≂▫≂▫≂≂▫≂≂▫≂⋄—◟ Algorithm ◞—⋄≂▫≂≂▫≂≂▫≂≂▫≂▫≂≂▫≂≂▫≂≂≂⋄

▣ Access each char in str2
▣ Check if they are all included in str 1
▣ Return true if they are

=end

def scramble(str1, str2)
  str2.chars.all? { |char| str1.include?(char) }
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

puts

puts "Kana's solution"
def scramble(str1, str2)
  str2.chars.all? {|char| str1.count(char) >= str2.count(char)}  # more flexible, takes care of the last test case where it matters HOW MANY As are there
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptingjava','javascript') == true
p scramble('scriptjva','javascript') == false


