# You'll be given a list of two strings, and each will contain exactly one colon (":") in the middle (but not at beginning or end). The length of the strings, before and after the colon, are random.
#
# Your job is to return a list of two strings (in the same order as the original list), but with the characters after each colon swapped.
# E:
# ["abc:123", "cde:456"]  ==  ["abc:456", "cde:123"]
# ["a:12345", "777:xyz"]  ==  ["a:xyz", "777:12345"]
# A:
# split each str at the colon, this will give me a nested array, each having 2 elements
# I need to swap the second element in each array with the second element in the previous array
#
# ["abc:456", "cde:123"] becomes [["abc", "456"], ["cde", "123"]] => expected ["abc": "123" ], ["cde":"456"]
# first delete in all arrays element at index 1 and store in an array `deleted`
# reverse the `deleted` array
# reinsert the elements using a loop and counter
# so in all arrays append element from the `deleted` array that is at the counter index
# join elements in the array on : and return the result

def tail_swap(strings)
  nested_arrays = []
  deleted = []

  strings.each { |e| nested_arrays << e.split(":") }

  nested_arrays.each { |subarray| deleted << subarray.delete_at(1) }

  deleted = deleted.reverse

  counter = 0
  while counter < nested_arrays.size
    nested_arrays[counter] << deleted[counter]
    counter += 1
  end

  nested_arrays.map { |arr| arr.join(":") }
end
p tail_swap(['abc:123', 'cde:456']) == ['abc:456', 'cde:123']
tail_swap(['a:12345', '777:xyz']) == ['a:xyz'  , '777:12345']

