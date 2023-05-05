# Problem
# to_i gets rid of the leading zeros, which may be a problem if you want to calculate the product of an array
# This is the solution:
string = '00234'

product2 = string.to_i.digits.reduce(:*)
p product2 # => 24

# 00234
# 234
# [4, 3, 2]
# 24

# use chars first to convert to an array, this will retain the zeros
# then only change to integers and multiply the elements
product = string.chars.map {|char| char.to_i}.reduce(:*)
p product # => 0

str = '00234'
['0', '0', '2', '3' , '4']
[0, 0, 2, 3, 4]
0 * 0 * 2 * 3 * 4 == 0