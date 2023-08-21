# Given two strings, the first being a random string and the second being the same as the first,
# but with three added characters somewhere in the string (three same characters),

# Write a function that returns the added character
# string1 = "hello"
# string2 = "aaahello"
#
# // => 'a'
# The above is just an example; the characters could be anywhere in the string and string2 is actually shuffled.
# string1 = "abcde"
# string2 = "2db2a2ec"
#
# // => '2'
# Note that the added character could also exist in the original string
# string1 = "aabbcc"
# string2 = "aacccbbcc"
#
# // => 'c'
# You can assume that string2 will always be larger than string1, and there will always be three added characters in string2.
# PEDAC
# ************** Problem **************
# -write a method that takes 2 string
# -first is random, 2nd is first with 3 extra characters added, the characters are same eg.333 or rrr
# -the characters can be added anywhere in the string
# -method has to return the character that has been added in the 2nd string
# -I see only lowercase chars so assuming no need to take care of uppercase
# ************** Examples **************
# p added_char("hello","checlclo") =='c'
# =>coz -C-he-C-l-C-lo => c has been added 3 times
# p added_char("aabbcc","aacccbbcc") =='c'
# => c has been added 3 times consecutively
# p added_char("abcde","2db2a2ec") =='2'
# =>2 has been added
# ************** Data Structures **************
# Input: 2 string
#
# Output: a string
# ************** Notes **************
# tally on array
# ************** Algorithm **************
# -initialize `result`
# calculate characters and their counts from the 1st string, store this in a hash
# calculate characters and their counts from the 2nd string, store this in a hash
# eg for s1 "abcde" and s2" 2db2a2ec":
# {"a"=>1, "b"=>1, "c"=>1, "d"=>1, "e"=>1}
# {"2"=>3, "d"=>1, "b"=>1, "a"=>1, "e"=>1, "c"=>1}
# calculate characters and their counts from the 2nd string, store this in a hash
#compare the values in 2 hashes,
# if a given value in h2 is 3 times more than in h1
# this is the result, return it (return h2_key)
# else
# if a given value wasn't there in h2 but exists in h2, return it

#
# if this doesn't produce a result, compare the keys in hashes
# eg for "aabbcc","aacccbbcc"
# {"a"=>2, "b"=>2, "c"=>2}
# {"a"=>2, "c"=>5, "b"=>2}
# we see that c in the 2nd hash == c in the 1st hash + 3
# so which value for a given key is that value + 3 in the 2nd hash
#
# store that value in a result
# return result
# ************** Code **************
#
# ************** Refactor **************
# Average runtime: ?? ms

def added_char(s1, s2)  # doesn't pass all tests on codewars
  result = ''
  h1 = s1.chars.tally
  h2 = s2.chars.tally


  h2.each do |h2_key, h2_value|
    h1.each do |_, h1_value|
      if h2_value == h1_value + 3
        return result << h2_key
      elsif !h1.keys.include?(h2_key)
        return h2_key
      end
    end
  end
  result
end

p added_char("hello","checlclo") =='c'
p added_char("aabbcc","aacccbbcc") =='c'
p added_char("abcde","2db2a2ec") =='2'

puts
# ************** Algorithm **************
# -initialiaze `result`
# -sort the characters by and group by themselves, this gives me a hash with key-character and value -array of characters
# {"c"=>["c", "c", "c"], "e"=>["e"], "h"=>["h"], "l"=>["l", "l"], "o"=>["o"]}
# {"e"=>["e"], "h"=>["h"], "l"=>["l", "l"], "o"=>["o"]}
#
# or
# {"a"=>["a", "a"], "c"=>["c", "c", "c", "c", "c"], "b"=>["b", "b"]}
# {"a"=>["a", "a"], "b"=>["b", "b"], "c"=>["c", "c"]}
#
# if hash key wasn't there in h1 but exists in h2 and its value is 3, return it
# elsif compare all the values for given keys and if the value for a given key in h2 is + 3 when compared with the same key in h1
# return that key

