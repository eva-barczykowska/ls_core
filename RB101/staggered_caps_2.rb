=begin
Staggered Caps (Part 2)
Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each letter.
The non-alphabetic characters should still be included in the return value;
they just don't count when toggling the desired case.

Examples:
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
=end

# Problem
# -right now the non-alphabetic characters count when it comes to changing a character
#  from uppercase to lowercase and vice-versa
# -I need to change this method in such a way, that the non-alhabetic characters
#  are not considered

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper if char =~ /[a-zA-Z]/ # so if this was nonalphabetic character, do not consider it
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# before it was
# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts ""

# ls solution

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i # the /i means ignore case
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts ""

# changing my own solution (part 1)
def staggered_case(str)
  array = str.split.each do |word|
    word.downcase!
  end
  split_array = array.join(" ").split("")
  split_array.each_with_index do |char, index|
    char.upcase! if index.even?
  end
  split_array.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts ""

# other solutions

def staggered_case(string)
  count = 0
  string.chars.map do |x|
    if x =~ /[a-z]/i
      count += 1
      count.odd? ? x.upcase : x.downcase
    else
      x
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


puts

def staggered_case(str)
  letters = (("a".."z").to_a << ("A".."Z").to_a).flatten!
  count = -1
  arr = str.chars.map do |char|
    count += 1
    if (count.odd? && letters.include?(char)) then char.downcase
    elsif (count.even? && letters.include?(char)) then char.upcase
    else char end
  end
  arr.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts ""
puts "Further exploration"
puts ""

# Further Exploration
# Modify this method so the caller can determine whether non-alphabetic
# characters should be counted when determining the upper/lowercase state.
# That is, you want a method that can perform the same actions that this method
# does, or operates like the previous version.
# Hint: Use a keyword argument.

# PEDAC
# Problem
# -give the method the possibility to decide:
# -count nonalphabetic characters or not while upcasing/downcasing characters
#
# Examples
# staggered_case('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
# staggered_case('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'

def staggered_case(string, count_nonalph_chars: true)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if count_nonalph_chars  # here I am using the keyword argument
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
    need_upper = !need_upper
    else
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper if char =~ /[a-z]/i
    end
  end
  result
end

# Don't like this too much as a lot of code is repeated

p staggered_case('I Love Launch School!', count_nonalph_chars: true) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('I Love Launch School!', count_nonalph_chars: false) == 'I lOvE lAuNcH sChOoL!'
