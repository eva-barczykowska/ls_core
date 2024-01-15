=begin

Output
You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:
Let's say you are given the array {1,2,3,4,3,2,1}:
Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

Let's look at another one.
You are given the array {1,100,50,-51,1,1}:
Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

Last one:
You are given the array {20,10,-80,10,10,15,35}
At index 0 the left side is {}
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

Input:
An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.

Output:
The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.

Note:
If you are given an array with multiple answers, return the lowest correct index.

PEDAC
- write a method that takes an array of integers as an argument
- Integers can be negavive or positive
- method returns index of the element where ALL elements to the left of that element  when summed equal to the sum of all the selements on the right of that element/number
- return - 1 if there is no index that would make this happen
- if there are multiple
- empty arrays are equal to 0 in this problem so when considering

E:
[1,2,3,4,3,2,1]
[      4      ] index 3 coz
1+2+3 = 6 AND 3+2+1 = 6

[1,100,50,-51,1,1]
[  100           ] index 1 coz
1 and [50,-51,1,1] both equal 1.


[20,10,-80,10,10,15,35] index 0 coz the left side is []
[10,-80,10,10,15,35]

- so at index so left side is considered []
- and at index -1, right side is considered []
Index 0 is the place where the left side and right side are equal.

DS:
input: array of integers
output: an integer, signifies index to the left and right of which integers, when summed, give the same sum

A:
- initialize results hash where index will be stored a a key and sum as a value

- iterate over this array
- at index 0 consider left array sum as 0 (empty array) and right array as sum of elements at index arr[0..-1]
- at index -1 consider right array sum as 0 (empty array) and left array as sum of elements at indices arr[0...index]

