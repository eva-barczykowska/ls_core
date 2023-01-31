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

# -iterate over the array, count unique elements and print them

# ************** Code **************
def count_vehicles(arr)
  arr.uniq.each do |element|
    puts "#{element} => #{arr.count(element)}"
  end
end

vehicles1 = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
# ["car", "truck", "SUV", "motorcycle"] after calling uniq on the array argument

vehicles2 = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_vehicles(vehicles1)
puts
count_vehicles(vehicles2)