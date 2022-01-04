if true
  puts 'hi'
else
  puts 'bye'
end

if false
  puts 'hi'
else
  puts 'bye'
end

# In real code, you won't use the true or false objects directly in a conditional.
# Instead, you'll likely be evaluating some expression or method call in a conditional.
 # Whatever the expression, it should evaluate to a true or false object

 num = 5

if (num < 10)
  puts "small number"
else
  puts "large number"
end

# example code
# name = find_name   # checking here if name is false, it will shorcircuit immediately
#
# if name && name.valid?
#   puts "great name!"
# else
#   puts "either couldn't find name or it's invalid"
# end

# The if conditional above is checking that name is not nil,
# then checking the validity of name. It's doing this by relying on the && short
# circuit behavior to not execute name.valid? if name is nil.
# Remember that && short circuits if it encounters a false, and nil is considered "falsy".
