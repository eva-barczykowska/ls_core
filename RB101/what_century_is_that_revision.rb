=begin
Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century number,
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000
comprise the 20th century.

------ PED:- 0 MIN to 12 MIN --------------

**Input** :integer
**Output** : string

**Explicit Requirements/Rules/Boundaries**
-method that takes a year/a number
-returns a century/string
-rules for the century
-it needs to be a string that begins with number
-it ends with an appropriate ending, i.e st, rd or th.

**Implicit Requirements/Rules/Boundaries**
-if it is 11th, 12th or 13th century, it ends in th although normally
- in all other cases when it's 1 then ending is st, when it's 2, ending is rd
-and when it's 3, ending is rd

**Special Terms**
-if it is 11th, 12th or 13th century, it ends in th although normally
- in all other cases when it's 1 then ending is st, when it's 2, ending is rd
-and when it's 3, ending is rd

**Examples/Test Cases**
- input: integer
- Output: string

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

**Questions**

**Data Structures**
- input:number/integer
- Output:string

--------------- A:- 12 MIN to 20 MIN------------

**Algorithm**
- I will write 1 method for the ending
- and another method for the actual century
- I will call the ending method in the century method and return a string
 as per the requirement

**Implementation details**\
-
-------------- C: 20 MIN to 25 MIN ------------------------

**CodeWithIntent****
=end

def century(year)
  century = year / 100 + 1
  century -= 1 if century / 100 == 0
  p century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)

  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end

end

# We are making use of 2 methods, one to return the century and one to return the century suffix.
# On line 67, in the body of the method, we take the passed argument (year), divide it by 100 and add 1 to it.
# We save the retun value of this expression into a variable called century.
# The century variable now covers for all the centuries except when a year finishes with 0, that is still the previous century.
# (new centuries begin with 01, e.g.years 1901-2000 make 20th century, 1900 is still 19th century.)
# So we need to account for the cases when the year finishes with 0.
# For those cases on line 68 we subtract 1 from century.
# Century is an integer so in our last line of the century method we call on it to_s method and add century suffix.
# century_suffix is a separate method, which we call with century argument.
# In the century_suffix method, we immediately return the 'th' suffix if the century finishes in 11, 12 or 13.
# These are special cases when we need to have the suffix 'th', even though the normal suffix for 1, 2 or 3 would be 'st', 'nd' and 'rd' respectively.
# After dealing with the special cases, we now proceed to deciding about the suffix for other cases.
# To do that, we define a variable called last digit and save it to the return value of century modulo 10.
# We care only about the LAST digit, because we need to define the suffix according to the last digit.
# We already dealt the cases when the century finishes in 11, 12 and 13 (by using century % 100), now we need to deal with all the other cases.
# We are using century % 10 this time.
# So:
# 20 % 10 == 0
# 21 % 10  == 1
# 1965 % 10 == 5
# 5 % 10 == 5
# etc.
# And finally we are using case statement. We defind if then condition and if any of these are not met, we define the else condition.
# So, for centuries ending with 1 (we get this information from last_digit variable), we add suffix 'st',
# for centuries ending with 2, we add suffix 'nd', for centuries ending with 3, we add 'rd' and for all other cases
# we add 'th.'
# So our century method calls our century_suffix method and returns a string with the correct ending.


century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

puts "*************************************************************************"

def century(number)
  ary = number.divmod(100)
  p ary

  if ary.last == 0
    temp = ary.first
  elsif ary.last > 0
    temp = ary.first + 1
  end

  temp = temp.to_s

  return temp << 'th' if temp.end_with?('0', '11', '12', '13')
  return temp << 'st' if temp.end_with?('1')
  return temp << 'nd' if temp.end_with?('2')
  return temp << 'rd' if temp.end_with?('3')
end

# We define a century method and pass it the number as a parameter. Subsequently we will call the divmod method on the number and save
# the retun value to the array ary. The divmod method called on an integer returns an array of 2 numbers, it's quotient and its modulo.
# That's how we got close to definining the number for the century.
# What we will do next is that we define a conditon and if the last number of the array is zero, we will save the first number of the same
# array into our temp variable. This variable will become our base number for century. But the if condition accounts only for cases when the
# year ends with 0. For cases that it doesn't, we will have the else branch where we say that if the last element of the array is greater than 0,
# in that case we will save into our temp variable the first element of the array + 1. This accounts for years ending in other number than 0.
# Subsequently, on line 137 we will call the to_s method on the temp variable, which was an integer until now.
# Now we have a correct century number but we still need to decide about the ending/suffix.
# To do that, we write 4 return statements and give it conditions according to the number that the temp variable ends with. Temp variable is a string now
# and strings have a handy ends_with? method that we are taking advantage of here. Our conditions account for all possible values.

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
