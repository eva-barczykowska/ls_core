# 11.Extract the domain name from a URL
# (https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby)
# 5 kyu
=begin
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

domain_name("http://github.com/carbonfive/raygun") == "github"
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"

P:
write a method that takes a url and extracts and returns the domain name as a string

input: String
return: String

rules:
-identify and return domain name in string
-no consistent beginning or ending to urls
-domain name can contain punctuation

E:
domain_name("http://github.com/carbonfive/raygun") == "github"

new_string = '://github'


domain_name("http://www.zombie-bites.com") == "zombie-bites"

new_string = "://www.zombie-bites"

D:
-iterative structure to loop over index positions on input string
-new string
-second iterative structure to loop over new string

A:
-initialize new_string to an empty string
-initialize alphabet range a-z and convert to array
-iterate from 0 up to size of input string, exclusive (index)
-use current index to access element at that index in input string
  -until element is not included in range a-z, next
  -push element at current index to new string until element equals a period

  -iterate over each character with index (letter, index)
    -if letter is not included in range a-z
      -go to next iteration
    -else
      take slice of new string from current index up to index -1 (end of string)
      -return the slice as result

=end

# def domain_name(url)
#   new_string = ''
#   alphabet = ('a'..'z').to_a
#   (0...url.size).each do |index|
#     next until !alphabet.include?(url[index])
#     return new_string if url[index] == '.'
#     new_string << url[index]
#   end
#   new_string
# end

# my algorithm
# verify what if // are present, if yes, delete everything until the // (included) and then chop everything after the dot
# verify if www is present, delete everything until the first dot(included) and then chop everything after the 2nd dot

def domain_name(str)
  array = str.chars
  if array.include?("/")
    slash = array.index("/") + 2
    left_done = array.drop(slash)
    second_dot = left_done.index(".")
    left_done.shift(second_dot).join
  elsif array.take(3).all? { |char| char == "w" }
    first_dot = array.index(".").next
    left_done = array.drop(first_dot)
    second_dot = left_done.index(".")
    left_done.shift(second_dot).join
  end
end
p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"

puts

#rebecca's solution
def domain_name(string)
  if string.include?('/')
    split_string = string.split('/') #=> ["http:", "", "google.com"]
    substrings_with_period = split_string.select { |ss| ss.include?('.') } #["google.com"]
    # p substrings_with_period
    period_split = substrings_with_period[0].split('.') #["google", "com"]
    # p period_split
    substrings = period_split.delete_if { |el| el == 'www' }
    substrings.first
  else
    indices = []
    string.each_char.with_index { |char, index| indices << index if char == '.'} #getting indices of all dot characters
    string[indices[0].succ...indices[1]]
  end
end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
p domain_name("http://github.com/carbonfive/raygun") == "github"
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"

puts

def url_with_forward_slash(string)
  split_string = string.split('/')
  substrings_with_period = split_string.select { |ss| ss.include?('.') }
  period_split = substrings_with_period[0].split('.')
  substrings = period_split.delete_if { |el| el == 'www' }
  substrings.first
end

def url_with_no_forward_slash(string)
  indices = []
  string.each_char.with_index { |char, index| indices << index if char == '.'}
  string[indices[0].succ...indices[1]]
end

def domain_name(string)
  if string.include?('/')
    url_with_forward_slash(string)
  else
    url_with_no_forward_slash(string)
  end
end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
p domain_name("http://github.com/carbonfive/raygun") == "github"
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"

ef url_with_forward_slash(string)
split_string = string.split('/')
substrings_with_period = split_string.select { |ss| ss.include?('.') }
period_split = substrings_with_period[0].split('.')
substrings = period_split.delete_if { |el| el == 'www' }
substrings.first
end

def url_with_no_forward_slash(string)
  indices = []
  string.each_char.with_index { |char, index| indices << index if char == '.'}
  if indices.size > 1
    string[indices[0].succ...indices[1]]
  else
    string.split('.').first
  end
end

def domain_name(string)
  string.include?('/') ? url_with_forward_slash(string) : url_with_no_forward_slash(string)
end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
p domain_name("http://github.com/carbonfive/raygun") == "github"
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"

