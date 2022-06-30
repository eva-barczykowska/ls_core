# 1000 lights
# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them.
# You go back to the beginning, and on this pass 2, you toggle switches 2, 4, 6, and so on.
#  On the pass 3, you go back again to the beginning and toggle switches 3, 6, 9, and so on.
# On pass 4, you would toggle switches 4 and 8.
# On pass 5 you would toggle switches 5, 10, 15.
# You repeat this process and keep going until you have been through n repetitions.

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

# Write a method that takes one argument, the total number of rounds/passes, and returns an Array that
# identifies which lights are on after n repetitions.

# -the switch that I toggle corresponds to the round number(except the first round)
# -which toggles are changed? The multiples of the round number, so i.e.
# 2-2, 4, 6
# 3-3, 6, 9 etc.
# 4- 4, 8, 12

# Examples:
# Example with n = 5 lights:

# round 1: every light is turned on # all are ON
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on # 2, 4 have changed  -- 2nd pass even?
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on # 3 has changed -- 3rd pass
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on # 4 has changed -- 4th pass
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on # 5 has changed --5th pass
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4]

# Data Structures
# Input - Integer
# Hash
# Output - Array

# Algorithm
# -I will store the lights and their state in a hash
# -I have rounds to toggle switches
# -How many rounds? n number will tell me
# -create a round counter and iterate through the numbers according to how many rounds you have
# eg 5 rounds will be 5 iterations
# -each round I will need to take the round number and start toggling starting with this number and its multiples until the array size <= n argument
# -when I have finished all the rounds
# -key-value pairs for toggle number and whether that toggle is ON/OFF

# -iterate over this Hash
# -start with 2
# -iteration counter number is the number that you will multiply in order to know which switches to turn ON/OFF
# -once all the rounds are finished, see which lights (values) are ON and print the keys


# (1..4).each_with_object([]) { |i, a| a.push(i**2) } # => [1, 4, 9, 16]
# h.each_with_object({}) {|element, h| k, v = *element; h[v] = k }
# => {0=>:foo, 1=>:bar, 2=>:baz}

# Code
# def get_the_on_switches(n)
#   h = (1..n).each_with_object({}) { |element, h| h[element] = 'ON' }
#   p h
#   round = 2
#    while round <= n #2, 4
#     h.each do |k,v|
#       if h[k] == 'ON'
#         h[k] = 'OFF'
#       else
#         h[k] = 'ON'
#       end
#     rounds += 1
#     end
#   # p h
# end

# get_the_on_switches(5) == [1, 4]

# keys - 1,2,3,4,5
# if the key / round == 0



# Algorithm - Notes
# -I will store the lights and their state in a hash
# -I have rounds to toggle switches
# -How many rounds? n number will tell me
# -create a round counter and iterate through the numbers according to how many rounds you have
# eg 5 rounds will be 5 iterations
# -each round I will need to take the round number and start toggling starting with this number and its multiples until the array size <= n argument
# -when I have finished all the rounds
# -key-value pairs for toggle number and whether that toggle is ON/OFF

# # My Algorithm -- corrected after session with Allison
# -the method takes 1 argument, n, which signifies the number of rounds
#
# -the first round is when I create a hash with lights and their state, I will use a hash for this
# (Note - could use the each_with_object method to do that)
#
# -create a round variable, this variable will tell me which round we are currently on
#
# -the round variable will also indicate which key's value should be changed when I iterate over the hash
#
# # -iterate over the hash, starting from round 2 and in this round I am changing the value of keys which are same as the round number
#   plus themselves, e.g.
#   2, 2+2 = 4, 4 + 2 = 6, etc. until the n number is reached
#
# #when I iterate again, this will be the iteration 3, and in this round I am changing the value of keys which are the same as round number
#  plus themselves, e.g.
#  3, 3+ 3 = 6, 6 + 3 = 9, etc. until the n number if reached
#
# # my number of iterations is equal to the n number
#
# # When I iterate and find the correct key, I will ask if its value is ON. If it is, I will change it to OFF.
#   Coversely, if its value is OFF, I will change it to ON. I will use a conditional to ask what's the state of the switch.
#
# # -once all the rounds are finished, I will iterate over the resulting hash
#   and ask which values for which keys are pointin to 'ON' and this is what I will return.



