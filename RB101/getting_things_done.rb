# https://launchschool.com/exercises/9e40881a
# Getting Things Done
# We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo
# list, but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?

def move(n, from_array, to_array)
  to_array << from_array.shift(n)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

puts
# ls solution
# We want to stop as soon as we have moved n elements from one array to the other, i.e. when n == 0.
# The code we have added on line 2 of the solution tells Ruby to return from the method when that condition is met.
def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo #=> ['coffee with Tom']
p done #=> ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

puts

# Further Exploration
# What happens if the length of the from_array is smaller than n?
# -it removes whatever it can but then doesn't fail or inform in any way that it cannot remove other elements
# because they don't exist in the array
def move(n, from_array, to_array)
  if n > from_array.size
    puts "You seem to have done more things that you've planned!"
    puts "That's great but in order to move something to done, first you need to have it on the to-do list"
    puts "Kindly put it on the to-do list and try again."
    return
    end
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end


todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(5, todo, done)
move(3, todo, done)