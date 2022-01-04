# 1. In this hash of people, see if Spot is present.
# What are the 2 methods that can help you find out?

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

p ages.key?('Spot')
p ages.include?('Spot')
p ages.member?('Spot')

# 2. Convert the string in the following ways
# (code will be executed on original munsters_description belo)

munsters_description = 'The Munsters are creepy in a good way.'

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# p munsters_description.swapcase!
p munsters_description.capitalize!
# p munsters_description.downcase!
# p munsters_description.upcase!
p munsters_description # notice, the original string has been mutated

# 3. add ages for Marilyn and Spot to the existing hash

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10 }
additional_ages = { 'Marilyn' => 22, 'Spot' => 237 }
ages.merge!(additional_ages)
p ages

# 4. See if the name "Dino" appears in the string below

advice = 'Few things in life are as important as house training your pet dinosaur.'
p advice.include?('Dino')
p advice.match?('Dino')

# 5. Show an easier way to write this array

flintstones = ['Fred', 'Barney', 'Wilma', 'Betty', 'BamBam', 'Pebbles']

p flintstones_easier = %w[Fred Barney Wilma Betty BamBam Pebbles]

# 6. How can we add the family pet Dino?
flintstones << 'Dino'
p flintstones

# 7. In the previous practice problem we added Dino to our array like this:

flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]
flintstones << 'Dino'

# We could have used either Array#concat or Array#push to add Dino to the family.

# How can we add multiple items to our array? (Dino and Hoppy)

p flintstones_with_no_pets = flintstones.pop
p flintstones
# p flintstones.push('Dino', 'Hoppy')

p flintstones.push('Dino').push('Hoppy') # push returns the array so we can chain
# p flintstones.concat(%w(Dino Hoppy)) # concat adds an array rather than one item

# 8. Shorten the following sentence:
advice = 'Few things in life are as important as house training your pet dinosaur.'
# Review the String#slice! documentation, and use that method to make
# the return value "Few things in life are as important as ".
# But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?
# p advice.slice!(0..38)

# Answer: If we use String#slice!,it changes the original string
# String#slice (without the '!')does NOT.

advice.slice!(0, advice.index('house')) # => "Few things in life are as important as "
p advice # => "house training your pet dinosaur."

# 9. Write a one-liner to count the number of lower-case 't'
# characters in the following string:

statement = "The Flintstones Rock!"
statement.count('t')

# 10. Back in the stone age (before CSS) we used spaces to align things
# on the screen. If we had a table of Flintstone family members that was
# forty characters in width, how could we easily center that title above the table with spaces?

title = 'Flintstone Family Members'
p title.center(40)
