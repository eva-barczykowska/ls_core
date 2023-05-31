# Say Hello
# Modify the code below so "Hello!" is printed 5 times.
#
# say_hello = true
#
# while say_hello
#   puts 'Hello!'
#   say_hello = false
# end

say_hello = true
counter = 1

while say_hello
  puts 'Hello!'
  counter += 1
  if counter > 5
    say_hello = false
    end
end