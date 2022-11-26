
=begin
Write a function that maps a string into an array of name, age, and occupation pairs.

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
-initialize a hash with the keys `name`, `age`, `occupation`, with the values nil
-split the string into elements
-my array needs to be sliced into arrays of 3 elements
-iterate through the array, each time taking 3 elements and inserting them into a hash
at the place of value for the following keys {:name=>"", :age=>"", :occupation=>""}
-use helper method to split the array into arrays of 3 elements
-the elements of the array will be values for the hashes key
-iterate over the arrays and insert their elements into consecutive hashes (this is based on index, which is the same in every array and hash

### Helper Method - Algorithm
  -write a helper method that divides the array of strings into an array of 3-element arrays

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

# organize("Conan O'Brien, 56, Talk Show Host, Anna Wintour, 69, Editor") ➞ [
#   {:name=>"Conan O'Brien", :age=>"56", :occupation=>"Talk Show Host"},
#   {:name=>"Anna Wintour", :age=>"69", :occupation=>"Editor"}
# ]
