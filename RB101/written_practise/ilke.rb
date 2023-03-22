# 1.You run the following code...

bootcamps = ['udemy', 'launchschool', 'codetree', 'coursera']
bootcamps['launchschool'] = 'great'

# and get the following error
# /usr/bin/ruby /Users/ewabarczykowska/ls_core/RB101/written_practise/ilke.rb
# /Users/ewabarczykowska/ls_core/RB101/written_practise/ilke.rb:4:in `[]=': no implicit conversion of String into Integer (TypeError)
# 	from /Users/ewabarczykowska/ls_core/RB101/written_practise/ilke.rb:4:in `<main>'
#
# What is the problem and how can it be fixed?

# 2. You run the following code and it produces an error. What is the problem and how to fix it?
day_of_the_week = Thursday
puts 'Today is #{day_of_the_week}.'

# 3. What does this code print? What does it return and why? What concept is represented here?
a = [1, 2, 3]
a.map { |x| puts x**2 }

# 4. What does this code print? What does it return and why? What concept is represented here?
def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

repeater('Hello')
# What is the problem and how can it be fixed?
#
#
# extra when we have time
# def merge(array_1, array_2)
#   array_1 | array_2
# end
#
arr1, arr2 = ['hello'], ['hello', 'world']
merged = merge(arr1, arr2)
merged[0][0] =
p merged
p arr1
p arr2

# Answers:
# 1. We are attempting to set the value of an element using a string as the key.
# Arrays are index with integers, not strings. We can change this code to
# bootcamps[1] = 'great'