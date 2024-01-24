=begin
A boomerang is a V-shaped sequence that is either upright or upside down. Specifically, a boomerang can be defined as: sub-array of length 3, with the first and last digits being the same and the middle digit being different.

Some boomerang examples:

[3, 7, 3], [1, -1, 1], [5, 6, 5]
Create a function that returns the total number of boomerangs in an array.

To illustrate:

[3, 7, 3, 2, 1, 5, 1, 2, 2, -2, 2] => 2, 2
[3, 7, 3] [1, 5, 1] [2, -2, 2]
// 3 boomerangs in this sequence:  [3, 7, 3], [1, 5, 1], [2, -2, 2]
Be aware that boomerangs can overlap, like so:

[1, 7, 1, 7, 1, 7, 1] => 1
[1, 7, 1] [7, 1, 7],
// 5 boomerangs (from left to right): [1, 7, 1], [7, 1, 7], [1, 7, 1], [7, 1, 7], and [1, 7, 1]

Examples:
count_boomerangs([9, 5, 9, 5, 1, 1, 1]) == 2
[9, 5, 9] [5, 9, 5] [9, 5, 1] [5, 1, 1] [1, 1, 1]


count_boomerangs([5, 6, 6, 7, 6, 3, 9]) == 1

count_boomerangs([4, 4, 4, 9, 9, 9, 9]) == 0

P:
Input: an array of numbers
Output: RETURN THE NUMBER OF ARRAYS THAT ARE POSSIBLE TO CREATE

Rules
-create "boomenarang arrays", ie. create as many arrays as possible from the given numbers
       same - different - same

A:
- create all possible subarrays
- start iteration with index 0 and take 3
- start with index 1 and take 3, etc. until array[-3]

-save the resulting arrays to subarrays

- select the arrays where first and last numbers are same AND the middle number is greater or smaller (but not the same)
=end

def count_boomerangs(array)
  subarrays = []

  result = []

  (0..array.size - 3).each do |index|
    subarrays << array.slice(index, 3)
  end

  subarrays.each do |s|
    result << s if (s.last == s.first) && (s[1] < s[0] || s[1] > s[0])
  end

  result.size
end

p count_boomerangs([9, 5, 9, 5, 1, 1, 1]) == 2
p count_boomerangs([5, 6, 6, 7, 6, 3, 9]) == 1
p count_boomerangs([4, 4, 4, 9, 9, 9, 9]) == 0

puts

def count_boomerangs(array)
  subarrays = []

  result = []

  (0..array.size - 3).each do |index|
    subarrays << array.slice(index, 3)
  end

  subarrays.select do |s|
    (s.last == s.first) && (s[1] < s[0] || s[1] > s[0])
  end.size
end

puts

p count_boomerangs([9, 5, 9, 5, 1, 1, 1]) == 2
p count_boomerangs([5, 6, 6, 7, 6, 3, 9]) == 1
p count_boomerangs([4, 4, 4, 9, 9, 9, 9]) == 0

def count_boomerangs(array)
  subarrays = []

  result = []

  (0..array.size - 3).each do |index|
    subarrays << array.slice(index, 3)
  end

  subarrays.select do |s|
    (s.last == s.first) && (s[1] != s[0])
  end.size
end

p count_boomerangs([9, 5, 9, 5, 1, 1, 1]) == 2
p count_boomerangs([5, 6, 6, 7, 6, 3, 9]) == 1
p count_boomerangs([4, 4, 4, 9, 9, 9, 9]) == 0

puts

#Nick
def count_boomerangs source_array
  array_of_3_length_subarrays = []
  source_array.each_cons(3){|sub_array| array_of_3_length_subarrays << sub_array}

  array_valid_boomerangs = array_of_3_length_subarrays.reject do |sub_array|
    sub_array.uniq.length == 1 || sub_array.first != sub_array.last
  end
  array_valid_boomerangs.size
end
count_boomerangs([9, 5, 9, 5, 1, 1, 1]) == 2
count_boomerangs([5, 6, 6, 7, 6, 3, 9]) == 1
count_boomerangs([4, 4, 4, 9, 9, 9, 9]) == 0

puts

def count_boomerangs(array)
  subarrays = []

  array.size - 3.times do |index|
    subarrays << array.slice(index, 3)
  end

  subarrays.select do |s|
    (s.first == s.last) && (s[0] != s[1])
  end.size
end

count_boomerangs([9, 5, 9, 5, 1, 1, 1]) == 2
count_boomerangs([5, 6, 6, 7, 6, 3, 9]) == 1
count_boomerangs([4, 4, 4, 9, 9, 9, 9]) == 0


