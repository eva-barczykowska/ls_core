# Provide more than 1 solution and think about the tradeoffs between them.
# 1.
# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

result = Hash.new(0)
# result = {}
counter = 0

loop do
  break if counter == flintstones.size

  current_element = flintstones[counter]
  index_of_current_element = flintstones.index(current_element)

  result[current_element] = index_of_current_element
  counter += 1
end

p result

puts "*************************************************************************"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

result = {}
flintstones.each_with_index do |element, index|
  result[element] = index
end

p result

puts "*************************************************************************"

# 2.
# Add up all the ages
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = ages.values.sum

p sum

puts "*************************************************************************"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
counter = 0
sum = 0
values = ages.values
loop do
  break if counter == values.size
  current_value =  values[counter]
  sum += current_value
  counter += 1
end

p sum

puts "*************************************************************************"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_ages = 0
ages.each { |_,age| total_ages += age }
total_ages # => 6174

p total_ages

puts "*************************************************************************"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = ages.values.inject(:+) # => 6174

p sum

puts "*************************************************************************"

# 4. Remove people with ages 100 and greater

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

result = Hash.new(0)
counter = 0
people = ages.keys
their_age = ages.values

loop do
  break if counter == ages.size

  current_person = people[counter]
  current_age = ages[current_person]
  if current_age <= 100
    result[current_person] = current_age
  end
  counter += 1
end

p result

puts "*************************************************************************"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.each_with_object({}) do |(key, value), hash|
  hash[key] = value if value < 100
end

puts "*************************************************************************"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.keep_if { |_, age| age < 100 }

# You could also use #select! here. When using similar methods however, it is
# important to be aware of the subtle differences in their implementation.
# For example, the Ruby Documentation for Hash#select! tells us that it is
# "Equivalent to Hash#keep_if, but returns nil if no changes were made",
# though in this case that wouldn't have made any difference.

puts "*************************************************************************"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
result = ages.select { |key, value| value < 100}

p result

puts "*************************************************************************"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
result = ages.reject { |key, value| value > 100}

p result

puts "*************************************************************************"

# Pick up the minimum age
# But only age - the value or the PAIR?

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

min_age = ages.values.min
p min_age

puts "*************************************************************************"

# 5.
# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each do |elem|
  first_two_characters = elem[0..1]
  if first_two_characters == 'Be'
    print elem
    break
  end
end

puts "*************************************************************************"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
counter = 0

loop do
  current_flintstone = flintstones[counter]
  if current_flintstone[0..1] == "Be"
    p current_flintstone
    break
  else
    counter += 1
  end
end

puts "*************************************************************************"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index { |name| name[0, 2] == "Be" }

puts "*************************************************************************"

# 6.
# Amend this array so that the names are all shortened to
# just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

transformed = flintstones.map!{ |name| name[0..1] }
p transformed

puts "*************************************************************************"

# 7.
# Create a hash that expresses the frequency with which
# each letter occurs in this string:
# Are we supposed to differentiate between capital letters and lower case letters?

statement = "The Flintstones Rock"
statement = statement.delete(" \t\r\n").downcase

# Example outcome: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

counter = 0
result = Hash.new(0)

loop do
  break if counter == statement.size
  current_character = statement[counter]
  p current_character
  if result.key?(current_character)
    result[current_character] += 1
  else
    result[current_character] = 1
  end
  counter += 1
end

p result

puts "*************************************************************************"

statement = "The Flintstones Rock"

res = {}
statement = statement.delete(" \t\r\n").downcase.chars

statement.each do |char|
  res[char] = statement.count(char)
end

p res

puts "*************************************************************************"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

# 8.

# What happens when we modify an array while we are iterating over it?
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

puts "*************************************************************************"
puts "debugging"
# for debugging

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# From this we see that our array is being changed as we go
# (shortened and shifted), and the loop counter used by
# #each is compared against the current length of the array rather than
# its original length.
#
# In our first example, the removal of the first item in the first pass changes
# the value found for the second pass.
#
# In our second example, we are shortening the array each pass just as in the
# first example...but the items removed are beyond the point we are sampling
# from in the abbreviated loop.
#
# In both cases we see that iterators DO NOT work on a copy of the original array
# or from stale meta-data (length) about the array. They operate on the original
# array in real time.

puts "*************************************************************************"

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

puts "*************************************************************************"

# 9.
# As we have seen previously we can use some built-in string methods to change
# the case of a string. A notably missing method is something provided in Rails,
# but not in Ruby itself...titleize. This method in Ruby on Rails creates
# a string that has each word capitalized as it would be in a title.
# For example, the string:

words = "the flintstones rock"
words = words.split.each do |word|
  word.capitalize!
end

p words.join(" ")

puts "*************************************************************************"

words = "the flintstones rock"
words = words.split.map{ |word| word.capitalize }.join(" ")
p words

puts "*************************************************************************"

# 10.

# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing the age group the family
# member is in (kid, adult, or senior). Your solution should produce the hash below
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# this should be the output
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

munster_names = munsters.keys
munster_data = munsters.values

counter = 0
loop do
  break if counter == munsters.size
  current_munster = munster_names[counter]
  current_munster_data = munsters[current_munster]
  age = current_munster_data["age"] #grabbing the age from the hash in the muster_data array
  case age
  when 0..17
    current_munster_data[:age_group] = "kid"
  when 18..64
    current_munster_data[:age_group] = "adult"
  else
    current_munster_data[:age_group] = "adult"
  end
  counter += 1
end

p munsters

puts "*************************************************************************"

# ls solution, which is shorter
# I used loop but this is shorter and cleaner looking done with .each

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
