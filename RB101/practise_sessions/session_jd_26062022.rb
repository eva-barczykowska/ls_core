# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Example:

# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# Problem
# without modifying the original array, take the first element and move it to the last element

# Data
# input Array
# output new_array

# algorithm
# make a copy of the original array to a different object_id
# remove the first element from the copied array
# append it to the end


# def rotate_array(array)
#   copy_array = array.clone
#   copy_array.append(copy_array.shift)
# end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# [1, 2, 3, 4]

# [1,2] [1, 3] [1, 4] [2,3 ] [2,4] [3, 4]

# 1000 lights
# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them.
# You go back to the beginning, and on this pass 2, you toggle switches 2, 4, 6, and so on.
#  On the pass 3, you go back again to the beginning and toggle switches 3, 6, 9, and so on. on pass 4,
#  you would toggle switches 4 and 8.
#  On pass 5 you would toggle switches 5, 10, 15.
#  You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on # all are ON
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on # 2, 4 have changed  -- 2nd pass even?
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on # 3 has changed -- 3rd pass
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on # 4 has changed -- 4th pass
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on # 5 has changed --5th pass
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# 6 entered

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].
# round 1: every light is turned on # all are ON
# round 2: lights 2, 4 and 6 are now off; 1, 3, 5 are on # 2, 4, 6 have changed  -- 2nd pass
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on # 3 has changed -- 3rd pass
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on # 4 has changed -- 4th pass
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on # 5 has changed --5th pass
# round 6: lights 2, 3, and 5 are now off; 1 and 4 are on # 5 has changed --6th pass

# PEDAC
# Problem
# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them.

# You go back to the beginning, and on this pass 2, you toggle switches 2, 4, 6, and so on.

# On the pass 3, you go back again to the beginning and toggle switches 3, 6, 9, and so on.

# On pass 4, you would toggle switches 4 and 8. On pass 5 you would toggle switches 5, 10, 15.

# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that
# identifies which lights are on after n repetitions.

# -the switch that I toggle corresponds to the round number(except the first round)
# -which toggles are changed? The multiples of round number, so i.e.
# 2-2, 4, 6
# # 3-3, 6, 9 etc.
# # 4- 4, 8, 12

# Examples:
# Example with n = 5 lights:

# round 1: every light is turned on # all are ON
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on # 2, 4 have changed  -- 2nd pass even?
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on # 3 has changed -- 3rd pass
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on # 4 has changed -- 4th pass
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on # 5 has changed --5th pass
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# Data Structures
# Input - Integer
# Output - Array

# Algorithm
# -define the method `get_the_on_switches` and pass an `int` as a parameter
# -within the body of the method, create a hash with all the lights and their intial state as `on`
# -we have several rounds during which we toggle switches. How many rounds? Argument `n` indicates how many rounds.
# -initialize a `round_counter` variable and assign Integer 2 to it (first round was the creaton of the hash)
# -during the 2nd round iterate over the hash and ask which keys are divisible by 2 and its mutliples until the `n` number is reached
# -so e.g.if n = 8, we will ask which keys <=8 are divisible by 2. These will be keys 2, 4, 6, and 8.
# -Now we change the VALUES for those keys in the following way
# -if the value is `ON`, we change it to `OFF`. If the value is `OFF`, we change it to `ON`

# -we populate the hash with the new values
# -we increase the round_counter value
#
# -during the 3rd round we will do the same as during the 2nd but we will ask which keys <=8 are divisible by the round number, so 3.
# - and in this fasshion we go through all the rounds
#
# -when we have finished all the rounds, I have a hash with the final `ON` and `OFF` values
# -iterate over this Hash and ask which values for which keys are `ON`.
# The keys whose value is `ON` will be the return value of the method. The return value of the method will be an Array.


def get_the_on_switches(int)
  h = (1..int).each_with_object({}) { |element, h| h[element] = 'ON' }
  p h.keys
  round_counter = 2
  while round_counter <= int
    h.keys.each do |key, value| #this method does not take 2 arguments
      if key % round_counter == 0
        if h[value] == 'ON'
          h[value] = 'OFF'
        else
          h[value] ='ON'
        end
      else
        h[value] = h[value]
      end
    end
    round_counter += 1
  end
  h
end

p get_the_on_switches(5)
