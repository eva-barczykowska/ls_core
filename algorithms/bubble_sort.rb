# https://www.honeybadger.io/blog/ruby-bubble-sort/
require 'benchmark'

def bubble_sort(array)
  array_length = array.size # we need this number because it will tell us how many iterations we need
  return array if array_length <= 1

  loop do
    # we need to create a variable that will be checked so that we don't run into an infinite loop scenario.
    swapped = false

    # subtract one because Ruby arrays are zero-index based
    (array_length - 1).times do |i| # indices are 0, 1, 2, 3, 4
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i] # swapping elements if first is greater than the second
        swapped = true # toggling the variable so that the loop can go to the top and keep analyzing
      end
    end

    break if not swapped
  end

  array
end

# 1.demonstrate how much time it takes with a small array
# 2.demonstrate how much time it takes with a large array

# 1.
unsorted_array = [11, 5, 7, 6, 15]
time = Benchmark.measure { bubble_sort(unsorted_array) }
puts "Execution time is #{time.real}"

# 0.000009000010322779417e-06 small
# 0.000009

# 2.
# unsorted_array = (0..10_000).to_a.reverse # initializing an array with 1000 random numbers
# time = Benchmark.measure { bubble_sort(unsorted_array) }
# puts "Execution time is #{time.real}"

# 7.935840999998618 big