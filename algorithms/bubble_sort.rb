# https://www.honeybadger.io/blog/ruby-bubble-sort/

def bubble_sort(array)
  array_length = array.size # we need this number because it will tell us how many iterations we need
  return array if array_length <= 1

  loop do
    # we need to create a variable that will be checked so that we don't run into an infinite loop scenario.
    swapped = false

    # subtract one because Ruby arrays are zero-index based
    (array_length - 1).times do |i| # 0, 1, 2, 3, 4
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
# 2.demonstrate how much time it takes with a bigger array

# 1.
# unsorted_array = [11, 5, 7, 6, 15]
# p unsorted_array

# 2.
unsorted_array = Array.new(1000) { rand(1..10000) } # initializing an array with 1000 random numbers
p unsorted_array

starting = Time.now # defining and printing time before
puts starting

p bubble_sort(unsorted_array) # executing bubble sort algorithm on the array

ending = Time.now # defining and printing time after
puts ending

time_of_execution = ending - starting # calculating the time that it took for the algorithm to do the job
puts time_of_execution