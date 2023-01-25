# Sum of Digits
# Write a method that takes one argument,
# a positive integer, and returns the sum of its digits.

def sum(int)
  int.digits.sum
end
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

puts

def sum(int)
  result = 0
  int.to_s.chars.each do |ch| # each returns its caller, the caller is int.to_s.chars
    result += ch.to_i
  end # so we need to specifically return result after we've exited the block, otherwise it won't work
end
p sum(23) == 5
p sum(496) == 19
p sum(123_456_789) == 45

puts

def sum(int)
  result = 0
  int.to_s.chars.each do |ch| # each returns its caller, the caller is int.to_s.chars
    result += ch.to_i
  end # so we need to specifically return result after we've exited the block, otherwise it won't work
  result # here! :-)
end
p sum(23) == 5
p sum(496) == 19
p sum(123_456_789) == 45

puts

def sum(int)
  res = []
  target_size = int.to_s.chars.size  # this has to be defined *
  while res.size < target_size
    arr = int.divmod(10)
    res << arr.pop
    int = arr.join.to_i  # we need to change the value of int in every iteration!
  end
  res.inject(:+)
end
p sum(23) == 5
p sum(496) == 19
p sum(123_456_789) == 45

# *
# this has to be defined *
# otherwise it will have an impact on the loop (look at line 7)
# integer value is changing!

# 1st iteration arr = [49, 6], adding 6 to res ==> res = [0, 6].
# 2nd iteration arr = [4, 9], adding 9 to res ==> res = [0, 6, 9].
# 3rd iteration arr = [0, 4], adding 4 to res ==> res = [6, 9, 4].

puts

def sum(int)
  target = []
  int.to_s.chars.each do |ch|
    target << ch.to_i
  end
  # target.inject(:+) -or-
  target.reduce(0) { |sum, number| sum + number }
end
p sum(23) #== 5
p sum(496) == 19
p sum(123_456_789) == 45