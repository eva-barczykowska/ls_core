=begin
The Major Sum
Create a method that takes an integer array and return the biggest between positive sum, negative sum, or 0s count.
The major is understood as the greatest absolute.

l = [1,2,3,4,0,0,-3,-2], the function has to return 10, because:

Positive sum = 1+2+3+4 = 10
Negative sum = (-3)+(-2) = -5
0s count = 2 (there are two zeros in array)

Examples:
major_sum([1, 2, 3, 4, 0, 0, -3, -2]) == 10

major_sum([-4, -8, -12, -3, 4, 7, 1, 3, 0, 0, 0, 0]) == -27

major_sum([0, 0, 0, 0, 0, 1, 2, -3]) == 5
# Because -3 < 1+2 < 0sCount = 5
Notes:
All numbers are integers.
There aren't empty arrays.
All tests are made to return only one value.

P:
input: an array of integers
output: an integer
- output integer represents the major sum
  - major sum: the biggest absolute value of the following sums:
    - sum of all +ve nums
    - sum of all -ve numbers
    - count of all 0s


Algo:
- initialize 3 variables: positive, negative and zeros to 0
- iterate through the input array
  - if current num is positive
    - increment positive var by num
  - if current num is negative
    - increment negative var by abs value num
  - if current num is 0
    - increment zeros var by 1
- add vars to
=end

def major_sum(array)
  positive = 0
  negative = 0
  zeros = 0

  array.each do |num|
    if num > 0
      positive += num
    elsif num < 0
      negative += num
    else
      zeros += 1
    end
  end

  [positive, negative, zeros].max_by {|num| num.abs}
end

p major_sum([1, 2, 3, 4, 0, 0, -3, -2]) == 10
p major_sum([-4, -8, -12, -3, 4, 7, 1, 3, 0, 0, 0, 0]) == -27
p major_sum([0, 0, 0, 0, 0, 1, 2, -3]) == 5

puts

# with count
def major_sum(array)
  positive = array.select {|num| num > 0}.sum
  negative = array.select {|num| num < 0}.sum
  zeros = array.count(0)

  [positive, negative, zeros].max_by { |num| num.abs }
end

p major_sum([1, 2, 3, 4, 0, 0, -3, -2]) == 10
p major_sum([-4, -8, -12, -3, 4, 7, 1, 3, 0, 0, 0, 0]) == -27
p major_sum([0, 0, 0, 0, 0, 1, 2, -3]) == 5



