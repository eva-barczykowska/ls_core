# You probably know the "like" system from Facebook and other pages.
# People can "like" blog posts, pictures or other
# items. We want to create the text that should be displayed next to such an item.
# Implement a function likes :: [String] -> String, which must take in
# input array, containing the names of people who like
# an item. It must return the display text as shown in the examples:
#
# likes [] // must be "no one likes this"
# likes ["Peter"] // must be "Peter likes this"
# likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
# likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
# likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"
#
# Problem:
# -method that returns different strings based size of the array
#
# DS:
# input: array, can be empty
# output: a string with element of the array interpolated
#
# Algorithm:
# -if an array is empty, return string "no one likes this"
# - if an array's size is 1, return string "array[0] likes this"
# - if an array's size is 2, return string "array[0] and array[1] like this"
# - if an array's size is 3, return string "array[0], array[1] and array[2] like this"
# - else an array's size is > 3, return string "array[0], array[1] and array.size other like this"

def likes(names)
  if names.empty?
    'no one likes this'
  elsif names.size == 1
    "#{names[0]} likes this"
  elsif names.size == 2
    "#{names[0]} and #{names[1]} like this"
  elsif names.size == 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end
end

p likes([])                                ==  'no one likes this'
p likes(['Peter'])                         ==  'Peter likes this'
p likes(%w[Jacob Alex]) == 'Jacob and Alex like this'
p likes(%w[Max John Mark]) == 'Max, John and Mark like this'
p likes(%w[Alex Jacob Mark Max]) == 'Alex, Jacob and 2 others like this'

# Amar
def likes(likers)
  return 'no one likes this' if likers.empty?

  if likers.size == 1
    "#{likers.first} likes this"
  elsif likers.size == 2
    "#{likers.first} and #{likers[1]} like this"
  elsif likers.size == 3
    "#{likers.first}, #{likers[1]} and #{likers[2]} like this"
  else
    "#{likers.first}, #{likers[1]} and #{likers.size - 2} others like this"
  end
end

p likes([])                                ==  'no one likes this'
p likes(['Peter'])                         ==  'Peter likes this'
p likes(%w[Jacob Alex]) == 'Jacob and Alex like this'
p likes(%w[Max John Mark]) == 'Max, John and Mark like this'
p likes(%w[Alex Jacob Mark Max]) == 'Alex, Jacob and 2 others like this'

# -write this in words, not in code because when the problem is more complex, it's going to be more difficult to come back and change strategy

# my idea with case
def likes(names) # unexpected output
  case names
  when names.empty?
    'no one likes this'
  when names.size == 1
    "#{names[0]} likes this"
  when names.size == 2
    "#{names[0]} and #{names[1]} like this"
  when names.size == 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end
end

p likes([]) #==  'no one likes this'
p likes(['Peter']) #== 'Peter likes this'
p likes(%w[Jacob Alex]) #== 'Jacob and Alex like this'
p likes(%w[Max John Mark]) #== 'Max, John and Mark like this'
p likes(%w[Alex Jacob Mark Max]) #== 'Alex, Jacob and 2 others like this'

puts
def likes(names) # unexpected output
  case names.size
  when 0
    'no one likes this'
  when 1
    "#{names[0]} likes this"
  when 2
    "#{names[0]} and #{names[1]} like this"
  when 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end
end

p likes([]) == 'no one likes this'
p likes(['Peter']) == 'Peter likes this'
p likes(%w[Jacob Alex]) == 'Jacob and Alex like this'
p likes(%w[Max John Mark]) == 'Max, John and Mark like this'
p likes(%w[Alex Jacob Mark Max]) == 'Alex, Jacob and 2 others like this'

puts 'with other case statement syntax'

def likes(names) # unexpected output
  case names.size
  when 0 then 'no one likes this'
  when 1 then "#{names[0]} likes this"
  when 2 then "#{names[0]} and #{names[1]} like this"
  when 3 then "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end
end

p likes([]) == 'no one likes this'
p likes(['Peter']) == 'Peter likes this'
p likes(%w[Jacob Alex]) == 'Jacob and Alex like this'
p likes(%w[Max John Mark]) == 'Max, John and Mark like this'
p likes(%w[Alex Jacob Mark Max]) == 'Alex, Jacob and 2 others like this'
