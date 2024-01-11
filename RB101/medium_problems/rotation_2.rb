=begin
Rotation (Part 2)
Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

PEDAC
P:
- write a method that takes 2 integers
- first is the int to be rotated
- second is the number means last n of chars that should be rotated
- n will always be positive

- rotating by 1 gives us original number
- we can use the rotate(array) method from the previous exercise

E:
rotate_rightmost_digits(735291, 1) == 735291
=> last 1 number, results in the same number

rotate_rightmost_digits(735291, 2) == 7352-19
=> last 2 numbers, 91, in reverse they are added to the first 7352
i have 2 nums, 9,1, I add it to the beginning but first 1, then 9

rotate_rightmost_digits(735291, 3) == 735912
=> last 3 nums, 291, 735-912 but how this order?
i have 3 nums, 2,9,1, I add it to the beginning but first 9, 1, 2

rotate_rightmost_digits(735291, 4) == 73-2915
=> last 4 numbers, 5291 => 73-2915
- we have 4 numbers, 5,2,9,1 but we add it like this 2,9,1,5
- index 1 gets added
- index 2 gets added
- index 3 gets added
- index 0 gets added

rotate_rightmost_digits(735291, 5) == 752913
=> 5 digits, 35291 => 7-52913
- i have 3, 5, 2, 9, 1 but we add it like this
- index 1 gets added
- index 2 gets added
- index 3 gets added
- index 0 gets added

rotate_rightmost_digits(735291, 6) == 352917, size of the i.to_s == 6
=> previous method works with this 735291 => 352917, so we can use it
- we have a number 735291
- index 1 gets added
- index 2 gets added
- index 3 gets added
- index 0 gets added

DS:
input: 2 integers
output: 1 int with n numbers mentioned by arg 2 rotated: first num going to the end

A:
- covert int to str and then to an array
- remove the n numbers from the array
- rotate those numbers

- add them to the beginning of the array
- join the array to str
- convert back to int and return
=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(int, n)
  arr = int.to_s.chars

  n = arr.pop(n)
  last_digits = rotate_array(n)

  (arr + last_digits).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

puts

# LS solution and explanation
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars

  all_digits[-n..-1] = rotate_array(all_digits[-n..-1]) # replace last n digits with the rotated digits

  all_digits.join.to_i
end

# all_digits[-n..-1] returns the last n digits of the array - a nice shorcut to know!

# We pass all_digits[-n..-1] to our rotate_array method from the previous exercise,
# and that method returns a new array with the digits rotated as needed.

# We then assign the return value of rotate_array to all_digits[-n..-1].
# When an expression like this appears on the left side of an assignment, it means,
# "replace the last n elements with the values to the right of the equal sign".
# And that's exactly what happens here: we replace the last n digits with the rotated digits.

# Finally, we convert the all_digits array back to an integer.
#
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917