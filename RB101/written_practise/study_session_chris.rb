# 1.
ages = [21, 34, 55, 19, 66] # arr.size = 5
highest = [0]

def greatest_age(arr, highest_age)
  i = 0

  loop do
    break if i >= arr.size # change here so because we start counting from 0 so we need to count only to 4

    if (highest_age.last < arr[i])
      highest_age.push(arr[i])
      highest_age.shift # removes the first element, mutates the caller
    end

    i += 1
  end
  highest_age # we need to return it, otherwise nil will be returned
end

p greatest_age(ages, highest)
p highest

# this code should output the greatest age in the ages array but its not working correctly.
# What does it output and why? How can we update the code so that it behaves appropriately?

puts

ages = [21, 34, 55, 19, 66]
highest = [0]

def greatest_age(arr, highest_age)
  i = 0

  loop do
    break if i == arr.size

    if (highest_age.last  < arr[i])
      highest_age.pop #switch lines 11 and 12
      highest_age.push(arr[i])
    end

    i +=  1
  end
end

greatest_age(ages, highest)
p highest     # => [66]

# or another possible alternative could be to use Ruby method, .max()
p ages.max    # => 66

puts

# 2.
snack = 'french fries'
num = 1

num.times do |num|
  puts "I'll love #{snack}, even when I'm #{num * 100}!"
end

# What will this output and why?
# Integer#times method calls the given block self times with each integer in (0..self-1)

array = []
num = 3
num.times do |number|
  array << number # we should get [0, 1, 2]
end

p array

puts

greetings = ['hello', 'howdy', 'yo', 'greetings', 'sup']
names = ['Homer', 'Marge', 'Bart', 'Lisa', 'Maggie']

def random_greeting(name)
  name = name.capitalize
  # greeting = greetings.sample #greetings has not been passed as a parameter so it's out of scope!
  # p greeting + ' ' + name
end

name = names.sample
random_greeting(name)

puts

numbers = [1, 2, 3]
number_enthusiast = "Lisa Simpson"

numbers.each do |num|
  index = 0
  loop do
    sentence = number_enthusiast + " loves the number #{num}!"
    puts sentence

    index += 1
    break if index > 0
    end
end

# the loop is not necessary if we want to print a sentence with each number once
# loop is an iterator and so is each
# we only need 1 iterator here
puts

numbers = [1, 2, 3]
number_enthusiast = "Lisa Simpson"

numbers.each do |num|
  sentence = number_enthusiast + " loves the number #{num}!"
  puts sentence
end

puts

numbers = [1, 2, 3]
number_enthusiast = 'Lisa Simpson'

numbers.each do |num|
  index = 0
  loop do
    sentence = number_enthusiast + " loves the number #{num}!" # "Lisa Simpson loves the number 1"
    puts sentence

    index += 1
    break if index > 0
  end


end
# puts sentence # out of scope!

puts

numbers = [1, 2, 3]
number_enthusiast = 'Lisa Simpson'

numbers.each do |num|
  index = 0
  loop do
    sentence = number_enthusiast + " loves the number #{num}!" # "Lisa Simpson loves the number 1"
    puts sentence

    index += 1
    break if index > 0
  end

  # puts sentence # sentence is out of scope here
end

puts

first_name = 'Alice'
person1 = { name: first_name } # person1 = { name: 'Alice' }
person2 = person1              # person2 = { name: 'Alice' }

p person2[:name].upcase
p person1[:name]

puts
first_name = 'Alice'
person1 = { name: first_name }
person2 = person1

p person2[:name].upcase!
p person1[:name]

puts


def say_hi
  puts 'Hello!'
end

greeting = say_hi # return nil, output "Hello!"
word = ''

if greeting # evaluates as false (because it's pointing to `nil`)
  word = 'Something'
elsif greeting == false
  word = 'Something else'
else
  word = greeting
end

p "Wow" if word