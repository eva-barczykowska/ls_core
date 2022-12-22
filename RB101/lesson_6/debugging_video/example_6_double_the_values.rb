require 'pry'
require 'pry-doc'

def double_num(num)
  num * 2
end

arr = [1, 2, 3].map do |num|
  double_num(num)
  # binding.pry # be careful where you put this line because it can affect the output of your program, like here [nil, nil. nil] will be returned
end

p arr

# ruby example_6_double_the_values.rb in the Terminal
# executed 3 times to see the output [nil, nil, nil]
