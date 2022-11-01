=begin
What Century is That?
Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century number,
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000
comprise the 20th century.

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

PEDAC
Problem
-write a method
-the method takes a number as an argument
-the method returns a string representing century, eg. 5th, 21st, 17th
-the ending of the century has to be appropriate, like 'th' or 'nd' (duh, of course!)

rule: new centuries begin in years that end with 01, e.g.
1901-2000 represent 20th century
2001- 2100 will be 21st century
201-300 - 3rd century
1-10 - 1st century
10101-10200 - 102nd century
1001-1100 - 11th century
1101-1200 - 12th century
11201-11300 = 13th century

Examples
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

Data structures
input: Integer
output: String

Algorithm
-see if the number is evenly divisible by 100, if yes, this is my century right there
-if it is not, it means I need to add 1 to the century (e.g. 1956/100 = 19 BUT years 1901-2000 comprise 20th century)
-how to get the proper ending?
-write a method for the right ending
-if the year ends in 1, 2, 3, the ending is 'st', 'nd' and 'rd' respectively
 -however, there is an exception to this 11th, 12th, 13th
-while coding, deal with the nubmer first, then worry about the ending

Code
=end

def append_century_ending(century)
  century = century.to_s
  if century.end_with?("11") || century.end_with?("12") || century.end_with?("13")
    century << "th" # first take care of exceptions, then deal with everything else
  else
    if century.end_with?("1")
      century << "st"
    elsif century.end_with?("2")
      century << "nd"
    elsif century.end_with?("3")
      century << "rd"
    else
      century << "th"
    end
  end
end

def century(number)
  if number % 100 == 0
    century = number / 100 # e.g. 2000 / 100 = 20
  else
    century = (number / 100) + 1 # e.g. 2001 is century 21
  end
  append_century_ending(century) # when we have the number, we convert it to a strting and append the ending
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

puts ""

def century(year)
  century = (year / 100.0).ceil.to_s

  if century[-2] == '1'
    century + 'th'
  elsif century[-1] == '1'
    century + 'st'
  elsif century[-1] == '2'
    century + 'nd'
  elsif century[-1] == '3'
    century + 'rd'
  else
    century + 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

puts ""

TEENS =  ('11'..'19').to_a

def century(year)
  century = ''
  if year <= 100
    return '1st'
  elsif year % 100 == 0
    century = (year/100).to_s + 'th'
  elsif TEENS.include?((year/100 + 1).to_s[-2..-1])
    century = (year / 100 + 1).to_s + 'th'
  else
    century = (year / 100 + 1).to_s
    if century[-1] == '1'
      century += 'st'
    elsif century[-1] == '2'
      century += 'nd'
    elsif century[-1] == '3'
      century += 'rd'
    else
      century += 'th'
    end
  end
  century
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

puts ""

NUM_ENDINGS = { 0 => 'th', 1 => 'st', 2 => 'nd', 3 => 'rd', 4 => 'th',
                5 => 'th', 6 => 'th', 7 => 'th', 8 => 'th', 9 => 'th' }

def century(year)
  cen = (year.to_f / 100).ceil
  if (10..20).include?(cen.to_s.slice(-2, 2).to_i)
    suffix = 'th'
  else
    suffix = NUM_ENDINGS[cen.to_s.slice(-1).to_i]
  end
  cen.to_s + suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

puts ""

def century(number)
  century_num = number % 100 == 0 ? (number / 100).to_s : (number / 100 + 1).to_s
  return century_num += 'th' if century_num[-2] == '1'
  return century_num += 'st' if century_num[-1] == '1'
  return century_num += 'nd' if century_num[-1] == '2'
  return century_num += 'rd' if century_num[-1] == '3'
  return century_num += 'th'
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
