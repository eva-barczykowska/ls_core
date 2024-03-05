=begin
P:
- write a method that takes an integer and an array as arguments
- method has a task: find largest elements (indicated by num) in the array
- method returns array with those elements
E:
largest(2, [7,6,5,4,3,2,1]) == [6,7]

DS:
input: int and array
output: array of greatest integers, the number of which to return is indicated by the first argument int

Idea 1
Use max and take 2 max elements

Idea 2
Initialize `result` to store maksimum values. Sort the values, slice and return first 2/3/whatever the first argument is.

A:
-save 1st argument to `target`

- iterate through the array with index
- find out which is the greatest integer and save it to the `greatest` array
- remove that integer from the array but only that very instance of it (remove just one 5 for example if there are 3)
- repeat this process until the `result` array is equal to the first argument

-sort and return result
=end
def largest(target, arr)
  arr.max(target).sort
end

p largest(2, [7,6,5,4,3,2,1]) == [6,7]
p largest(3,[5,1,5,2,3,1,2,3,5]) == [5,5,5]