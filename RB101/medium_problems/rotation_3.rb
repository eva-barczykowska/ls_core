=begin
Rotation (Part 3)
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

PEDAC
P:
                                   735291
- 735291 rotated to the left gives 3 52917  ->5 goes to the end, result 32 9175 - FIRST ROTATION
- keep 1st digit, rotate,          32 9175  ->
- keep first 2 digits, rotate,     321 759 ->7 goes to the end
- keep first 3 digits, rotate,     3215 97 ->9 goes to the end
- keep first 4 digits, rotate,     321579

- write a method that takes an int as an arg
- method returns maximum rotation of that argument

- use method from the previous exercise

- don't have to handle multiple 0s

E:
max_rotation(735291) == 321579
735291  was
*352917 letter chaned marked with * and moved to the end
352917  result

352917 1 stays
3*29175
329175

329175
32*1759
321759

321759
32*7591
327591

327591
327*915
327915

327915
327*159
327159

327159
3271*95
327195

A:
- use method from the previous exercise

- get the size of the number arg and store in a variable `number_digits`

- use `number_digits` number and count down to 2 from it

- use block parameter n, that's the digit for size that is coming down each time to finally reach 2

- each time call the rotate_rightmost_digits method with `int` and n(representing the size) and

- reassign int to the result of calling the rotate_rightmost_digits method

- return `int`
=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end


def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars

  all_digits[-n..-1] = rotate_array(all_digits[-n..-1]) # replace last n digits with the rotated digits

  all_digits.join.to_i
end


def max_rotation(int)
  number_digits = int.to_s.size

  number_digits.downto(2) do |n| # 7 down to do 2 so how many times to call that method
    int = rotate_rightmost_digits(int, n) # reassign the arg to the result of calling the rotate...
  end

  int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845

puts

=begin
Further Exploration
Assume you do not have the rotate_rightmost_digits or rotate_array methods. How would you approach this problem?
- I'd have to write everything from scratch
Would your solution look different? Does this 3 part approach make the problem easier to understand or harder?
- breaking it up makes it easier to understand
There is an edge case in our problem when the number passed in as the argument has multiple consecutive zeros.
Can you create a solution that preserves zeros?

max_rotation(735291) == 321579
735291  was
*352917 letter changed marked with * and moved to the end
352917  result

352917 1 stays
3*29175
329175

329175
32*1759
321759

321759
32*7591
327591

327591
327*915
327915

327915
327*159
327159

327159
3271*95
327195

=begin
Algorithm:
- I have an int input, from which I have to:
- move first num to the end (move index 0 to the end)
- then, in the number that I got in the previous step, I keep 1st number(move index 1 to the end)
- then, in the number that I got in the previous step, I keep 2 numbers (move index 2 to the end)
- then, in the number that I got in the previous step, I keep 3 numbers (move index 3 to the end)
- then, in the number that I got in the previous step, I keep 4 numbers (move index 3 to the end)

- change number to str and then array, store it in `arr`
- initialize counter/index outside the loop, this will increase with every loop iteration

- loop
- inside the loop
  - initialize `travelling_number`, this is the digit at the current index
  - store in `travelling_number` the digit that is at the current index in the `arr`
  - `travelling_number` must be an array because the idea is to add 3 arrays
  - split the arr into `arr1` with elements from the beginning until the travelling_number(exclusive) and
  - arr2 with elements from the next element after `travelling_element` until the end of array(inclusive)
  - reassign `arr` to the return value of adding `arr1`m `arr2` and `travelling_number`
  - increase the `index` by 1
  - break out of the loop when `index` is equal to the size of `arr`
  - end loop

- convert `arr` into a str and then into an int
- return the int
=end
def max_rotation(int)
  arr = int.to_s.chars
  index = 0

  loop do
    # if index == 0
    #   travelling_number = [arr.shift]
    #   arr = arr + travelling_number
    # else
      travelling_number = [arr[index]]
      arr1 = arr[0...index]
      arr2 = arr[index.next..-1]
      arr = arr1 + arr2 + travelling_number
    # end
    index += 1
    break if index == arr.size
  end
  arr.join.to_i
end
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105)== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) #== 7_321_609_845

puts
puts "refactoring"
# refactoring
# -realized I don't need the if branch so removing

def max_rotation(int)
  arr = int.to_s.chars
  index = 0

  loop do
    travelling_number = [arr[index]]
    arr1 = arr[0...index]
    arr2 = arr[index.next..-1]
    arr = arr1 + arr2 + travelling_number
    index += 1
    break if index == arr.size
  end
  arr.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105)== 15
p max_rotation(8_703_529_146) == 7_321_609_845

puts
puts "fewer lines"
# want fewer lines? No problem!
# doesn't work when we have 1-digit number
# can still make it work with return num if num.to_s.size == 1
#
# first I did this but it gave me an error
def max_rotation(int)
  return int if int.to_s.size == 1

  arr = int.to_s.chars
  index = 0

  loop do
    # p "index is #{index}"
    travelling_number = [arr[index]]
    # p "travelling num is #{travelling_number}"
    # arr1 = arr[0...index]
    # arr2 = arr[index.next..-1]
    arr[0...index] + arr[index.next..-1] + travelling_number
    # arr = arr1 + arr2 + travelling_number #reasignment of the array is the KEY HERE! not having it, gives me wrong number
    index += 1
    break if index == arr.size - 1
  end
  arr.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845

puts
# realized that reassignment is KEY HERE! and reassigned
# realized all t.c. are working except when int is a 1-digit number
# but 2nd test case wasn't working so had to add `return int if int.to_s.size == 1`
# def max_rotation(int)
#   arr = int.to_s.chars
#   index = 0
#
#   loop do
#     travelling_number = [arr[index]]
#     arr = arr[0...index] + arr[index.next..-1] + travelling_number
#     index += 1
#     break if index == arr.size - 1
#   end
#   arr.join.to_i
# end
#
# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15
# p max_rotation(8_703_529_146) == 7_321_609_845

puts
# with the clause added
def max_rotation(int)
  return int if int.to_s.size == 1
  arr = int.to_s.chars
  index = 0

  loop do
    travelling_number = [arr[index]]
    arr = arr[0...index] + arr[index.next..-1] + travelling_number
    index += 1
    break if index == arr.size - 1
  end

  arr.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845

puts
puts "working with a str"
# could I work with a string? yes!
def max_rotation(int)
  return int if int.to_s.size == 1
  str = int.to_s

  index = 0
  loop do
    travelling_number = str[index]
    str = str[0...index] + str[index.next..-1] + travelling_number
    index += 1
    break if index == str.size - 1
  end

  str.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845



