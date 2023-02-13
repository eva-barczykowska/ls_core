# 11.Extract the domain name from a URL
# (https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby)
# 5 kyu
=begin
Write a function that when given a URL as a string,
parses out just the domain name and returns it as a string. For example:

domain_name("http://github.com/carbonfive/raygun") == "github"
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"
=end
# PEDAC TEMPLATE

# ************** Problem **************
# -from the website address, return only the domain name, without the .com

# Questions:

# ************** Examples **************
# p domain_name("http://google.com") == "google"
# # everything between // and .
# p domain_name("http://google.co.jp") == "google"
# # everything between // and the first dot
# p domain_name("www.xakep.ru") == "xakep"
# # everything between the 2 ..
# p domain_name("https://youtube.com") == "youtube"
# evertything between // and .
# if we don't have slashes but we have www., then return the string between
# 2 dots

# ************** Data Structures **************
# input: string, URL
# output: string, only the domain name
# ************** Algorithm **************
# -convert the arg string to an array
# -if the array starts with http
# -drop every character until // included
# -see what's left
# -drop everything after the first dot - this the result

# -convert the arg string to an array
# -if the array starts with https
# -drop every character until // included
# -see what's left
# -drop everything after the first dot - this the result

# else
# -the array starts with www
# -drop the www
# -take everything that's left
# -get rid of everything after the first dot(dot included)

# -return the result

# ************** Code **************

def domain_name(url)
  url.gsub!('http://', '') # deletes prefix
  url.gsub!('https://', '') # deletes prefix
  url.gsub!('www.', '') # deletes
  url.split(".")[0]
end
p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"
p domain_name("icann.org") == "icann"

