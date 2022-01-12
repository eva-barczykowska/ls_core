# Create a simple tip calculator. The program should prompt for a bill amount and
# a tip rate. The program must compute the tip and then display both the tip and
# the total amount of the bill.

# - Inputs: bill amount and tip rate(how much tip we want to leave)
# - Output: display computed tip and the total amount of the bill
# - Algorithm:
# - ask for input
# - calculate tip percentage
# - add tip to the bill
# - display the tip and the bill amount

puts "What is the bill amount?"
bill_amount = gets.chomp.to_i

puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f / 100

puts "Here what they input"
tip_we_should_leave = bill_amount * tip_percentage
total_to_pay = bill_amount + tip_we_should_leave

puts "The tip is $#{tip_we_should_leave}."
puts "The total is $#{total_to_pay}."

# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0
