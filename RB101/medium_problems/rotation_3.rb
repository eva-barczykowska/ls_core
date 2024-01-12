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