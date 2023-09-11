# The marketing team is spending way too much time typing in hashtags.
# Let's help them with our own Hashtag Generator!

# Here's the deal:
# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.
# Examples
# " Hello there thanks for trying my Kata" => "#HelloThereThanksForTryingMyKata"
# " Hello World " => "#HelloWorld"
# "" => false
# =end
# p generateHashtag("") == false
# =>coz of space
# p generateHashtag(" " * 200) == false
# => coz there is an integer
# p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
# => generated hashtag, spaces removed
# p generateHashtag("Codewars") == "#Codewars"
# => generated hashtag
# p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
# => generated hashtag, spaces removed, case preserved
# p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
# => generated hashtag, spaces removed, case preserved
# p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
# =>spaces have been added but then they are removed while creating the hashtag
# also, 2nd word is capitalized
# p
# generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
# oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
# =>over 140 characters
# p generateHashtag("a" * 139) == "#A" + "a" * 138
# p generateHashtag("a" * 140) == false
# =>coz of length

# PEDAC
# ************** Problem **************
# -write a method generate_hashtag
# -in the final hashtag:
# -all words must have their 1st letter capitalized
# -method returns false if final result < 140 chars
# -if input/result  == "", method returns false
# ************** Examples **************

# p generateHashtag("") == false
# =>coz of space
# p generateHashtag(" " * 200) == false
# => coz there is an integer
# p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
# => generated hashtag, spaces removed
# p generateHashtag("Codewars") == "#Codewars"
# => generated hashtag
# p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
# => generated hashtag, spaces removed, case preserved
# p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
# => generated hashtag, spaces removed, case preserved
# p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
# =>spaces have been added but then they are removed while creating the hashtag
# also, 2nd word is capitalized
# p
# generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
# oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
# =>over 140 characters
# p generateHashtag("a" * 139) == "#A" + "a" * 138
# p generateHashtag("a" * 140) == false
# ************** Data Structures **************
# Input:string, an empty str, a str multiplied: ("a" * 139)

# Output:false if str == "" or greater than 140
# OR a str starting with #, all words capitalized, spaces deleted
# OR
# ("a" * 139) == "#A" + "a" * 138
# -start with a #
# -capitalize the first char,
# -use the + method to add remaining characters
# ************** Notes **************
# ************** Algorithm **************

# -return false if str is empty or greater than 140

# -split the str and save result to an array
# -capitalize every word in the array
# -join the str and prepend with #
# ************** Code **************
# ************** Refactor **************

def generate_hashtag(str)
  return false if str.empty? || str.size >= 140

  arr = str.split
  arr = arr.each { |e| e.capitalize! }.join.prepend("#")
end
# p generate_hashtag("") == false
# p generate_hashtag(" " * 200) == false
# p generate_hashtag("a" * 140) == false
# p generate_hashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
# oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
# p generate_hashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
# p generate_hashtag("Codewars") == "#Codewars"
# p generate_hashtag("Codewars Is Nice") == "#CodewarsIsNice"
# p generate_hashtag("Codewars is nice") == "#CodewarsIsNice"

p generate_hashtag("code" + " " * 140 + "wars") #== "#CodeWars"
p generate_hashtag("a" * 139) #== "#A" + "a" * 138

