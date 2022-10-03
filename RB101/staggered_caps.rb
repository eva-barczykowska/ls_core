# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count as
# characters when switching between upper and lowercase.

# Explicit rules
# Given a string, return a new string where every other character is capitalized
# characters that are not letters should not be changed but they count as
# characters when switching between upper and lower case

# Data structure
# -input: string
# -output: string

# Algorithm:
# -make an array
# -downcase all elements of the array
# -capitalize every other character
# -special characters should stay as they are but they should count while
# switching case

def staggered_case(str)
  array = str.split.each do |word|
    word.downcase!
  end
  p array
  split_array = array.join(" ").split("")
  p split_array
  split_array.each_with_index do |char, index|
    char.upcase! if index.even?
  end
  p split_array.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts ""
puts "LS solution"
puts ""

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts ""

# a concise solution I liked:
def staggered_case(string)
  string.downcase.chars.map.with_index do |char, index|
    index.even? ? char.upcase : char
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts ""

# also this:

def staggered_case(string)
  result = []
  string.chars.each_with_index do |char, index|
    index.even? ? result << char.upcase : result << char.downcase
  end
  result.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# and this one:
def staggered_case(string)
  othrstr = ''
  i = 0
  while i < string.size-1
    othrstr << string[i].upcase << string[i+1].downcase
    i +=2
  end
  othrstr
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts ""
puts "Further exploration"
puts ""

# Further Exploration
# Can you modify this method so the caller can request that the first character
# be downcased rather than upcased? If the 1st character is downcased, then the
# second character should be upcased, and so on.
# Hint: Use a keyword argument.

# changing my method first
def staggered_case(str)
  array = str.split.each do |word|
    word.downcase!
  end
  p array
  split_array = array.join(" ").split("")
  p split_array
  split_array.each_with_index do |char, index|
    char.upcase! if index.odd?
  end
  split_array.join
end

p staggered_case('I Love Launch School!') == "i lOvE LaUnCh sChOoL!"
p staggered_case('ALL_CAPS') == "aLl_cApS"
p staggered_case('ignore 77 the 444 numbers') == "iGnOrE 77 tHe 444 nUmBeRs"

puts ""

# changing ls method

def staggered_case(string)
  result = ''
  need_upper = false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  # result.swapcase!
  result
end

p staggered_case('I Love Launch School!') == "i lOvE LaUnCh sChOoL!"
p staggered_case('ALL_CAPS') == "aLl_cApS"
p staggered_case('ignore 77 the 444 numbers') == "iGnOrE 77 tHe 444 nUmBeRs"
