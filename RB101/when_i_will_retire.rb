
# Build a program that displays when the user will retire and how many years she
# as to work till retirement. HINT: use Time class from Ruby library
# input:
# - user age
# - the date at which they want to retire
# output:
# - time now
# - how many years left to retire
# algorithm:
# - take user input for his/her age
# - take input for when they want to retire
# - calculate the time now
# - calculate the difference between the time now and the time when they want
#   to retire
# - display the time now and the difference (i.e. how many years left)

def prompt(message)
  puts "=> #{message}"
end
prompt("What is your age?")
current_age = gets.chomp.to_i

prompt("At what age would you like to retire?")
retirement_age = gets.chomp.to_i

t = Time.now
current_year = t.year
years_to_wait = retirement_age - current_age
year_of_retirement = current_year + years_to_wait

puts "It's #{current_year}. You will retire in #{year_of_retirement}."
puts "You have only #{years_to_wait} years to go!"
# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
