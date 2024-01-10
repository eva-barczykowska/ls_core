=begin
Create a function that takes two "sorted" arrays of numbers and returns an array of numbers which are common to both
the input arrays.

Examples
commonElements([-1, 3, 4, 6, 7, 9], [1, 3]) ➞ [3]
# => only 3 is in both arrays
commonElements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) ➞ [1, 3, 4, 7]
=> 1, 3, 4 7 are in both arrays
commonElements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) ➞ [1, 2, 4, 5]
=> 1, 2, 4, 5 are in both arrays
commonElements([1, 2, 3, 4, 5], [10, 12, 13, 15]) ➞ []
=> no common arrays

Notes
Arrays are sorted.
Try doing this problem with O(n + m) time complexity.

PEDAC
P:
- write a method that takes 2 arrays as arguments
- method finds elements that are common in both arrays

A:
- & does the job he he
- but if I didn't know this:

- initialize `common` to []

- iterate over unique elements from the first array
- iterate over the 2nd array uniq and if any element was there in the first array, add it to `common`
- return result
=end

def common_elements(a1, a2)
  common = []

  a1.uniq.each do |a1_num|
    a2.uniq.each do |a2_num|
      common << a1_num if a1_num == a2_num
    end
  end

  common
end
p common_elements([-1, 3, 4, 6, 7, 9], [1, 3]) == [3]
p common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) == [1, 3, 4, 7]
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) == [1, 2, 4, 5]
p common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) == []

puts

def common_elements(a1, a2)
  a1 & a2
end
p common_elements([-1, 'a'], [1, 3, 'a']) == ['a']
p common_elements([-1, 3, 4, 6, 7, 9], [1, 3]) == [3]
p common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) == [1, 3, 4, 7]
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) == [1, 2, 4, 5]
p common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) == []