def added_char(s1, s2)  # doesn't pass all tests on codewars
  result = ''
  h1 = s1.chars.sort.group_by(&:itself)
  h2 = s2.chars.sort.group_by(&:itself)
  # {"c"=>["c", "c", "c"], "e"=>["e"], "h"=>["h"], "l"=>["l", "l"], "o"=>["o"]}
  # {"e"=>["e"], "h"=>["h"], "l"=>["l", "l"], "o"=>["o"]}
  h2.each do |h2_key, h2_value|
    h1.each do |h1_key, h1_value|
      if h1.keys.none? { |key| key == h2_key } && h2_value.size == 3 #if the 2nd hash has an extra key that the 1st one didn't have and that key.size == 3
        result = h2_key
      # elsif compare all the values for given keys and if the value for a given key in h2 is + 3 when compared with the same key in h1
      # # {"a"=>["a", "a"], "c"=>["c", "c", "c", "c", "c"], "b"=>["b", "b"]}
      # # {"a"=>["a", "a"], "b"=>["b", "b"], "c"=>["c", "c"]}
    else
      if h2_value.size == h1_value.size + 3
        result = h2_key
      end
      end
    end
  end

  result
end

p added_char("hello","checlclo") =='c'
p added_char("aabbcc","aacccbbcc") =='c'
p added_char("abcde","2db2a2ec") =='2'

puts
def added_char(s1, s2)  # doesn't pass all tests on codewars
  result = ''
  arr1 = s1.chars.sort
  arr2 = s2.chars.sort

  print arr1
  puts
  print arr2

  result = arr2 - arr1 # gives me chars that haven't been there before but are here now
  if result.empty?
    result = arr2 - (arr1 & arr2) #if the previous array is empty, subtract from h2 common characters
  else
    h1 = arr1.tally
    h2 = arr2.tally
    h2.each do |k2, v2|
      h2.each do |k1, v1|
        result << k2 if k2
      end
    end
    end


  result
end

p added_char("hello","checlclo") =='c'
p added_char("aabbcc","aacccbbcc") =='c'
p added_char("abcde","2db2a2ec") =='2'

puts "another try"
# another try
# Given two strings, the first being a random string and the second being the same as the first,
# but with three added characters somewhere in the string (three same characters),

# Write a function that returns the added character
# string1 = "hello"
# string2 = "aaahello"
#
# // => 'a'
# The above is just an example; the characters could be anywhere in the string and string2 is actually shuffled.
# string1 = "abcde"
# string2 = "2db2a2ec"
#
# // => '2'
# Note that the added character could also exist in the original string
# string1 = "aabbcc"
# string2 = "aacccbbcc"
#
# // => 'c'
# You can assume that string2 will always be larger than string1, and there will always be three added characters in string2.

# P:
# we have 2 strings passed in as arguments to a method
# the 2nd string has 3 extra characters
# our method needs to establish which 3 characters are extra
# return the character that occurs 3 times more in the 2nd string
#
# A:
# -split and sort s1 and s2
# -initialize results variable
# -subtract s1 from s2 and save the result to `result`
# -if result.size is 3, we can return it
# else
# retrieve the chars that are in both arrays (&) and save the result to `common`
# -iterate over the common characters
# -while iterating count and if it turns out that a2 has more of any character than a1 (by 3 chars!)
#  return that character

def added_char(s1, s2)
  a1 = s1.split("").sort
  a2 = s2.split("").sort

  res = a2 - a1

  if res.size == 3
    return res[0]
  else
    common = a1 & a2
    common.each do |char|
      if a2.count(char) == a1.count(char) + 3
        return char
      end
    end
  end
end
p added_char("hello","checlclo") =='c'
# => c is a new char that hasn't occurred in s1
p added_char("aabbcc","aacccbbcc") =='c'
# => c actually occurred in s1
p added_char("abcde","2db2a2ec") == '2'
# => 2 hasn't occurred in s1

puts "refactor my solution"
# refactor
def added_char(s1, s2)
  a1 = s1.split("")
  a2 = s2.split("")

  res = a2 - a1

  return res[0] if res.size == 3

    common = a1 & a2

    common.each do |char|
      if a2.count(char) == a1.count(char) + 3
        return char
      end
    end

