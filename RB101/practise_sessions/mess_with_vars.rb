def mess_with_vars(one, two, three)
  one = two # local variable `one`
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"  # only has access to the main scope variable
puts "two is: #{two}"
puts "three is: #{three}"

puts

puts "****"

def mess_with_vars(one, two, three) # method parameters/local var
  p "method scoped"
  p one.object_id # method scoped local var `one` #60
  p two.object_id #80
  one = two # method scoped local variable `one`
  p one.object_id #80 coz now a points to where b is pointing
  two = three
  three = one
end

one = "one" # local var
two = "two"
three = "three"

p "main scoped"
p one.object_id # outer scoped local variable `"one"`

mess_with_vars(one, two, three)

puts "one is: #{one}"  # only has access to the main scope variable
puts "two is: #{two}"
puts "three is: #{three}"