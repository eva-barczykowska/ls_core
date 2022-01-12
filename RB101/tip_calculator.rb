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

tip_we_should_leave = bill_amount * tip_percentage
total_to_pay = bill_amount + tip_we_should_leave

puts "The tip is $#{sprintf("%1.2f", tip_percentage)}"
puts "The total is $#{sprintf("%1.2f", total_to_pay)}"

# from the docs: sprintf("%20.8f", 1234.56789) #=> "       1234.56789000"
# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0

# further exploration
# Our solution prints the results as $30.0 and $230.0 instead of the more usual
# $30.00 and $230.00. Modify your solution so it always prints the results with
# 2 decimal places.
# Hint: You will likely need Kernel#format for this.
