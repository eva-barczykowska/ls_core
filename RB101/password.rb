# The following code prompts the user to set their own password if they haven't
# done so already, and then prompts them to login with that password. However,
# the program throws an error. What is the problem and how can you fix it?
#
# Once you get the program to run without error, does it behave as expected?
# Verify that you are able to log in with your new password.

password = nil

def set_password(password)
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password #Ewa
end

password = set_password(password) #it was crucial to reassign password to the return value of the set_password method

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password(password)
