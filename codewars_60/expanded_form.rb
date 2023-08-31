#  You will be given a number and you will need to return it as a string in expanded form. For example:
#  expanded_form(12); # Should return '10 + 2'
#  expanded_form(42); # Should return '40 + 2'
#  expanded_form(70304); # Should return '70000 + 300 + 4'
#  Note: All numbers will be whole numbers greater than 0.
# A:
# Convert the digit argument to a string and split it into an array of individual digits, store the result in `strings`
# establish the length of the `strings` and store the result in `length`
# Iterate through each str and its index in the strings. If the str is zero, skip it.
# Calculate the expanded form of the digit by multiplying it with the appropriate power of 10, starting from index 0
# Remember that any number to the POWER of 0, returns 1
#                                            array is ['1', '2']
#                                            digit.to_i * (10 ** (length - index - 1))
# when arg`12`, length is 2, it'll be 1 * (10**(2-0-1)) for the 1st digit => 1 * (10**1) = 1*10=10
#                            it'll be 2 * (10**(2-1-1)) for the 2nd digit => 2 * (10**0) = 2*1=
#                            - 1 at the end because we're starting indices from 0
#                            result is []
# when  arg`5304`, length is 4, it'll be 5 * (10**(4-0-1)) for the 1st digit =>5*(10**3)=5*1000=5000
#                                        3 * (10**(4-1-1)) for the 2nd digit =>3*(10**2)=3*100=300
#                                        0--this will give us nil--
#                                        4 * (10**(4-3-1)) for the 4th digit =>4*(10**0)=4
#                                        - 1 at the end because we're starting indices from 0
#                                        result of the above is [5000, 300, nil, 4]
# Convert the expanded digit back to a string and add it to the result array.
# Finally, join the elements of the result array using " + " as the separator to get the expanded form as a string.

def expanded_form(digit)

  strings = digit.to_s.chars
  length = strings.length


  result = strings.each_with_index.map do |digit, indx|
    digit.to_i * (10 ** (length - indx - 1)) if digit != "0"
  end

  result.compact.join(" + ")
end

puts expanded_form(12) == '10 + 2'
puts expanded_form(308) == '300 + 8'
print expanded_form(5304) == '5000 + 300 + 4'

puts
def expanded_form(number)
  digits = number.to_s.chars.reverse #["4", "0", "3", "5"]
  expanded_form = digits.each_with_index.map do |digit, index|
    digit.to_i * 10**index unless digit == '0' #[4, nil, 300, 5000]
  end.compact.reverse #[4, 300, 5000] and then [5000, 300, 4]

  expanded_form.join(" + ")
end
# first convert to the array and reverse - this will give us access to the right index
#["4", "0", "3", "0", "7"] return value of line 1
#--0----1----2----3----4 indices
# convert each digit to an int
# map each digit to the power of index(except when digit is 0!) so:
# 4* (10**0)         => gives us 4*1  =    4 #any number to the POWER of 0, returns that number
# 0 is left as it is => gives us           nil (the block returns nil which map uses to convert that element of the array to nil)
# 3 * (10**2)        => gives us 3*10 =    300
# 0 is left as it is => gives us           nil
# 7 * (10**4)        => gives us 7*10000 = 70000
# the numbers above are added to re result like so: [4, nil, 300, nil, 70000]
# [4, nil, 300, nil, 70000]
# we will call compact on this to remove nils => [4, 300, 70000]
# and then reverse, to get the right order
# [70000, 300, 4] - join this array on + and return the resulting string

puts expanded_form(12) == '10 + 2'
puts expanded_form(308) == '300 + 8'
puts expanded_form(5304) == '5000 + 300 + 4'



