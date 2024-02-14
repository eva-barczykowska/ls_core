# Write a function that calculates the sum of all numbers in a nested array. The array may contain integers, nested arrays of integers, or a mix of both. (for ruby and JS don’t use flatten)

# sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) # 21
# sum_of_nested_array([10, [20, 30, [40]], 50]) # 150

=begin


- PROBLEM
  - Input: a nested array
  - Output: sum of all numbers of the arg array

  - Rules:
    - don't use flatten

- EXAMPLE
  # sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) == 21
  =>
# sum_of_nested_array([10, [20, 30, [40]], 50]) == 150
=>

- DATA STRUCTURE
  - array

- ALGORITHM
  - covert the array arg into a hash (keys - arrays, values
  -? this could be a problem with same nested arrays !!!!
  keys have to be unique
  -solve it again with arrays as values (and not keys) UNPACK THE ARRAYS

  - iteate over the hashes
  - sum their keys
=end
# Write a function that calculates the sum of all numbers in a nested array. The array may contain integers, nested arrays of integers, or a mix of both. (for ruby and JS don’t use flatten)

# sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) # 21
# sum_of_nested_array([10, [20, 30, [40]], 50]) # 150

=begin


- PROBLEM
  - Input: a nested array
  - Output: sum of all numbers of the arg array

  - Rules:
    - don't use flatten

- EXAMPLE
  # sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) == 21
  =>
# sum_of_nested_array([10, [20, 30, [40]], 50]) == 150
=>

- DATA STRUCTURE
  - array
=end

def sum_of_nested_array(nested_array)
  flattened_array = flatten(nested_array, result = [])
  flattened_array.sum
end

def flatten(nested_array, result = []) # write your own flatten method
  nested_array.each do |element|
    if element.is_a?(Integer)
      result << element
    elsif element.is_a?(Array)
      flatten(element, result)
    end
  end
  return result if result.all? { |element| element.is_a?(Integer) }
end

################################################################

p sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) # 21
p sum_of_nested_array([10, [20, 30, [40]], 50]) # 150

puts

# ALGORITHM
# - create a placeholder for total sum
# - create a duplicate duplicated_array from given array
# - remove the last_element from duplicated_array
#   - check
#     if last_element is an integer, add it to the sum
#     else concat the element back to duplicated_array
# - repeat the whole process until the duplicated_array is empty?
# - return the sum

def sum_of_nested_array(array) # I love this solution
  sum = 0

  duplicated_array = array.clone

  until duplicated_array.empty?
    last_element = duplicated_array.pop # remove the last element from the array

    if last_element.is_a?(Integer) # if it is an Integer, we can add it to the `sum`
      sum += last_element
    else
      duplicated_array.concat(last_element) # if it is not, append it to the end of the array you're working with
      p duplicated_array
    end
  end

  sum
end

# p sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) == 21
p sum_of_nested_array([10, [20, 30, [40]], 50]) == 150