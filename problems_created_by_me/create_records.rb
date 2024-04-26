# You have a list of names. Write a method that returns a hash where the key is a unique number and the value is nested array. Each of these nested arrays has to have 2 elements: a surname followed by its length. The nested arrays are in order determined by the length of the name in ascending order, so the inner array with the shortest name will be first. Empty array argument returns empty array.

def create_records(names)
  arr = names.map { |name| [name, name.size] }.sort_by { |subarr| subarr[1] }
  numbers = (1...arr.size).to_a
  numbers.zip(arr).to_h
end

names = %w[brandi leonardo li fiona]
p create_records(names) == { 1 => ['li', 2], 2 => ['fiona', 5], 3 => ['brandi', 6] }

names = %w[Dwight Fiona Jim Oscar]
p create_records(names) == { 1 => ['Jim', 3], 2 => ['Fiona', 5], 3 => ['Oscar', 5] }
