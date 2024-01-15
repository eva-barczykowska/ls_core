=begin
Sum of Pairs
Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]

Negative numbers and duplicate numbers can and will appear.

NOTE: There will also be lists tested of lengths upwards of 10,000,000 elements. Be sure your code doesn't time out.

PEDAC
P:
- have integers and a single sum value
- write a method
- method retuns the first 2 numbers (from the left) that make the sum
- if more pairs with the required sum, the pair whose second element has the smallest index is the solution.
- array can have negative numbers or duplicate numbers
-return value is an array
- if there are many arrays to chose from, chose that one whose second index is the lowest

E:
sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]
11+3, 11+7, 11+5
3+7, 3+5
7+5


sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== nil

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]
A:
- initialize hash to {}

- iterate over the array and get indices as array and pairs of numbers as array
- eg from the 1st array numbers will be:
11+3, 11+7, 11+5
3+7, 3+5
7+5
and indices will be: [0, 1], [0, 2], [0, 3], [0, 4], [1, 0]

-but save indices array as key and numbers array as value into the hash only if the sum of the value array is equal to the target_sum

- if hash is empty, return nil
- if hash is size 1, return the value - not necessary

- initialze `lowest_second_value` to the return value of hash's keys mapped to second value and min value extracted

- iterate over the hash and return that array from the values, for which the second index in the keys is equal to lowest_second_value

=end
def sum_pairs(arr, target_sum)
  h = {}

  (0...arr.size).each do |starting_index|
    (starting_index.next...arr.size).each do |ending_index|
      h[[starting_index, ending_index]] = [arr[starting_index], arr[ending_index]] if [arr[starting_index], arr[ending_index]].sum == target_sum
    end
  end
  #  p h
  return nil if h.empty?
  # return h.values.flatten if h.size == 1

  lowest_second_value = h.keys.map { |a| a[1] }.min

  h.each do |k, v|
    return v if k[1] == lowest_second_value
  end

end
p sum_pairs([11, 3, 7, 5], 10) == [3, 7]
p sum_pairs([0, 0, -2, 3], 2) == nil
p sum_pairs([4, 3, 2, 3, 4], 6) == [4, 2]

puts
# Execution Timed Out (12000 ms)
# optimazing
def sum_pairs(arr, target_sum)
  h = {}

  (0...arr.size).each do |starting_index|
    (starting_index.next...arr.size).each do |ending_index|
      h[[starting_index, ending_index]] = [arr[starting_index], arr[ending_index]] if [arr[starting_index], arr[ending_index]].sum == target_sum
    end
  end

  return nil if h.empty?

  lowest_second_value = h.keys.map { |a| a[1] }.min

  h.reject { |k, v| k[1] != lowest_second_value}.values.flatten
end

p sum_pairs([11, 3, 7, 5], 10) == [3, 7]
p sum_pairs([0, 0, -2, 3], 2) == nil
p sum_pairs([4, 3, 2, 3, 4], 6) == [4, 2]
