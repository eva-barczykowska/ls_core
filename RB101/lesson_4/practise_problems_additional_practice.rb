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
