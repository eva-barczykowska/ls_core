# REMEMBER to say
# the main scoped local variable
# the method scoped local variable
#
# OR, also possible
# outer scope variable
# inner scope variable  -- when you have only 2 variables(and not nested scope)

##################################################

# def say_hello
#   puts 'Hello, World'
# end

# 5.times { say_hello }
##################################################

# while true
#   name = 'bob'
#   break
# end

# puts name

##################################################

# name = 'bob'

# def display_greeting(name)
#   name = 'Hello ' + name #name is a method scope variable
#   puts name
# end

# display_greeting(name) #
# puts name              #

# On line 20 we are reassigning the method scoped variable to the result of
# concatenating string 'Hello' and the string referenced by the name variable.

###############################################################

# name = 'bob'

# def display_greeting(name)
#   name = 'Hello '.concat(name) # .concat mutates the CALLER!
#   puts name
# end

# display_greeting(name) #
# puts name              #

###############################################################

# name = 'bob'

# def display_greeting(name)
#   puts name.object_id
#   name = name << ' says Hi!'
#   puts name.object_id
#   puts name
# end

# display_greeting(name) #
# puts name              #

############################################################

# a = 'bob'
# b = a
# c = a << ' says hi!'

# puts a, b, c

# # a => 'bob'
# # b => 'bob'
# # c => 'bob says hi!'
##########################################################