- at all other indexes, left array sum is arr[0...index].sum (exclusive) AND
- right_sum is summed numbers from the current index + 1 until the last element of the Array
  - if left_sum is equal to right_sum, save that index and sum to a `results' hash as key value

-return - 1 if hash is empty, that means an equal left and right sum have not been found

- iterate over the results hash and return the smallest valu:
- iterate over the values of the hash and find min value, store it in min_value
- iterate over the `results` hash and return the key for the lowest sum in the hash)
=end

def find_even_index(arr)
  results = {}

  counter = 0
  loop do
    break if counter > arr.size #this will cause nil error after last element and the elsif breanch
    if counter == 0
      left_sum = 0
      right_sum = arr[counter.next..-1].sum
      results[counter] = left_sum if left_sum == right_sum
    elsif
    counter == arr.size - 1
      left_sum = arr[0...-1].sum
      right_sum = 0
      results[counter] = left_sum if left_sum == right_sum
      break #this is crucial!!! coz it's the last element, no need to increase counter, if do do, then we have NIL as the next element
    else
      left_sum = arr[0...counter].sum
      right_sum = arr[counter.next..-1].sum
      results[counter] = left_sum if left_sum == right_sum
    end
    counter += 1
  end

  return -1 if results.empty?

  min_sum = results.values.min
  results.each do |index, value|
    return index if value == min_sum
  end
end
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6

puts
puts "after fixing"
def find_even_index(arr)
  results = {}

  counter = 0
  loop do
    break if counter >= arr.size
    if counter == 0
      left_sum = 0
      right_sum = arr[counter.next..-1].sum
      results[counter] = left_sum if left_sum == right_sum
    elsif
    counter == arr.size - 1
      left_sum = arr[0...-1].sum
      right_sum = 0
      results[counter] = left_sum if left_sum == right_sum
      # break #this is crucial!!! coz it's the last element, no need to increase counter, if do do, then we have NIL as the next element
      # changed linebreak if counter > arr.size to break if counter >= arr.size and now no nil error
    else
      left_sum = arr[0...counter].sum
      right_sum = arr[counter.next..-1].sum
      results[counter] = left_sum if left_sum == right_sum
    end
    counter += 1
  end

  return -1 if results.empty?

  min_index = results.keys.min
  results.each do |index, value|
    return index if index == min_index
  end

  p find_even_index([1,2,3,4,3,2,1]) == 3
  p find_even_index([1,100,50,-51,1,1]) == 1
  p find_even_index([1,2,3,4,5,6]) == -1
  p find_even_index([20,10,30,10,10,15,35]) == 3
  p find_even_index([20,10,-80,10,10,15,35]) == 0
  p find_even_index([10,-80,10,10,15,35,20]) == 6
  p find_even_index(Array(1..100)) == -1
  p find_even_index([0,0,0,0,0]) == 0
  p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
  p find_even_index(Array(-100..-1)) == -1

=begin
# Session with Nick
Output
You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:
Let's say you are given the array {1,2,3,4,3,2,1}:
Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

Let's look at another one.
You are given the array {1,100,50,-51,1,1}:
Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

Last one:
You are given the array {20,10,-80,10,10,15,35}
At index 0 the left side is {}
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

Input:
An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.

Output:
The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.

Note:
If you are given an array with multiple answers, return the lowest correct index.
end

# problem
Inputs: ARRAY (going to be given an array of integers)
Outputs: INTEGER find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.


Let's say you are given the array {1,2,3,4,3,2,1}:
Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

1,2,3,4,3,2,1
0,1,2,3,4,5,6

You are given the array {1,100,50,-51,1,1}:
Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.
1,100,50,-51,1,1
0,1,  2,  3, 4,5,

You are given the array {20,10,-80,10,10,15,35}
At index 0 the left side is {}
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

20,10,-80,10,10,15,35
0, 1,  2, 3,  4, 5,6
10,-80,10,10,15,35

Data Structures
Intermediary/temporary arrays, for the purpose of summing values (maybe using the Array#sum method)

Algorithm
initialize variable input_arr_length, assign value of the length of the input_arr
Check if the following two cases are equal (if input_arr_length == 0 or if input_arr_length == 6 )

if [1..-1].sum == 0, return 0
if [0..-2].sum == 0 return input_arr_length -1

initialize variable pointer

initialize variable = left_side
initialize variable = right_side


Iterate over input_arr beginning with 2nd element, going until the 2nd to last element
add values to variable left_side, up until pointer
after pointer add values to variable right_side

if they are equal, return the pointer
if at end of the iteration left side never equals right side, return -1

10,-80,10,10,15,35,20
0  1   2   3  4 5  6

=end

  def find_even_index input_arr
    input_arr_length = input_arr.length
    return 0 if input_arr[1..-1].sum == 0
    return input_arr_length -1 if input_arr[0..-2].sum == 0

    input_arr.each.with_index do |int, idx|
      next if idx == 0 || idx == input_arr_length -1
      left_side = input_arr[0...idx].sum
      right_side = input_arr[(idx + 1)..-1].sum
      return idx if left_side == right_side
    end
    -1
  end

  p find_even_index([1,2,3,4,3,2,1]) == 3
  p find_even_index([1,100,50,-51,1,1]) == 1
  p find_even_index([1,2,3,4,5,6]) == -1
  p find_even_index([20,10,30,10,10,15,35]) == 3
  p find_even_index([20,10,-80,10,10,15,35]) == 0
  p find_even_index([10,-80,10,10,15,35,20]) == 6

  puts
  def find_even_index(arr)
    results = {}

    counter = 0
    loop do
      break if counter >= arr.size

      case counter
      when 0
        left_sum = 0
        right_sum = arr[counter.next..-1].sum
        results[counter] = left_sum if left_sum == right_sum
      when arr.size - 1
        left_sum = arr[0...-1].sum
        right_sum = 0
        results[counter] = left_sum if left_sum == right_sum
      else
        left_sum = arr[0...counter].sum
        right_sum = arr[counter.next..-1].sum
        results[counter] = left_sum if left_sum == right_sum
      end
      counter += 1
    end

    return -1 if results.empty?

    min_index = results.keys.min
    results.each do |index, value|
      return index if index == min_index
    end
  end
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6