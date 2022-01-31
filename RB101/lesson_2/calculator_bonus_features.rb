# 1. Better integer validation
# a)
def integer?(input)
  input.to_i.to_s == input
end

b)
def integer?(input)
  /^-?\d+$/.match(input)
end

# c) Inbuild Integer validation

def integer?(input)
  Integer(input) rescue false
end

# 2. Number validation, only integers or floats

# a)
def number?(input)
  integer?(input) || float?(input)
end

def float?(input)
  input.to_f.to_s == input
end

# *edgecase:

2.6.2 :001 > '1.' == '1.'.to_f.to_s
=> false
2.6.2 :002 > '1.'.to_f
=> 1.0

# b)

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

# c)

 def float?(input)
  Float(input) rescue false
end

# 3. operation_to_message

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

# 4. extracting messages to a config file
# calculator_messages.yml
#
welcome: "Welcome to Calculator! Enter your name:"
valid_name: "Make sure to enter a valid name."
#
# # ... rest of file omitted for brevity

# ****

# # at the top of file calculator.rb
#
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Before continuing, check out what MESSAGES is. You can do so with
#   puts MESSAGES.inspect.
#
# If you did that, you should have seen that MESSAGES is a normal Ruby hash.
# The yaml gem
# parsed the contents of the yml file,
# and created a Ruby hashfor us.
#
# Now, all we have to do is replace all hard-coded strings with the key in
# the MESSAGES hash.

# replace this:
prompt("Welcome to Calculator! Enter your name:")

# with this:
prompt(MESSAGES['welcome'])
# Go ahead and replace all the prompt calls.
# Your program is now using a configuration file!

# 6. Internationalize the messages

# reorganizing the calculator_messages.yml

en:
  welcome: "Welcome to Calculator! Enter your name:"
  valid_name: "Make sure to enter a valid name."
es:
  welcome: "Bienvenido a la calculadora! Entre su nombre:"
  valid_name: "Asegúrese de entrar un nombre válido."

# then change this:
#
MESSAGES['es']['welcome']    # => Bienvenido a la calculadora! Entre su nombre:

# and finally this in calculator.rb
# at top of file after initializing MESSAGES

def messages(message, lang='en')
  MESSAGES[lang][message]
end

# Now we can do this in our program:
  # english
prompt(messages('welcome'))       # => Welcome to Calculator! Enter your name:

# english
prompt(messages('welcome', 'en')) # => Welcome to Calculator! Enter your name:

# spanish
prompt(messages('welcome', 'es')) # => Bienvenido a la calculadora! Entre su nombre:

# set default language:
# top of calculator.rb

LANGUAGE = 'en'

# and finally, whenever you call the prompt, you can do this:
prompt(messages('welcome', LANGUAGE))

# if you think it's too verbose, you can move the code around and modify the prompt method

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

# now you can just do:
prompt('welcome')
