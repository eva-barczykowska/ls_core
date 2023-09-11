=begin
Write a method that takes three arguments (x, y, z) and returns an array containing x subarrays (e.g. [[], [], []]), each containing y number of item z.

x: Number of subarrays contained within the main array.
y: Number of items contained within each subarray.
z: Item contained within each subarray.

Examples:
matrix(3, 2, 3) == [[3, 3], [3, 3], [3, 3]]
x is 3 , so we have 3 subarrays
1st number in the argument decides how many arrays will be returned

2nd argument decides how many items will each subarray have

3rd argument decides which item will be in each subarray
******
matrix(2, 1, "edabit") == [["edabit"], ["edabit"]]
2 is the 1st arg => 2 subarrays are returned
1 is the 2nd arg => 1 item is in each array
"edabit" is 3rd arg => we have "edabit" in each array

matrix(3, 2, 0) == [[0, 0], [0, 0], [0, 0]]

Notes:
The first two arguments will always be integers.
The third argument is either a string or an integer.

PEDAC
************** Problem **************
-write a method that takes 3 arguments
-the method returns a nested Array
-the nested array has 3 arrays inside
1st number in the argument decides how many arrays will be returned
2nd argument decides how many items will each subarray have /the size of each subarray
3rd argument decides which item will be in each subarray

************** Examples **************
Examples:
matrix(3, 2, 3) == [[3, 3], [3, 3], [3, 3]]
x is 3 , so we have 3 subarrays
1st number in the argument decides how many arrays will be returned

2nd argument decides how many items will each subarray have

3rd argument decides which item will be in each subarray
******
matrix(2, 1, "edabit") == [["edabit"], ["edabit"]]
2 is the 1st arg => 2 subarrays are returned
1 is the 2nd arg => 1 item is in each array
"edabit" is 3rd arg => we have "edabit" in each array

matrix(3, 2, 0) == [[0, 0], [0, 0], [0, 0]]

************** Data Structures **************
Input: 3 args, 2 are integers, 3rd can be an int or str
Output: a nested array
************** Notes **************
************** Algorithm **************
x, y, z
-initialize `result` to []
-initialize `desired_array` array []
-y times insert z into an array
- this will give me only 1 desired array

-x times insert that desired array into `result`
************** Code **************

************** Refactor **************
=end

def matrix(x, y, z)
  result = []
  subarray = []

  y.times { |_| subarray << z }

  x.times { |_| result << subarray }

  result
end
p matrix(3, 2, 3) == [[3, 3], [3, 3], [3, 3]]
p matrix(2, 1, "edabit") == [["edabit"], ["edabit"]]
p matrix(3, 2, 0) == [[0, 0], [0, 0], [0, 0]]


# arr = [[3, 2, 3]] * 3

# arr.each do |s|
#   s << 100
#   p arr
# end

a = ["b"] * 3

p a

a.each do |ch|
  ch << "x"
  p a
end

# ["b", "b", "b"]
# ["bx", "bx", "bx"]
# ["bxx", "bxx", "bxx"]
# ["bxxx", "bxxx", "bxxx"]

#block parameter is REASSIGNED/REINITIALIZED to the next element

