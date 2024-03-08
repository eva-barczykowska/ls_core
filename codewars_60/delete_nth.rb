=begin
# Given a list and a number, create a new list that contains each number of list at most N times, without reordering.
# For example if the input number is 2, and the input list is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].
# With list [20,37,20,21] and number 1, the result would be [20,37,21].
 
P:
-method takes an array of numbers as an arg
-method returns new array that contains each number AT MOST n times (so not bigger than n times)

p delete_nth([1,2,3,1,2,1,2,3],2) == [1,2,3,1,2,3]
=> n times is 2 so take [1,2,3,1,2], drop [1,2] and take 3. The result is 
[1,2,3,1,2,3]

DS:
input: array
output: array with each number repeated not more than n times

H: Iterate each number and as you do, count the count of this number in the result array. If it is more than n, don't add this number but move on, if it less than n, add this number and move on.

  A:
  -init  `result` []
  -iterate over the array and determine the count of the number at the current iteration - count in the `result`
  if it is less than n, add it and increase the counter
  -if it is equal to, just increase the counter to move on to the next number in the arg array

  -return `result`
=end
def delete_nth(array, n)
  result = []

  array.each do |number|
    if result.count(number) < n
      result << number
    end
  end
  result
end
p delete_nth([1,2,3,1,2,1,2,3],2) == [1,2,3,1,2,3]

puts
# P:
# give a list of nums, create a new list, that contains each umber of list at most n times, without reordering

# E:
# delete_nth([1,2,3,1,2,1,2,3],2) == [1,2,3,1,2,3]
# 1, 2, 3, 1, 2 -remove 1, 2, take 3 because that's only the 2nd 3
# => you take[1,2,3,1,2], drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].

# delete_nth([20,37,20,21], 1) == [20,37,21].

# N:
# some kind of limit for each number, 2nd argument is a limit!
# each number has some kind of limit, if limit is fullfilled, no other numbers should be added
=begin
P:
-initialize `limit` to second argument
-initialize `result` array

-iterate over the arg array
-initialize `counter`
-for each number/element at the current counter check what is the count of that number in the `result` array
-if `count` is less than limit, you can it this number to the `result` array
-increase the counter
=end
def delete_nth(arr, target)
  new_arr = []
 
  arr.each do |number|
    count = new_arr.count(number)
    if count < target
      new_arr << number
    end
end

 new_arr
end
p delete_nth([1,2,3,1,2,1,2,3],2) == [1,2,3,1,2,3]

puts
 
def delete_nth(photos_array, limit)
  occurrences = Hash.new(0)
  photos_array.reject { |item| (occurrences[item] += 1) > limit }
end
p delete_nth([1,2,3,1,2,1,2,3],2) == [1,2,3,1,2,3]

puts

def delete_nth(photos_arr, limit)
 photos_arr.each_with_object([]) { |number, array| array.push(number) unless array.count(number) >= limit }
end
p delete_nth([1,2,3,1,2,1,2,3],2) == [1,2,3,1,2,3]