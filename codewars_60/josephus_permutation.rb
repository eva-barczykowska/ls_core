
# You are now to create a function that returns a Josephus permutation,
# taking as parameters:
# the initial array/list of items to be permuted *as if they were in a circle*
# item k will be counted out every k places until none remained.
# -every 3rd man will be killed

# Task is to return an array where the elements from an input array are collected
# as they are removed every (n) element until the input array is empty.
#
# For example, with n=7 and k=3 josephus(7, 3) should act this way.
# item k will be counted out every k places until none remained.
# [1, 2, 3, 4, 5, 6, 7] - initial sequence
# [1, 2, 4, 5, 6, 7] => 3 is counted out and goes into the result [3] item 3/every 3rd man
# [1, 2, 4, 5, 7] => 6 is counted out and goes into the result [3, 6] 3+3
# [1, 4, 5, 7] => 2 is counted out and goes into the result [3, 6, 2]
# [1, 4, 5] => 7 is counted out and goes into the result [3, 6, 2, 7]
# [1, 4] => 5 is counted out and goes into the result [3, 6, 2, 7, 5]
# [4] => 1 is counted out and goes into the result [3, 6, 2, 7, 5, 1]
# [] => 4 is counted out and goes into the result [3, 6, 2, 7, 5, 1, 4]
# So our final result is:
#
# # josephus([1, 2, 3, 4, 5, 6, 7], 3) == [3, 6, 2, 7, 5, 1, 4]

# input: an array of integers, an integer k
# output: an array of integers


# >>>>>> Caveats

# Tips and notes: it helps to start counting from 1 up to n, instead of the usual range 0..n-1; k will always be >=1.

# >>>>>> Examples and test cases


# [1, 2, 3, 4, 5, 6, 7] => [3] 3 removed and we start counting from the next elem 1, 2, 3
# [1, 2, 4, 5, 7] => [3, 6]
# [1, 4, 5, 7] => [3, 6, 2]
# [1, 4, 5] => [3, 6, 2, 7]
# [1, 4] => [3, 6, 2, 5]
# [4] => [3, 6, 2, 5, 1]
# [] => [3, 6, 2, 5, 1, 4]

# arr = [1, 2, 3, 4, 5, 6, 7]
# result = []
# kill = 3
# index = 0
#
# until arr.empty?
#
#   index = (index + kill - 1) % arr.size
#   p " array: #{arr} result: #{result} #{(index + kill - 1)} %: #{arr.size} => #{index} "
#   result << arr.delete_at(index)
# end
#
# p result

#index = 1 %  = 1
#index = 2 % 7 = 2
#index = 3 % 6 = 3
#index = 4 % 5 = 4
#index = 5 % 7 = 5
#index = 6 % 7 = 6
#index = 7 % 7 = 0 => wrap around

# loop over this array until the array is empty
#- while looping, shift 3 chars and store in `temp`
# -remove the last one and store in the `result` array
# -the other 2 store in `spared` array
# -when arr.size <= 2, append the `spared` array to the array if 'spared' size >= 1
#
# count to 3, remove the element 3 and store it in `result` array
# what to do when an element is deleted, how to know which i
# -start over from the next element
#
# when array size is 2 is finished, we need to get the numbers that we spared and start counting again
# we need to do that until spared doesn't increase anymore
#
# when the temp.size is only equal or smaller than 2, I just add temp as it is, without popping
arr = [1, 2, 3, 4, 5, 6, 7] ## josephus([1, 2, 3, 4, 5, 6, 7], 3) #== [3, 6, 2, 7, 5, 1, 4]
target = 3

def josephus(arr, kill)
  res = []

  until arr.size < kill
    temp = arr.shift(kill)
    res << temp.pop
    arr = arr + temp
  end

  res + temp
  end

p josephus([1, 2, 3, 4, 5, 6, 7], 3) == [3, 6, 2, 7, 5, 1, 4]


# For example, with n=7 and k=3 josephus(7, 3) should act this way.
# item k will be counted out every k places until none remained.
# [1, 2, 3, 4, 5, 6, 7] - initial sequence
# [1, 2, 4, 5, 6, 7] => 3 is counted out and goes into the result [3] item 3/every 3rd man
# [1, 2, 4, 5, 7] => 6 is counted out and goes into the result [3, 6] 3+3
# [1, 4, 5, 7] => 2 is counted out and goes into the result [3, 6, 2]
# [1, 4, 5] => 7 is counted out and goes into the result [3, 6, 2, 7]
# [1, 4] => 5 is counted out and goes into the result [3, 6, 2, 7, 5]
# [4] => 1 is counted out and goes into the result [3, 6, 2, 7, 5, 1]
# [] => 4 is counted out and goes into the result [3, 6, 2, 7, 5, 1, 4]
# So our final result is:

# josephus([1, 2, 3, 4, 5, 6, 7], 3) == [3, 6, 2, 7, 5, 1, 4]


# For example, with n=7 and k=3 josephus(7, 3) should act this way.

# [1, 2, 3, 4, 5, 6, 7] - initial sequence
# [1, 2, 4, 5, 6, 7] => 3 is counted out and goes into the result [3] out 3 first
# [1, 2, 4, 5, 7] => 6 is counted out and goes into the result [3, 6]
# [1, 4, 5, 7] => 2 is counted out and goes into the result [3, 6, 2]
# [1, 4, 5] => 7 is counted out and goes into the result [3, 6, 2, 7]
# [1, 4] => 5 is counted out and goes into the result [3, 6, 2, 7, 5]
# [4] => 1 is counted out and goes into the result [3, 6, 2, 7, 5, 1]
# [] => 4 is counted out and goes into the result [3, 6, 2, 7, 5, 1, 4]
# So our final result is:

#josephus([1, 2, 3, 4, 5, 6, 7], 3) == [3, 6, 2, 7, 5, 1, 4]


