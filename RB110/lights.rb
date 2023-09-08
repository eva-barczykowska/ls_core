# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them.
# You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on.
#
# On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on.
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches,
# and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].
# PEDAC
# ************** Problem **************

# -every time I pass, I start with the next number
# -pass 0 - I start with switch 0
# -pass 1 -I start with the switch 1
# -pass 2 -I start with the switch 2

# -every other switch from the starting one is supposed to be toggled

# -I toggle its state, so if the switch is ON, I make it OFF
# -if it is OFF, I make it on
# ************** Examples **************
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# 1 [1, 2, 3, 4, 5]
# 2 [1, (2), 3, (4), 5]
# 3 [1, (2), (3), (4), 5]
# 4 [1, (2), (3), 4, 5]
# 5 [1, (2), (3), 4, (5)] => [1, 4]



# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# ************** Data Structures **************
# Input:integer
# Medium: hash
# Output:an array

# ************** Notes **************
# ************** Algorithm **************
# -make a hash with n keys and all values as ON but the first key should be 1
# -you either toggle OFF even or odd numbers, starting with even
#
# so even, odd, even, odd, even odd until n passes are made but we move on by 1 light
#
# n times do this/or do this while starting_light <= n
# start with the second light
# iterate over the even keys
# toggle off the even_numbered lights
# increase the starting light
# then iterate over the odd keys starting from the starting light
# toggle off the odd-numbered lights

# ************** Code **************
# ************** Refactor **************
# 1 [1, 2, 3, 4, 5] () -- ALL ON
# 2 [1, (2), 3, (4), 5] -- started with light 2 and made OFF 2nd and 4th light - iteration 1
# 3 [1, (2), (3), (4), 5] -- started with light 3 and made OFF 3rd
# 4 [1, (2), (3), 4, 5] -- started with light 4 and made it ON (it was OFF)
# # 5 [1, (2), (3), 4, (5)] -- started with light 5 and made it OFF
# 5 [1, (2), (3), 4, (5)] => [1, 4]
#
# def toggle_lights(n)
#   hsh = {}
#   n.times do |number|
#     hsh[number + 1] = "OFF"
#   end
#
#   light_number = 2
#   start_from = 2
#
#   while start_from <= n
#
#     while light_number <= hsh.keys.last
#       if hsh[light_number] == "ON"
#         hsh[light_number] = "OFF"
#       else
#         hsh[light_number] = "ON"
#       end
#       light_number += 2
#     end
#     p "hash is now #{hsh}"
#
#     start_from += 1
#     light_number = start_from + 1
#     p "start from is now #{start_from}"
#     p "light to toggle is now #{light_number}"
#   end
#   hsh
#   # hsh.select { |_, v| v == "ON" }.keys
# end

# p toggle_lights(5) #== [1, 4]
# p toggle_lights(10) #== [1, 4, 9]
# 1 2 3 4 5 6 7 8 9 10 first pass - ALL ON
# 1 (2) 3 (4) 5 (6) 7 (8) 9 (10)- starting with 2, even OFF - iteration 1
# 1 (2) (3) (4) (5) 6 (7) (8) (9) (10) - starting with 3, odd
# 1 (2) (3) 4 5 (6) 7 8 (9) 10 - starting with 4, even
# 1 (2) (3) 4 (5) (6) (7) 8 9 10 - starting with 5, odd
# 1 (2) (3) 4 (5) 6 (7) (8) 9 (10) - starting with 6, even
# 1 (2) (3) 4 (5) 6 7 (8) (9) (10) - starting with 7, odd
# 1 (2) (3) 4 (5) 6 7 8 (9) 10 - starting with 8, even
# 1 (2) (3) 4 (5) 6 7 8 9 10 - starting with 9, odd
# 1 (2) (3) 4 (5) 6 7 8 9 (10) - starting with 10, even -- this is giving incorrect result, I must have misunderstood
#
# what if the toggle starts always by 1 more but the toggle is multiple of the starting number?
# 1 2 3 4 5 6 7 8 9 10 first pass - ALL ON
# 1 (2) 3 (4) 5 (6) 7 (8) 9 (10)- starting with 2 - iteration 1 - 2, 4, 6, 8, 10
# 1 (2) (3) (4) 5 6 7 (8) (9) (10)- starting with 3 iteration 2 - 3, 6, 9
# 1 (2) (3) 4 5 6 7 8 (9) (10)- starting with 4 - iteration 3 - 4, 8
# 1 (2) (3) 4 (5) 6 7 8 (9) 10- starting with 5 - iteration 4 - 5, 10
# 1 (2) (3) 4 (5) (6) 7 8 (9) 10- starting with 6 - iteration 5 - 6
# 1 (2) (3) 4 (5) 6 (7) 8 (9) 10- starting with 7 - iteration 6 - 6
# 1 (2) (3) 4 (5) 6 (7) (8) (9) 10- starting with 8 - iteration 7 - 8
# 1 (2) (3) 4 (5) 6 (7) (8) 9 10- starting with 9 - iteration 8 - 8
# 1 (2) (3) 4 (5) 6 (7) (8) 9 (10)- starting with 10 - iteration 9 - 10 -- uff, all clear now...
#
# A:
# create a hash with keys 1 to n
#
# outer loop:
# initialize starting_light to int 2
# initialize `multiplicator` the number to multiply by - 2, 4, 6, 8, etc.
# while the starting light is less the argument - 1
#
# inner loop:
# initialize iterator to int 2
# iterate over the hash
# if the value for the current iterator is OFF, make it ON,
# else if it is ON, make it OFF
# increase the iterator by its own value
# end inner loop
#
# increase the starting_light by 1, we need to move on by 1 light until we reach the last light
# increase multiplicator by 1, the number we multiply by (2, 4, 6, 8) increases by 1, so if it was 2, now it will be 3 (3, 6, 9)
# assign iterator to starting_light - we need iterator to retrieve the correct value from the hash and then potentially change it
# end
#
# iterate over the hsh, select only the keys for which the value is "ON"
def toggle_lights(n)
  h = {}
  n.times { |number| h[number + 1] = "ON" }

  starting_light = 2
  multiplicator = 2
  iterator = 2

  while starting_light <= n
    while iterator <= n
      if h[iterator] == "ON"
        h[iterator] = "OFF"
      else
        h[iterator] = "ON"
      end
      iterator += multiplicator
    end
    starting_light += 1
    multiplicator += 1
    iterator = starting_light
  end
  h.select { |_, v| v == "ON"}.keys
end

p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]

