# Why doesn't this code mutate str?
# this also won't mutate str[0].upcase!
str = 'apple'

str.each_char do |char|
  char.upcase!
end

# When each letter is iterated through using the .each_char method, you are actually creating new objects.
# You can see this by running this code
str.each_char do |char|
  puts char.object_id
end

puts
str.each_char do |char|
  puts char.upcase!.object_id
end

# Remember that String#[] and String#[]= are completely different methods
# String#chars and String#each_char behave in a different way
#
# String[0] = "c" will mutate original string
# str[0].upcase! will not
#
# puts

str[0].upcase! # this method is different from the one below !!!, this method will not mutate
# str[0] = str[0].upcase! # this method will mutate
puts str
