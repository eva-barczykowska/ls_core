=begin
Write a method that maps a string into an array of name, age, and occupation
pairs.

Examples
organize("John Mayer, 41, Singer, Emily Blunt, 36, Actor") ➞ [
  {:name=>"John Mayer", :age=>"41", :occupation=>"Singer"},
  {:name=>"Emily Blunt", :age=>"36", :occupation=>"Actor"}
]

organize("Conan O'Brien, 56, Talk Show Host, Anna Wintour, 69, Editor") ➞ [
  {:name=>"Conan O'Brien", :age=>"56", :occupation=>"Talk Show Host"},
  {:name=>"Anna Wintour", :age=>"69", :occupation=>"Editor"}
]

organize("") ➞ []
=end

=begin
PEDAC
Problem
-write a method that takes a STRING as an argument
-the method returns an ARRAY OF HASHES
-each hash contains information about the person (name, age. occupation)

Examples
organize("John Mayer, 41, Singer, Emily Blunt, 36, Actor") ➞ [
  {:name=>"John Mayer", :age=>"41", :occupation=>"Singer"},
  {:name=>"Emily Blunt", :age=>"36", :occupation=>"Actor"}
]

organize("Conan O'Brien, 56, Talk Show Host, Anna Wintour, 69, Editor") ➞ [
  {:name=>"Conan O'Brien", :age=>"56", :occupation=>"Talk Show Host"},
  {:name=>"Anna Wintour", :age=>"69", :occupation=>"Editor"}
]

organize("") ➞ []

Data structures
input: String
output: an Array of hashes

Algorithm
-initialize the `res` array, where I will push the hashes

-split the string on a comma AND SPACE
 (otherwise you'll get
 `[["John Mayer", " 41", " Singer"], [" Emily Blunt", " 36", " Actor"]]`
 into elements, remove spaces if any
-the resulting array needs to be sliced into arrays of 3 elements
-iterate through the array, each time taking 3 elements and
placing them into separate arrays
-the above will produce a nested array: an array of 3-element arrays
-write and use a helper method to split the array into arrays of 3 elements
OR use the each_slice method
-the elements of each array will be values (for the keys) in each hash

-initialize a hash with the keys `name`, `age`, `occupation`,
with the value `nil` for each key
-iterate over the elements in each of the arrays and insert the elements
 into a hash,
(use index, which is the same in every array and hash)
 then push the hash into the result array
-repeat this process until there are no more 3-element arrays

 -return the `res` array

### Helper Method - Algorithm
  -write a helper method that divides the array of strings into an array of
   3-element arrays OR use each_slice :-)

=end

def divide_array_into_arrays_of_3_element(str)
  arr = str.split(", ")
  split = []
  counter = 0
  while counter < arr.size
    split << arr.slice(counter, 3)
    counter += 3
  end
  split
end

# p divide_array_into_arrays_of_3_element("John Mayer, 41, Singer, Emily Blunt, 36, Actor")

def organize(str)
  result = []

  array_of_arrays = divide_array_into_arrays_of_3_element(str)

  array_of_arrays.each do |array|
    h = { :name => nil, :age=> nil, :occupation=> nil }

    h.each_with_index do |(k, v), i|
      h[k] = array[i]
    end

    result.push(h)
  end

  result
end

p organize("John Mayer, 41, Singer, Emily Blunt, 36, Actor") #== [
  # {:name=>"John Mayer", :age=>"41", :occupation=>"Singer"},
  # {:name=>"Emily Blunt", :age=>"36", :occupation=>"Actor"}
# ]

p organize("Conan O'Brien, 56, Talk Show Host, Anna Wintour, 69, Editor") ==[
  {:name=>"Conan O'Brien", :age=>"56", :occupation=>"Talk Show Host"},
  {:name=>"Anna Wintour", :age=>"69", :occupation=>"Editor"}
]

p organize("") #== []

puts
puts 'refactor'

def organize(str)
  res = []
  arr = str.split(", ")
  arrays_of_three = []
  arr.each_slice(3) { |three| arrays_of_three.push(three) }
  p arrays_of_three
  arrays_of_three.each do |array| # this gives me access to EACH ARRAY in turn
    h = { :name => nil, :age => nil, :occupation => nil }
    h.each_with_index do |(k, v), i| # gives me access to each k/v and INDEX
      h[k] = array[i] # passing the value which corresponds to array[index] so first "John Mayer", then "41" and then "Actor"
    end
    res.push(h)
  end
  res
end

p organize("John Mayer, 41, Singer, Emily Blunt, 36, Actor") == [
  { :name => "John Mayer", :age => "41", :occupation => "Singer" },
  { :name => "Emily Blunt", :age => "36", :occupation => "Actor" }
]
