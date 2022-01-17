# ===INTEGER VALIDATION===
# OPTION 1
# This isn't perfect, however, because while "0" will return true, if
# we input "00", this method will return false.

def integer?(input) # this parameter has to be a string
  p input.to_i.to_s == input
end

integer?("33")
integer?("0")
integer?("00")

# OPTION 2
# \d regular expression to test against all digits.
# ^ means start of string, the + means "one or more" (of the preceding matcher),
# $ means end of string. Therefore, it has to be an integer, and a float, like
# 4.5 won't match. When there's a match, the match method will return
# a MatchData object, which will evaluate to true. When there's no match,
# it'll return nil, which will evaluate to false.

def integer?(input)
  /^-?\d+$/.match(input)
end

# OPTION 3
# use built-in conversion method. In Ruby, there's a method called Kernel#Integer
# that will convert parameters to the method into an integer object. It will,
# however, raise a TypeError if the input is not a valid integer, so
# you'll have to handle that. Note: yes, that's a capitalized method in Ruby
# -- fortunately, that doesn't happen often.
# Note: trailing rescue is a "code smell", so be aware of that. In this specific
# instance, it's ok, but don't fall into a habit of suppressing errors this way.

def integer?(input)
  Integer(input) rescue false
end

# ===NUMBER VALIDATION===
# OPTION 1
# We'll create a method that tests to see whether the input is
# either a number or a float.
def number?(input)
  integer?(input) || float?(input)
end

# We already have the integer? method, so all we need to do is implement a
# float? method.
# Option 1 -- just like before, this is the easiest way to check for floats.

def float?(input)
  input.to_f.to_s == input
end

# This method has an edge case though:
#   2.6.2 :001 > '1.' == '1.'.to_f.to_s
# => false
# 2.6.2 :002 > '1.'.to_f
# => 1.0
# As you can see, to_f converts 1. to 1.0, which
# does not match the original string.

# OPTION 2
# Option 2 -- use regex. This regex is similar to the regex in the integer?
# method, except we have to account for more possible formats. We can combine
# two validations to verify that the input is a valid float.
# The first validation verifies that there is at least one digit in the input.
# The second validation incorporates the * which stands for "zero or more",
# and the ? which stands for "zero or one". This validation can be read as
# "zero or more digits, followed by an optional period, followed by
# zero or more digits. This validation will accept all of these
# formats: 11.11, 11., .11, but not a period by itself. Notice that we had to
# prefix the . with a backslash. That is because . matches any single character
# in regex. By escaping it, we tell Ruby that we are looking for the actual
# period character.

def float?(input)
 /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

OPTION 3
# Option 3 -- use the Kernel#Float method, which is analogous to the
# Kernel#Integer method from earlier. Just like that method, Float also
# raises an exception if you don't give it a valid float, so you have
# to handle it. Note: trailing rescue is a "code smell", so be aware of that.
# In this specific instance, it's ok, but don't fall into a habit of
# suppressing errors this way.

def float?(input)
  Float(input) rescue false
end

# Of the 3 options, option 1 is probably easiest to follow.
# Using regex seems like a good idea, until you start to run into
# very subtle edge cases with it.
#
# One last thing to mention is that in programming, no matter what language
# you use, there's always the floating point precision problem. Be aware of
# that when dealing with large numbers, or working with the result of a division
# operation.

# === operation_to_message ===
# Our operation_to_message method is a little dangerous, because we're relying on
# the case statement being the last expression in the method. What if we needed
# to add some code after the case statement within the method? What changes
# would be needed to keep the method working with the rest of the program?

def operation_to_message(operation)
  word = case operation
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
         end

  x = "A random line of code"

  word
end

# If we wanted to add code after the case statement, we would need to save the
# return value of the case into a variable, then make sure to return that
# variable, or that variable must be the last line in the method.

# # === Extracting messages in the program to a configuration file. ===
# First, we'll have to reorganize our yml configuration a little bit to account
# for different languages. We'll nest the message keys under a top-level
# language, thereby organizing all the values. Here's an example:

# reorganizing the calculator_messages.yml

# en:
#   welcome: "Welcome to Calculator! Enter your name:"
#   valid_name: "Make sure to enter a valid name."
# es:
#   welcome: "Bienvenido a la calculadora! Entre su nombre:"
#   valid_name: "Asegúrese de entrar un nombre válido."
#
# Note that we're using two top-level keys here to distinguish between
# English messages and Spanish messages. We could have as many top-level keys
# as we want to -- one for each language our program supports.
#
# # Next, we have to study how this change affects our MESSAGES hash.
# # If we do a puts MESSAGES.inspect in our program, we'll see that it's
# # still a hash, except it's now a nested hash.
# This means we have to grab the language first, then the message.
# For example, we can get the Spanish welcome message like this:

MESSAGES['es']['welcome']# => Bienvenido a la calculadora! Entre su nombre:

# Because we'll need the language key every time we reference the message,
# let's move that to a method we can call. That way, we can pass in the language
# to the method, which can then reference the MESSAGES hash.

# at top of file after initializing MESSAGES

def messages(message, lang='en')
  MESSAGES[lang][message]
end

# This means we can do this now in our programme:
# english
prompt(messages('welcome')) # => Welcome to Calculator! Enter your name:

# english
prompt(messages('welcome', 'en'))# => Welcome to Calculator! Enter your name:

# spanish
prompt(messages('welcome', 'es'))# => Bienvenido a la calculadora! Entre su nombre:

# The last piece is setting a default language for your program.

# top of calculator.rb

LANGUAGE = 'en'

# And finally, whenever you call the prompt, you can do this:
prompt(messages('welcome', LANGUAGE))

# If you think that's too verbose, you could move the code around a bit
# and modify the prompt method:

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

# now you can just do:
prompt('welcome')

# Now, when non-English users want to use your calculator, all they have to do
# is change the LANGUAGE setting, provided you have translated the
# messages for them already.
