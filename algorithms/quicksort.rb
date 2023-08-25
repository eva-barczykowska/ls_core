# https://medium.com/@andrewsouthard1/quicksort-implementation-in-ruby-92de12470efd
require 'benchmark'

def quick_sort(arr)
  return arr if arr.length <= 1

  pivot = arr.sample # Choosing a random pivot
  less_than_pivot = []
  equal_to_pivot = []
  greater_than_pivot = []

  arr.each do |element|
    if element < pivot
      less_than_pivot << element
    elsif element > pivot
      greater_than_pivot << element
    else
      equal_to_pivot << element
    end
  end

  sorted_less = quick_sort(less_than_pivot)
  sorted_greater = quick_sort(greater_than_pivot)

  return sorted_less + equal_to_pivot + sorted_greater
end


# 1.small array
unsorted_array = [11, 5, 7, 6, 15]
time = Benchmark.measure { quick_sort(unsorted_array) }
puts "Execution time is #{time.real}"

# 6.200000643730164e-05
# 0.0000006.2 #small

# 2. large array
# unsorted_array = (0..10_000).to_a.reverse # initializing an array with 1000 random numbers
# time = Benchmark.measure { quick_sort(unsorted_array) }
# puts "Execution time is #{time.real}"

# 0.01438200002303347
#
# Comparison between bubble_sort and quick_sort:
# small array:
# 0.000009    bubble_sort
# 0.0000006   quick_sort
#
# large array:
# 7.9 bubble_sort
# 0.01 quick_sort



