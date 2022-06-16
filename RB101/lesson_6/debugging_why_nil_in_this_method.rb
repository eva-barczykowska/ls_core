require 'pry'

def my_method(num)
  a = 1
  # binding.pry
  # b = 2
    # binding.pry
end

c = 3

my_method(c)

#c produces an error because it's outside the method so we are in a different scope
# binding can't access c, which is outside the method
# we didn't put binding pry on line 7 because this would affect running of our program.
# that's because calling pry method on binding returns nil!!!
# check the dubugging evens example
