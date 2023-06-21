=begin
You are going to be given an array of integers.
Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.
For example:
Let's say you are given the array [1,2,3,4,3,2,1]: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ([3,2,1]) both equal 6.
Another one:
You are given the array [20,10,-80,10,10,15,35]
At index 0 the left side is []
The right side is [10,-80,10,10,15,35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.
=begin pedac

*************Problem********************
Overall goal: To write a method that takes an array of integers and returns the index value where the sum of the integers
to the left of the index position equals the sum of the integers to the right of the index position
initial input: array of integers
overall output: integer/the target index position

explicit requirements:
target index position: sum of ele to the left of the index is equal to the sum of the ele to the right of the idx
at idx 0 the left side will be []


implicit requirements:

questions:
Where does the -1 come from?? It is not specified in the question.
It seems to be that -1 is returned if the sums on the left and right do not equal
**********Examples/Test cases************
p find_even_index([1,2,3,4,3,2,1]) == 3
** index 3 (4), 31 + 2 + 3 == 3 + 2 + 1
p find_even_index([1,100,50,-51,1,1]) == 1
** index 1 (100): 1 == 1
p find_even_index([1,2,3,4,5,6]) == -1
** ?? -1 ?? these nums will never sum equally
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
** indx 0 : 0 == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

*************Data Structure**************
array of int > new int/target idx

***************Algorithm*****************
Overall approach: given an array of integers > iterate over int + idx>
if ele to the left of the int summed are equal to the ele to the right of
the ele summed, then return the idx

*/ iterate over array and idx + block
details:each with index

*/ inside block: return index if array[0...idx].sum is equal to array[idx + 1..array.size - 1].sum
details:

*/ return -1 outside of each_with_index block. This will return -1 if no trget index is found.


=end
def find_even_index(array)
  array.each_with_index do |ele, index|
    if array[0...index].sum == array[index + 1..array.size - 1].sum
      return index
    end
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1])  == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6])  == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

puts
#Amy
def find_even_index(array)

  array.each_index do |index|
    left_side = array[0...index].sum
    right_side = array[index + 1..array.size - 1].sum
    return index if left_side == right_side
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1])  == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6])  == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1