# ------------------------------------------
# It looks like your challenge points right now are:
#  - Identifying the sub-problems within the problem.
#  - Your own algorithm structure.

# It might help you to complete your algorithm in iterations.
# On each iteration you will further break down problems into sub-problems.
#  - First iteration is 'general approach'
#  - Second iteration is 'high-level solution'
#  - Third iteration is 'mid-level solution'
#  - Fourth iteration is 'detailed-level solution'

# Second iteration - 'high-level solution':
# Create the hash structure: { 1: "ON", 2: 'OFF', ... }.
# Create an array out of the hash's keys whose values were 'ON'. (I want to use `values`).

# Third iteration - 'mid-level solution'
#  (we need to take the two above lines and further break them down.)
#   Create the hash structure: { 1: "ON", 2: 'OFF', ... }:
#     - Create an empty hash.
#     - Fill the hash with n keys whose values are all 'ON'
#     - Iterate over the hash
#        - If the current key is divisible by `round`
#           - Toggle the value in the key
#        - (Notes: n = 10, round 2, only keys of 2, 4, 6, 8 and 10 will get toggled)
#        - (Notes: n = 10, round 3, only keys of 3, 6, 9 will get toggled)
#        - (Notes: n = 10, round 4, only keys of 4 and 8 will get toggled)
#        - (Notes: n = 10, round 5, only keys of 5 and 10 will get toggled)
#        - (Notes: n = 10, round 6, only key of 6 will get toggled)
#        - (Notes: n = 10, round 7, only key of 7 will get toggled)
#        - (Notes: n = 10, round 8, only key of 8 will get toggled)
#        - (Notes: n = 10, round 9, only key of 9 will get toggled)
#        - (Notes: n = 10, round 10, only key of 10 will get toggled)
#     - End iteration

#   Create an array out of the hash's keys whose values were 'ON':
#     - Create an empty array.
#     - Iterate over the hash.
#         - If the value of the current key is 'on', push the key onto the array
#     - End iteration
#     - Return the array.

# round 3--
# {1: 'ON' 2: "OFF", 3: 'ON', 4: 'ON', 5: 'ON', 6: 'ON'}

# My Algorithm -- corrected after session with Allison
-the method takes 1 argument, `n`, which signifies the number of rounds

-create a `round` variable, this variable will tell me which round we are currently on, the initial value is 2

-the first round is when I create a hash with lights and their state, all 'ON'
(Note - could use the each_with_object method to do that), that is why I start the round counter from 2

-the `round` variable will also indicate which key's value should be changed when I iterate over the hash

 # -iterate over the hash, starting from round 2 and in this round I am changing the value of all keys which are same as the round number
   plus themselves, e.g.
   2, 2+2 = 4, 4 + 2 = 6, etc. until the n number is reached
   3, 3+ 3 = 6, 6 + 3 = 9, etc. until the n number if reached
   The numbers that are returned here each time will be keys whose state will be modified.

I will decide which keys' values need to be changed by checking if the number divided by the round number has no remainder

   -Once I have the keys that need to be modified, I will have to iterate over the keys and ask about each single one
    if its value is ON. If it is, I will change it to OFF.
    Coversely, the key's value is OFF, I will change it to ON. I will use a conditional to ask what's the state of the switch.

  # I will increase the round variable after each round of iteration + change of values

 -the keys will be symbols so I will need to change them to be Integer objects

-When I iterate and find the correct keys, I will have to iterate over the keys as well and ask about each single one
  if its value is ON. If it is, I will change it to OFF.
  Coversely, the key's value is OFF, I will change it to ON. I will use a conditional to ask what's the state of the switch.

# my number of iterations is equal to the n number

# -once all the rounds are finished, I will iterate over the resulting hash
  and ask which values for which keys are pointin to 'ON' and I will save the keys for the values which are 'ON'
  to a variable which I will ultimately retun.
