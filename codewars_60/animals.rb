animals = [
  'cat', 'dog', 'cat', 'cow', 'horse', 'lizard',
  'gecko', 'dog', 'cat', 'mouse', 'moose', 'moose',
  'bear', 'horse', 'cat', 'lizard', 'gecko', 'lizard',
  'lizard', 'gecko', 'cat', 'cat', 'bear', 'cat',
  'gecko', 'dog', 'cat', 'mouse', 'moose', 'moose',
  'lizard', 'gecko', 'cat', 'narwhal', 'bear', 'cat',
  'cat', 'dog', 'cat', 'cow', 'horse', 'lizard'
]


def count_the_animals(arr1, arr2)
  result = {}

  return result if arr1.empty?

  arr2.each { |animal| result[animal] = 0 if arr1.include?(animal) } # prepare the hash with the right keys - elements from arr2

  arr2.each{ |animal| result[animal] += arr1.count(animal) if result.key?(animal) }

  result

end

p count_the_animals([], ['cat', 'dog', 'narwhal']) == {}
p count_the_animals(animals, ['cat', 'dog', 'narwhal']) == {"cat"=>12, "dog"=>4, "narwhal"=>1}
p count_the_animals(animals, ['gecko', 'llama']) == {"gecko"=>5}
p count_the_animals([], []) == {}


puts
def count_the_animals(arr1, arr2)
  result = {}

  return result if arr1.empty?

  arr2.each { |animal| result[animal] = 0 if arr1.include?(animal) }

  arr2.each{ |animal| result[animal] = arr1.count(animal) if result.key?(animal) } # changed += to =

  result

end

p count_the_animals([], ['cat', 'dog', 'narwhal']) == {}
p count_the_animals(animals, ['cat', 'dog', 'narwhal']) == {"cat"=>12, "dog"=>4, "narwhal"=>1}
p count_the_animals(animals, ['gecko', 'llama']) == {"gecko"=>5}
p count_the_animals([], []) == {}

puts
def count_the_animals(arr1, arr2)
  result = {}

  return result if arr1.empty?

  arr2.each { |animal| result[animal] = arr1.count(animal) if arr1.include?(animal) } # if arr1 include elem from arr2, then count it in arr1,smart!

  result
end

p count_the_animals([], ['cat', 'dog', 'narwhal']) == {}
p count_the_animals(animals, ['cat', 'dog', 'narwhal']) == {"cat"=>12, "dog"=>4, "narwhal"=>1}
p count_the_animals(animals, ['gecko', 'llama']) == {"gecko"=>5}
p count_the_animals([], []) == {}

puts
puts "my solution"
=begin
# INTRODUCTIONS
- Name, Pronouns
- Where in the world you are
- Where in the curriculum you are
- Concept/Topic you're hoping we can cover today
- Is this your first SPOT session?

# DISCLAIMER
- Not a TA; fellow student
- You can skip/opt out of anything.
- struggling is hard but good!
- Not here to give answers, here to support each other and learn together

# AGENDA
ji Hea, she, NY, written 119: no questions
Ekerin, Chicago, written 119: practice!
Rakesh, Vancouver, getting back into 110, nested data structures
Ewa, Prague, 119 Interview: snippet
Uy, Tampa, written 119: practice
Gaurav 119 Written, starting back from break
Robyn, she, NY, written 119,
=end
=begin
P:
- write a method that takes 2 arrays
- method returns a has
- in the hash we have information how many times the second array elements appear in the first array
- take 2nd arg array and count how many times each element appears in the first element

E:
puts count_the_animals([], ['cat', 'dog', 'narwhal']) == {}
=> empty hash coz of [] (first arg array is empty)

puts count_the_animals(animals, ['cat', 'dog', 'narwhal']) == {'cat': 12, 'dog': 4, 'narwhal': 1}
=>

puts count_the_animals(animals, ['gecko', 'llama']) == {'gecko': 5}
=>

puts count_the_animals([], []) == {}

DS:
input: 2 arrays
middle: hash
output: hash

N:

A:
-initialize the `result` hash
- return {} if the 1st or both arrays are empty

- count elements from the first array and store results in a hash `animals_and_counts`
*more details here
- animal is key, count is value

- iterate over the 2nd array argument and if the element exists as a key in arr1, push both key and value from the
  `animals_and_counts` to the result hash


- return the result hash
=end

animals = [
  'cat', 'dog', 'cat', 'cow', 'horse', 'lizard',-
'gecko', 'dog', 'cat', 'mouse', 'moose', 'moose',
  'bear', 'horse', 'cat', 'lizard', 'gecko', 'lizard',
  'lizard', 'gecko', 'cat', 'cat', 'bear', 'cat',
  'gecko', 'dog', 'cat', 'mouse', 'moose', 'moose',
  'lizard', 'gecko', 'cat', 'narwhal', 'bear', 'cat',
  'cat', 'dog', 'cat', 'cow', 'horse', 'lizard'
]

def count_the_animals(arr1, arr2)
  return {} if arr1.empty? || arr1.empty? && arr2.empty?
  result = {}

  animals_and_counts = {}

  arr1.each do |animal|
    if animals_and_counts.key?(animal)
      animals_and_counts[animal] += 1
    else
      animals_and_counts[animal] = 1
    end
  end

  arr2.each do |animal|
    result[animal] = animals_and_counts[animal] unless animals_and_counts[animal].nil?
  end

  result
end
p count_the_animals([], ['cat', 'dog', 'narwhal']) == {}
p count_the_animals(animals, ['cat', 'dog', 'narwhal']) == {"cat"=>12, "dog"=>4, "narwhal"=>1}
p count_the_animals(animals, ['gecko', 'llama']) == {"gecko"=>5}
p count_the_animals([], []) == {}

puts
puts "with tally"

def count_the_animals(arr1, arr2)
  return {} if arr1.empty? || arr1.empty? && arr2.empty?
  result = {}

  animals_and_counts = arr1.tally

  arr2.each do |animal|
    result[animal] = animals_and_counts[animal] unless animals_and_counts[animal].nil?
  end

  result
end
p count_the_animals([], ['cat', 'dog', 'narwhal']) == {}
p count_the_animals(animals, ['cat', 'dog', 'narwhal']) == {"cat"=>12, "dog"=>4, "narwhal"=>1}
p count_the_animals(animals, ['gecko', 'llama']) == {"gecko"=>5}
p count_the_animals([], []) == {}

