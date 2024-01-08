# line 2 should mutate the argument array since I'm using destructive version of map, why isn't it?
def string_to_integer(str)
  str.chars.map!.with_index do |_, index| #ask about the return value of this, why the arg is not mutated
    index + 1
  end

  str
end

p string_to_integer('4321') #== 4321 #works for the first one but not the second one coz logic was wrong
# string_to_integer('570') == 570

# I am sure that if I tell you that I've provided a solution below, you couldn't care less. This is because you are not
# tempted to see the answer before trying to come up with a solution problem yourself. But if you are, resist it.
# When you're done (solving the problem that is, not resisting!), scroll down.
# ANSWER
# First chars is called on str and that already returns a new object, can array and since this point it's not possible
# to mutate the original string object str. It's true that the destructive map! is called but it's called on another
# object, it's called on the array that str.chars returned.
# We know that map transforms the array argument according to the return value of the block, and this is what happens,
# we can see that [1, 2, 3, 4] is returned.
#
# However, if we want to use that array further, we need to capture the return value of calling #chars on str.
# Like so
puts "capturing"
def string_to_integer(str)
  arr = str.chars.map!.with_index do |_, index| #ask about the return value of this, why the arg is not mutated
    index + 1
  end

  arr
end

p string_to_integer('4321') #== 4321 #works for the first one but not the second one coz logic was wrong
# string_to_integer('570') == 570

puts
# First test scenario is passing, the second isn't. Why?
def string_to_integer(str)
  arr = str.chars.map!.with_index do |_, index| #ask about the return value of this, why the arg is not mutated
    index + 1
  end
  arr = arr.reverse
  p arr
  index = -1
  ones_tens_hundreds_etc = 1
  int = 0

  loop do
    break if arr[index] == nil
    int += arr[index] * ones_tens_hundreds_etc
    index -= 1
    ones_tens_hundreds_etc *= 10
  end
  int
end

p string_to_integer('4321') == 4321 #works for the first one but not the second one coz logic was wrong
p string_to_integer('570') == 570

# ANSWER:
# Well, I coded this one without PEDAC, in a hurry and I enthusiastically jumped at the first idea I had
# I didn't analyze examples properly and didn't see that yes, my idea of using changing the str argument into
# an array and then transforming it to get the correct number which I will have to then JUST multiply to get ones,tens,
# hundreds, etc., well this idea was good but only for the first test case, lol.
# The code must be flexible, not just work for one test case, that's why there are so multiple test cases in Codewars.
# In essence, I need to ALWAYS get the right numbers, and this is what the hash is for:

REFERENCE = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6"=> 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10 }

def string_to_integer(str)
  integers_array = str.chars.map { |char| REFERENCE[char] }

  res = 0
  multiplier = 1
  loop do
    break if integers_array.empty?
    res += integers_array.pop * multiplier
    multiplier *= 10
  end
  res
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# The hash allows me to get the integers although this is only half job done.