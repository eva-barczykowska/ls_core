# 1. For this practice problem, write a one-line program that creates the following
# output 10 times, with the subsequent line indented 1 space to the right:

10.times{ |number| puts " " * number + "The Flinstones Rock!" }


# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!


# 2. The result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# how to fix it?

puts "the value of 40 + 2 is " + "#{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s


# 3. Alan wrote the following method, which was intended to show all of the
# factors of the input number.
# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you make this work without using
# begin/end/until? Note that we're not looking to find the factors for 0 or
# negative numbers, but we just want to handle it gracefully instead of raising
# an exception or going into an infinite loop.

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  rescue
    p "It seems you've entered zero!"
  end until divisor == 0
  factors
end

p factors(10)

# Bonus 1
# What is the purpose of the number % divisor == 0 ?
# Allows you to determine if the result of the division is an integer number (no remainder).
# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method
# (the factors before the method's end)?
# We need to return the resulting array. If we don't, nil will be printed. Why?
# Does begin
#
# rescue ExceptionName
#
# end
# have their own scope?
# **********LS answer
# This is what is the actual return value from the method. Recall that without
# an explicit return statement in the code, the return value of the method is
# the last statement executed. If we omitted this line, the code would execute,
# but the return value of the method would be nil.

# 4. Alyssa was asked to write an implementation of a rolling buffer.
# Elements are added to the rolling buffer and if the buffer becomes full,
# then new elements that are added will displace the oldest elements in the buffer.
#
# She wrote two implementations saying, "Take your pick. Do you like << or + for
# modifying the buffer?". Is there a difference between the two, other than what
# operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Yes, there is a difference. While both methods have the same return value, in
# the first implementation, the input argument called buffer will be modified
# and will end up being changed after rolling_buffer1 returns. That is,
# the caller will have the input array that they pass in be different once
# the call returns. In the other implementation, rolling_buffer2 will not alter
# the caller's input argument.

# 5. Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
#  A user passes in two numbers, and the calculator will keep computing
#  the sequence until some limit is reached.
#
# Ben coded up this implementation but complained that as soon as he ran it,
# he got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Methods have their own scope. Methods are entirely self-contained in Ruby.
# This means the only way that the method can see the `limit` veriable is when
# it is passed as an argument
# Ben defines limit before he calls fib. But limit is not visible in the scope
# of fib because fib is a method and does not have access to any local variables outside of its scope.
#
# You can make limit an additional argument to the definition of the fib method
# and pass it in when you call fib.

# 6. What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# 7. One day Spot was playing with the Munster family's home computer and he
# wrote a small program to mess with their demographic data:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could
# stop him, he hit the Enter key with his tail:
p mess_with_demographics(munsters)
# Did the family's data get ransacked? Why or why not?

# The age and gender of each family member changed becasue =[] is not a mutating method.

# YES. Remember that in Ruby, what gets passed to a method isn't the value of the
# object. Under the hood, Ruby passes the object_id of each argument to the method.
#  The method stores these object_id's internally in locally scoped (private to the method)
#  variables (named per the method definition's parameter list).

# So Spot's demo_hash is pointing to the munsters hash. In this case,
# the program does not create a new hash for the result -- it just uses
# the existing hash as-is. So the actual hash object that is being messed with
# inside of the method IS the munsters hash.

# 8. Method calls can take expressions as arguments. Suppose we define a method called
# rps as follows, which follows the classic rules of rock-paper-scissors game:
# it returns the winning fist or, in the case of a tie, the fist that both players played.

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the followign call?
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# 9. Consider these 2 simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of this method invocation?
p bar(foo)
