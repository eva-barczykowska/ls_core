# https://launchschool.com/exercises/6eb02aae
# Staggered Caps (Part 2)
# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.
#
# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
#
# PREVIOUS CODE WAS

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

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts
puts "solution, has next"

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if !ALPHABET.include?(char)
      result += char
      next # next moves to the next character without executing the rest of the flow
    elsif need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts
puts "solution, without next but also giving correct result"

def staggered_case(str)
  res = ''
  need_upper = true

  str.chars.each do |char|
    if !ALPHABET.include?(char)
      res += char
      next #next make it skip everything else and go back to the next characters (and it does not reach ot of the each so need_upper stays the same)
    elsif need_upper
      res += char.upcase
    else
      res += char.downcase
    end
    need_upper = !need_upper # very important where we place this
  end
  res
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
