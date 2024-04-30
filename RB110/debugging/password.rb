# # 1. before
# password = nil

# def set_password
#   puts 'What would you like your password to be?'
#   new_password = gets.chomp
#   password = new_password
# end

# def verify_password(password)
#   puts '** Login **'
#   print 'Password: '
#   input = gets.chomp

#   if input == password # error is coming from here coz at this point is undefiled local variable
#     puts 'Welcome to the inside!'
#   else
#     puts 'Authentication failed.'
#   end
# end

# set_password unless password

# verify_password(password)

# 2. added argument to verify_password(password) but now I have another problem: invalid password. How can this be?
# password = nil

# def set_password
#   puts 'What would you like your password to be?'
#   new_password = gets.chomp
#   password = new_password
# end

# def verify_password(password)
#   p "Password that is saved is #{password.class}"
#   puts '** Login **'
#   print 'Password: '
#   input = gets.chomp

#   if input == password # error is coming from here coz at this point is undefiled local variable
#     puts 'Welcome to the inside!'
#   else
#     puts 'Authentication failed.'
#   end
# end

# set_password unless password

# verify_password(password)

# Error: Authentication failed. This is because the return value of calling `set_password` is not saved anywhere

# 3. after
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

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

password = set_password # I need to store the result of calling the method back to `password` (which is currently nil)
# the return value of set_password has to be stored in `password`, otherwise `password` is nil

# `password` is still pointing to nil, it's not nil BUT the returned value is not stored anywhere
set_password unless password

verify_password(password)
