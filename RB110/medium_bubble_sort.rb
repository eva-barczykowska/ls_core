# Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.
#
# A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.
# https://launchschool.com/exercises/2a5d5a4e
#
# 6  2  7  1  4  Start: compare 6 > 2? Yes  index 0 and 1
# 2  6  7  1  4  Exchange
#
# 2  6  7  1  4  6 > 7? No (no exchange) index 1 and 2
#
# 2  6  7  1  4  7 > 1? Yes index 2 and 3
# 2  6  1  7  4  Exchange
#
# 2  6  1  7  4  7 > 4? Yes index 3 and 4
# 2  6  1  4  7  Exchange
#
# 2  6  1  4  7  2 > 6? No index 0 and 1 --2nd iteration
#
# 2  6  1  4  7  6 > 1? Yes -index 1 and 2
# 2  1  6  4  7  Exchange
#
# 2  1  6  4  7  6 > 4? Yes -index 2 and 3
# 2  1  4  6  7  Exchange
#
# 2  1  4  6  7  6 > 7? No -index 3 and 4
#
# 2  1  4  6  7  2 > 1? Yes - index 0 and 1 --3rd iteration
# 1  2  4  6  7  Exchange
#
# 1  2  4  6  7  2 > 4? No
# 1  2  4  6  7  4 > 6? No
# 1  2  4  6  7  6 > 7? No
# 1  2  4  6  7  1 > 2? No 4th iteration break?
#
# 1  2  4  6  7  2 > 4? No
# 1  2  4  6  7  4 > 6? No
# 1  2  4  6  7  6 > 7? No
# 1  2  4  6  7  No swaps; all done; sorted 5th iteration
#
# as many iterations as numbers
#
# We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.
#
# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.
#
# -write bubble sort algorithm as above
# -array will be mutated
# -array has at least 2 elements
#
# Examples
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]
#
# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]
#
# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
#
# DS:
# input: an array of strings or nubmers
# output: sorted array of strings or numbers
#
# A:
# -initialize index and counter to 1
# -2 loops, 1 for indices and 1 for the current iteration
# -go throuth all elements of the array until penultimate
#
# -look at 2 elements at a time, starting with index 0
# -initialize `change` to `nil`
# (-shift 2 elements)
# -if they are not in order, order them
# -set the `change` variable to `true`
# -if they are in order do nothing
#   -- add them back to the argument array
# -keep track if I did the reordering change or not
# -at the end of the iteration I need to ask if I've done the change or not, if change is `nil`
# -if I haven't, that means the numbers are sorted and I can break prematurely
def bubble_sort!(array)
  iteration_counter = 0
  while iteration_counter < array.size - 1
    index = 0
    change = nil
    while index < array.size - 1
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        change = true
      end
      index += 1
    end
    break if change.nil?

    iteration_counter += 1
  end
  array
end

array = [5, 3]
p bubble_sort!(array)

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)

array = %w[Sue Pete Alice Tyler Rachel Kim Bonnie]
p bubble_sort!(array)
array == %w[Alice Bonnie Kim Pete Rachel Sue Tyler]
