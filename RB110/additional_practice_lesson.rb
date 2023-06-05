#1.
# Given the array below turn this array into a hash where
# the names are the keys and the values are the positions in the array.
# a)
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hsh = {}
counter = 0
while counter < flintstones.size # I need 1 less!
  hsh[flintstones[counter]] = counter
  counter += 1
end

p hsh

#b)
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hsh = {}

flintstones.each_with_index { |name, index| hsh[name] = index }
p hsh

#c)
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p flintstones.to_h { |name| [name, flintstones.index(name)] } # [name, flintstones.index(name)] contains what the hash will look like, so its KEY and VALUE

#d)
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hsh = {}
counter = 0
loop do
  break if counter == flintstones.size
  hsh[flintstones[counter]] = counter
  counter += 1
end

p hsh

puts

#2.
# Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#a)
p ages.values.sum

#b)
p ages.values.inject(:+)
p ages.values.reduce(:+)

#c)
sum = 0
ages.each do |_, age|
  sum += age
end
p sum

#d)
sum = 0
ages.each { |_, age| sum += age } # shorter than the previous one, easier to read
p sum

#3.
# Remove people with age 100 and greater
# #a)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.reject! { |_, age| age >= 100 }
p ages

#b)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.select! { |_, age| age < 100 }
p ages

#c)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.each do |name, age|
  if ages[name] >= 100
    ages.delete(name)
  end
end

p ages

#d)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if { |_, age| age < 100 }
p ages

#4. Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min
p ages.values.sort.first
p ages.values.sort[0]
p ages.values.minmax[0]

#5. Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

p flintstones.index { |name| name[0, 2] == "Be" }
p flintstones.index { |name| name.start_with?("Be") }

#6.Write code that changes the array below so that all of the names are shortened to just the first three characters. Do not create a new array.
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

p flintstones.map { |name| name[0,3] } # I like this solution best because it's the most concise

flintstones.map! do |name| # same as above but longer
  name[0, 3]
end

p flintstones.map { |name| name.chars.first(3).join }
p flintstones.map { |name| name.slice(0, 3) }


#7.Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

#a
p statement.chars.tally

#b)
statement = "The Flintstones Rock"
h = {}
statement.chars.each do |letter|
  if !h.has_key?(letter)
    h[letter] = 1
  else
    h[letter] += 1
  end
end

p h

#c) ls solution
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter) # interesting use of count
  result[letter] = letter_frequency if letter_frequency > 0 # interesting
end

p result

#8. What happens when we modify an array while we are iterating over it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# 1 will get printed, then 1 will be deleted and 2 will be in order but Ruby will think that 2 was already printed
# so 3 will get printed and 2 will be deleted in the 2nd iteration
# that's it

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# here in the 1st iteration 1 will be printed and 4 will be deleted (destructively) and returned
# in the 2nd iteration 2 will be printed and 3 will be deleted (destructively)and returned
# and that's it
#
# some code for debugging:
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# From this we see that our array is being changed as we go (shortened and shifted), and the loop counter used by
# #each is compared against the current length of the array rather than its original length.

# In our first example, the removal of the first item in the first pass changes the value found for the second pass.

# In our second example, we are shortening the array each pass just as in the first example...
# but the items removed are beyond the point we are sampling from in the abbreviated loop.

# In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length)
# about the array. They operate on the original array in real time.


#9. As we have seen previously we can use some built-in string methods to change the case of a string.
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize.
# This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.
# For example, the string
# words = "the flintstones rock" would be words = "The Flintstones Rock"
# write your own titleize method

#a)
words = "the flintstones rock"

def titleize(title)
  title.split.map { |word| word.capitalize }.join(" ")
end

p titleize(words)

#b)
words = "the flintstones rock"

def titleize(title)
  title.split.each do |word|
    word.capitalize!
  end.join(" ")
end

p titleize(words)

#c)
words = "the flintstones rock"

def titleize(title)
  counter = 0
  title = title.split

  loop do
    break if counter == title.size
    title[counter].capitalize!
    counter += 1
  end

  title.join(" ")
end

p titleize(words)

#10. Given the hash below
# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of
# three values describing the age group the family member is in (kid, adult, or senior).
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
p munsters

puts
# Your solution should produce the hash below
solution = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.


# how do I add a key-value pair to a hash?

munsters.each do |_, details| # here we're taking hold of KEY, which is a string and VALUE, WHICH ITSELF IS A HASH
  case details["age"]
  when 0..17
    details["age_group"] = "kid"
  when 18..64
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters
p munsters == solution