=begin

18. Persistent Bugger.
(https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby)
6 kyu

Write a function, persistence, that takes in a positive parameter num and
returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

For example:

 persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number

 =begin pedac

*************Problem********************
Overall goal: write a method that takes an integer and returns it's multiplicative persistence/# of times you need to multiply the digits until a single digit value is returned
initial input: integer
overall output: new integer/count/persistence

explicit requirements:
write a method, 1 arg, integer
return the integer's persistence


implicit requirements:
single digit int returns 0
questions:
need to account for single digit separately??
**********Examples/Test cases************
p persistence(39) == 3
** 3 * 9  = 27, 2 * 7 = 14, 1 * 4 = 4 (single digit int, so stop). count is 3 . return 3
p persistence(4) == 0
** single digit num  returns 0
p persistence(25) == 2
p persistence(999) == 4
*************Data Structure**************
integer > array > new integer/persistence/count

***************Algorithm*****************
Overall approach: integer > if integer < 10 return 0 > else > array of digits > mult the digits and save as `product` > then convert `product` to digits > multiply > save as `product` > keep going until `product` is < 10

*/ if conditional: if integer < 10, return 0
details:

*/ convert integer to array of digits
details: digits

*/ multiply the digits together, assign to `product`
details: reduce(:*)

*/ initialize count = 1

*/ else branch: until loop - until `product ` < 10

*/ convert integer to array of digits
details:

*/ multiply digits together and reassign to product
details:

*/ increment counter by 1
details:

*/ return count which is the persistence

=end
def persistence(int)
  if int < 10
    count = 0
  else
    product = int.digits.reverse.reduce(:*)
    count = 1
    until product < 10
      product = product.digits.reverse.reduce(:*)
      count += 1
    end
  end
  count
end

p persistence(39)  == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4

puts

def persistence(nums)

  counter = 0
  product = 1
  num_arr = nums.digits.reverse!

  if num_arr.length == 1
    return 0
  end
  loop do
    num_arr.each do |ele|
      break if counter == num_arr.length
      product *= ele
    end

    counter += 1
    break if product < 10
    num_arr = product.digits.reverse!
    product = 1
  end
  counter
end

p persistence(39)  == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4