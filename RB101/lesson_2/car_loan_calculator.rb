# Build a car loan calculator. You'll need three pieces of information:
# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

def prompt(message)
  puts "==> #{message}"
end

prompt("Please enter the loan amount you'd like to borrow")
loan_amount = gets.chomp.to_i
prompt("Please enter the annual interest rate")
annual_interest_rate = gets.chomp.to_f / 100
prompt("How many years do you want to pay this loan for?")
loan_duration_in_years = gets.chomp.to_i

# From the above, you'll need to calculate the following things:
# monthly interest rate
# loan duration in months
monthly_interest_rate = annual_interest_rate / 12.0
loan_duration_in_months = loan_duration_in_years * 12
# monthly payment
# You can use the following formula:
# m = p * (j / (1 - (1 + j)**(-n)))
monthly_payment = loan_amount * (monthly_interest_rate / (1 \
                  - (1 + monthly_interest_rate)**(-loan_duration_in_months)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months
# use meaningful variable names
puts "Your montly payment will be #{monthly_payment.ceil(2)}"
# Hints:
# Figure out what format your inputs need to be in. For example, should
# the interest rate be expressed as 5 or .05, if you mean 5% interest?
# If you're working with Annual Percentage Rate (APR), you'll need to convert
# that to a monthly interest rate.
# Be careful about the loan duration -- are you working with months or years?
# Choose variable names carefully to assist in remembering.
