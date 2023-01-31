# How Many
# Write a method that counts the number of occurrences of each element in a given array.
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# # The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.
# output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# PEDAC TEMPLATE

# ************** Problem **************
# -write a method that takes an array as an argument
# -count elements (elements are case-sensitive)
# -print elements and their count in the required way


# Questions:

# ************** Examples **************
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'suv', 'suv', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
# output:

# car => 4
# truck => 3
# SUV => 1
# suv => 2
# motorcycle => 2


# ************** Data Structures **************
# input: array
# output: printed elements with their counts

# ************** Algorithm **************
# -create a result hash
# -iterate over the input array
# -if the current element doesn't exist as a hash key
# -then add it as a hash key
# -else (if it exists), increase the count by 1
# -print the hash in the required manner

# ************** Code **************

def count_vehicles(arr)
  result = {}
  arr.each do |element|
    if !result.has_key?(element)
      result[element] = 1
    else
      result[element] += 1
    end
  end
  result
  result.each do |k, v|
    puts "#{k} => #{v}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_vehicles(vehicles)
puts

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_vehicles(vehicles)

