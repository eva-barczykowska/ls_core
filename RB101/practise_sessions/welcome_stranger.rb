# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that, when combined with adjoining spaces, will
# produce a person's name. The hash will contain two keys, :title and :occupation,
# and the appropriate values. Your method should return a greeting that uses
# the person's full name, and mentions the person's title and occupation.

# PEDAC
# Problem
# -write a method that takes 2 arguments
# -1st argument is an array
# -2nd argument is a hash
# -the array contains 2 or more elements
# -the elements, when combined, will produce a person's name
# -['Ewa', 'A', 'Barczykowska']
# -the hash will contain 2 keys, :title and :occupation
# { title: 'Master', occupation: 'Test Analyst' }
# -the method will return a string, a greeting
# -Hello, Ewa A Barczykowska! Nice to have a Master Test Analyst around.

# Examples
# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# # => Hello, John Q Doe! Nice to have a Master Plumber around.

# Data Structures
# Input: Array, Hash
# Output: String

# Algorithm:
# -make 1st string (declare `full_name` and init to the joined input array)
# -in the 1st string interpolate all elements of the array
# -make 2nd string
# -in the 2nd string interpolate all values of the hash
# -return 1st string + 2nd string

# Code
def greetings(array, hash)
  full_name = array.join(" ")
  first_str = "Hello, #{full_name}. "
  second_string = "Nice to have a " + hash[:title] + " " + hash[:occupation] + " around."
  first_str + second_string
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Remarks from Allison:
# String interpolation of a hash value. Pay attention to the quotes you're using.
# '' vs. ""
# Paying attention to quotation matching.
# Paying attention to your variable names.
# Good varaible naming practices.

# ls solution
def greetings(name, status)
  "Hello, #{name.join(' ')}! Nice to have a #{status[:title]} #{status[:occupation]} around."
end

p greetings(['Ewa', 'A', 'Barczykowska'], { title: 'Master', occupation: 'Test Analyst' })

# further exploration
# shorten the lines so that the method passes Rubocop

def greetings(name, status)
  name = name.join(" ")
  title = status[:title]
  occupation = status[:occupation]
  "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end
p greetings(['Ewa', 'A', 'Barczykowska'], { title: 'Master', occupation: 'Test Analyst' })

#other people's solutions
def greetings(arr, hsh)
  name = arr.join(' ')
  professional = hsh.values.join(' ')
  "=> Hello, #{name}! Nice to have a #{professional} around."
end
p greetings(['Ewa', 'A', 'Barczykowska'], { title: 'Master', occupation: 'Test Analyst' })

p "last one"
def greetings(name, status)
  full_name = name.join(' ')
  job = status.values.join(' ')
  "Hello #{full_name}! nice to have a #{job} around."
end
p greetings(['Ewa', 'A', 'Barczykowska'], { title: 'Master', occupation: 'Test Analyst' })
