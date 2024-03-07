=begin
Implement a method that finds all pairs of numbers whose odd indexed position
in the original array is greater than 5 and whose even indexed position
in the original array is less than 5.

P:
-we have 2 types of numbers in array
-number_a = located even index
-number_b = located odd index

E:
[2, 6, 1, 7, 4, 10]
 0  1  2  3  4  5
 num at odd index   6, 7, 10 greater than 5 => 6, 7, 10
nums at even index 2, 1, 4, smaller than 5 => 1, 2, 4 so 3 numbers

so now I have these 2 arrays and I need to make combinations

nums_at_odd_index = [6, 7, 10]
nums_at_even_index = [1, 2, 4]

H:
select from the arg array numbers that are at even index are are smaller than 5 and save to a variable. Then select numbers that are at odd numbers and greater than 5.
Combine them into pairs and return. 


p find_special_pairs([2, 6, 1, 7, 4, 10]) == [ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]
=>
even_index_smaller_than_five = [2, 1, 4]
odd_index_greater_than_five =  [6, 7, 10]
[ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]

p find_special_pairs([4, 9, 2, 6, 3, 11, 4]) == [ [ 4, 9 ], [ 4, 6 ], [ 4, 11 ], [ 2, 6 ], [ 2, 11 ], [ 3, 11 ] ]
=>
[4, 9, 2, 6, 3, 11, 4]
 0. 1. 2. 3. 4.  5. 6
even_index_smaller_than_five = [4, 2, 3, 4]
odd_index_greater_than_five =  [9, 6, 11]
[ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]

p find_special_pairs([5, 12, 3, 8]) == [ [ 3, 8 ] ]
=> deal with separately?

p find_special_pairs([7, 4, 6, 5]) ==[]
=> deal with separately?

puts find_special_pairs([1, 7, 2, 8, 3, 9]) == [ [ 1, 7 ], [ 1, 8 ], [ 1, 9 ], [ 2, 8 ], [ 2, 9 ], [ 3, 9 ] ]

A:
-init target numbers:
even_index_smaller_than_five = 
odd_index_greater_than_five = 

-iterate with index (select) and save numbers as per requirement to the above variables
--if index is even and num smaller than 5, save it
--if index is odd and num greater than 5, save it
-retun [] of no target numbers were found

now I have both arrays and I need to create pairs
-use indices
- start with index 0 and up to the last index of this array create paris with the nums from the second array, starting index is 0, ending arr.size - 1
-start from the second element of the second array and go till the last element
indices
0 with 0, 1,2
1 with 1, 2
2 with 2

=end
def find_special_pairs(arr)
  nums_at_even_index = []
  nums_at_odd_index = []

  arr.select.with_index do |n, index| 
    nums_at_even_index << n if (index.even? && n < 5)
  end 

  arr.select.with_index do |n, index| 
    nums_at_odd_index << n if index.odd? && n > 5
  end 

  return [] if nums_at_even_index.empty? || nums_at_odd_index.empty?

  p nums_at_even_index
  p nums_at_odd_index

  pairs = []
  last_index_even = nums_at_even_index.size - 1
  last_index_odd = nums_at_odd_index.size - 1

  
  counter1 = 0
  counter2 = 0
  loop do 
    loop do
      pairs << [nums_at_even_index[counter1], nums_at_odd_index[counter2]]
      counter2 += 1
      break if counter2 > last_index_odd
    end
    counter1 += 1
    counter2 = counter1
    break if counter1 > last_index_even
  end

  pairs.reject! { |p| p.include?(nil) }
end
# [2, 1, 4]
# [6, 7, 10]

# [[0, 0]] --- indices I need to take, how they are build gradually
# [[0, 0], [0, 1]]
# [[0, 0], [0, 1], [0, 2]]
# [[0, 0], [0, 1], [0, 2], [1, 1]]
# [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2]]
# [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2], [2, 2]]

# p find_special_pairs([2, 6, 1, 7, 4, 10]) == [ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]

# p find_special_pairs([4, 9, 2, 6, 3, 11, 4]) == [ [ 4, 9 ], [ 4, 6 ], [ 4, 11 ], [ 2, 6 ], [ 2, 11 ], [ 3, 11 ] ]

p find_special_pairs([5, 12, 3, 8]) #== [ [ 3, 8 ] ] FAILING !!!!!!!!!!!!!!
# p find_special_pairs([7, 4, 6, 5]) ==[]
# p find_special_pairs([1, 7, 2, 8, 3, 9]) == [ [ 1, 7 ], [ 1, 8 ], [ 1, 9 ], [ 2, 8 ], [ 2, 9 ], [ 3, 9 ] ]

puts

def find_special_pairs(arr)
  all_pairs = []

  # find all pairs that have even index of original array at the first element position, and odd index of original array at second element position
  0.step(arr.length - 2, 2) do |even|
    p "EVEN is #{even}"
    (even + 1).step(arr.length - 1, 2) do |odd|
      p "odd is #{odd}"
  # filter the pairs for those that meet the conditions( pairs have value of even index < 5 and value of odd index > 5)
      all_pairs << [arr[even], arr[odd]] if arr[even] < 5 && arr[odd] > 5
    end
  end

  # all_pairs
end

p find_special_pairs([2, 6, 1, 7, 4, 10]) #== [ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]
# p find_special_pairs([4, 9, 2, 6, 3, 11, 4]) == [ [ 4, 9 ], [ 4, 6 ], [ 4, 11 ], [ 2, 6 ], [ 2, 11 ], [ 3, 11 ] ]
# p find_special_pairs([5, 12, 3, 8]) == [ [ 3, 8 ] ]
# p find_special_pairs([7, 4, 6, 5]) == []
# p find_special_pairs([1, 7, 2, 8, 3, 9]) == [ [ 1, 7 ], [ 1, 8 ], [ 1, 9 ], [ 2, 8 ], [ 2, 9 ], [ 3, 9 ] ]
