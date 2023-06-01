# write a method that doubles numbers using a loop
# non-mutating
my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers(numbers)
  result = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    result << current_number * 2

    counter += 1
  end

  result
end
p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]

puts

# mutating
my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(numbers)
  result = []
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] = numbers[counter] * 2 # or even shorter numbers[counter] *= 2

    counter += 1
  end

  numbers
end
p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]

puts

# ls solution
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end

p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]