end
p added_char("hello","checlclo") =='c'
# => c is a new char that hasn't occurred in s1
p added_char("aabbcc","aacccbbcc") =='c'
# => c actually occurred in s1
p added_char("abcde","2db2a2ec") == '2'
# => 2 hasn't occurred in s1
puts
# solution from codewars
def added_char(s1, s2)
  s2.split("").uniq.each do |c|
    return c if s2.count(c) > s1.count(c)
  end
end
p added_char("hello","checlclo") =='c'
p added_char("aabbcc","aacccbbcc") =='c'
p added_char("abcde","2db2a2ec") == '2'

puts

# trying to solve with Sedrick's idea

# trying to solve with Sedrick's idea to remove characters
# I'm removing characters that are different and saving
# Given two strings, the first being a random string and the second being the same as the first,
# but with three added characters somewhere in the string (three same characters),
# ≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◟ Algorithm ◞≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂
# -initialize `res` array to store the result

# Convert input strings into an array of chars, `arr1` and `arr2`
# sort both

# initialize `counter`
# loop over `arr2`
# remove from the `arr2` the char that is there in the first array
# store it in `res` array

# return `res`
# =end

def added_char(str1, str2)
  res = []

  arr1 = str1.chars.sort
  arr2 = str2.chars.sort

  counter = 0
  while counter < arr2.size
    if  arr2[counter] != arr1[counter]
      res << arr2[counter]
      counter += 1
    else
      counter += 1
    end
  end
  res[0]

end


p added_char("hello", "checlclo") =='c' #["c", "c", "c", "e", "h", "l", "l", "o"]
p added_char("aabbcc", "aacccbbcc") =='c' # ["c", "c", "c"]
p added_char("abcde", "2db2a2ec") == '2' #["2", "2", "2", "a", "b", "c", "d", "e"]


puts

def added_char(str1, str2)
  res = []

  arr1 = str1.chars.sort
  arr2 = str2.chars.sort

  counter = 0
  while counter < arr2.size
    if  arr1[counter] != arr2[counter]
      res << arr2.shift[counter]
    else
      counter += 1
    end
  end

  return res[0] if res.none? { |element| element.nil? }
  return arr2.last

end

p added_char("hello", "checlclo") =='c'
p added_char("aabbcc", "aacccbbcc") =='c'
p added_char("abcde", "2db2a2ec") == '2'


puts
puts "final solution"

#what is I removed characters that are SAME, not different?
# split and sort into an Array
# -use counter to iterate over the chars in the array
# if a char at a certain index in `arr1` is same as char at the same index in `arr2`, remove that
# char from `arr2`
# -that way we will iterate over `arr2` getting rid of chars that exist in `arr1`
# -our resulting array will have chars that are extra and also chars that exist in 2nd array but not in first
# -count the chars and if there is a char whose count is >= 3, select it
#-this will give me an array of extra chars
# return first one (it doesn't really matter which one coz they're all same)

def added_char(str1, str2)
  arr1 = str1.chars.sort
  arr2 = str2.chars.sort

  counter = 0
  while counter < arr2.size
    if  arr1[counter] == arr2[counter] # removed only same elements at the beginning of the array
      arr2.shift
    else
      counter += 1
    end
  end

  arr2.select { |elem| arr2.count(elem) >= 3 }.uniq.join
end

p added_char("hello", "checlclo") =='c'
p added_char("aabbcc", "aacccbbcc") =='c'
p added_char("abcde", "2db2a2ec") == '2'

puts
puts "further refactor this"
def added_char(str1, str2)
  arr1 = str1.chars.sort
  arr2 = str2.chars.sort

  counter = 0
  while counter < arr2.size
    arr1[counter] == arr2[counter] ? arr2.shift : counter += 1
  end

  arr2.select { |elem| arr2.count(elem) >= 3 }[0]
end

p added_char("hello", "checlclo") =='c'
p added_char("aabbcc", "aacccbbcc") =='c'
p added_char("abcde", "2db2a2ec") == '2'

puts
def added_char(str1, str2)
  str1.chars.each { |char| str2.sub!(char, '') if str2.include?(char) }
  str2[0]
end
p added_char("hello", "checlclo") =='c'
p added_char("aabbcc", "aacccbbcc") =='c'
p added_char("abcde", "2db2a2ec") == '2'