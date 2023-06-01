# write a method that transforms elements of the array if they are odd
# expected result:
# my_numbers = [1, 4, 3, 7, 2, 6]
# double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]
#
# # not mutated
# my_numbers                      # => [1, 4, 3, 7, 2, 6]

def double_odd_numbers(numbers)
  result_array = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]

    if current_number.odd?
      result_array << current_number * 2
    else
      result_array << current_number
    end

    counter += 1
  end

  result_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
p my_numbers                      # => [1, 4, 3, 7, 2, 6]

puts

# Exercise for the reader: What if we wanted to transform the numbers based on their position in the array
# rather than their value?
# Try coding a solution that doubles the numbers that have odd indices:

my_numbers = [1, 4, 3, 7, 2, 6]

def double_if_index_odd(numbers)
  result = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]

    if numbers.index(current_number).odd?
      result << current_number * 2
    else
      result << current_number
    end

    counter += 1
  end

  result
end

p double_if_index_odd(my_numbers)

# ls solution
def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers) # => [1, 8, 3, 14, 2, 12]