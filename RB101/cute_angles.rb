# Cute angles
# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in
# degrees, minutes and seconds.
# You should use a degree symbol (°) to represent degrees, a single quote (')
# to represent minutes, and a double quote (") to represent seconds.
#
# A degree has 60 minutes, while a minute has 60 seconds.

# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Info from the link:
# The whole units of degrees will remain the same,
# (e.g., if your figure is 121.135 degrees longitude, start with 121 degrees).
# Multiply the decimal portion of the figure by 60 (e.g., .135 * 60 = 8.1).
# The whole number becomes the minutes (8).
# Take the remaining decimal and multiply it by 60 (e.g., .1 * 60 = 6).
# The resulting number becomes the seconds (6 seconds).
# Seconds can remain as a decimal if needed.
# Take your three sets of numbers and put them together,
# (e.g., 121°8'6" longitude would be equivalent to 121.135 degrees longitude).
#
#
# # Note: your results may differ slightly depending on how you round values,
# but should be within a second or two of the results shown.
# #
# # You should use two digit numbers with leading zeros when formatting
# the minutes and seconds, e.g., 321°03'07".
#
# You may use this constant to represent the degree symbol:
#
# DEGREE = "\xC2\xB0"
#
# Problem
# Rules: a degree has 60 minutes
#        a minute has 60 seconds
#
# -write a method that takes a floating point number as an argument
# -the floating point number represents the angle betweeen 0 and 360 degrees
#  in degrees, minutes and seconds
# -return a STRING that represents that angle in degrees, minutes and seconds
# -use a degree symbol to represent degrees - (°)
# -use a single quote to represent minutes - (')
# -use a double quote to represent seconds - (")
#
# -use two digit numbers with leading zeros when formatting
# the minutes and seconds, e.g., 321°03'07"
#DEGREE = "\xC2\xB0"

# Examples
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Data structures
# input: an integer or a floating point number
# output: a string formatted in the way that shows degrees, minutes and seconds
# of the angle. Two digits numbers (like minutes and seconds) should be
# represented with leading zeros

# Algorithm
# initialize `degrees` variable and save it to the return value of calling the to_i method on the input float
# initialize `temp_minutes` variable which points to the return value of the `-` method called on 2 arguments,
# the input flat and the variable `degrees`
# multiply `temp_minutes` by 60, the result will be a float, convert it to an integer
# multiply temp minutes by 60 and subtract minutes from the result, save the result to `temp_seconds` variable
# multiply temp_seconds by 60 and convert the float result to an integer number, save it to `seconds variable`
# now I have degrees, minutes and seconds
# display in the required format so the minutes and seconds have to be 2-digit
# use the degree special character, then ' for minutes and " for seconds
#
# Code
#
puts "my solution"

DEGREE = "\xC2\xB0"

def dms(float) # 76.73
  degrees = float.to_i
  puts "degrees is #{degrees}"
  temp_minutes = float - degrees # 76.73 - 76 = 0.730000000000004 -- I have a temp variable because I need it for later
  puts "temp_minutes is #{temp_minutes}"
  minutes = (temp_minutes * 60).to_i # 43
  puts "minutes is #{minutes}"
  temp_seconds = (temp_minutes * 60) - minutes # (0.730000000000004 * 60) - minutes = 43.80000000000024 - 43 = 0.8000000000002387
  puts "temp_seconds is #{temp_seconds}"
  seconds = (temp_seconds * 60).to_i # 48
  puts "seconds is #{seconds}"
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00") || %(254°35'59")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# puts
# puts "AJ's solution"
# DEGREE = "\xC2\xB0"
#
def dms(float) # 76.73
  conversion = { degrees: 0, minutes: 0, seconds: 0 }
  conversion[:degrees] = float.to_i # 76
  p "degrees:"
  p conversion[:degrees]
  temp_minutes = float - conversion[:degrees] # 76.73 - 76 = 0.73 -- I need temp_minutes for later, to have the decimal
  p "temp_minutes:"
  p temp_minutes
  conversion[:minutes] = (temp_minutes * 60).to_i # 0.73 * 60 =  43
  p conversion[:minutes] # 43
  p temp_minutes * 60 # 43.80000000000024
  temp_seconds = (temp_minutes * 60) - conversion[:minutes] # -- here I need temp_minutes (0.730000000000004 * 60) - 43)
  p "temp_seconds:"
  p temp_seconds
  conversion[:seconds] = (temp_seconds * 60).to_i
  degrees = conversion[:degrees] # Used to make formatting line shorter
  minutes = format("%02d", conversion[:minutes]) # Used to make formatting line shorter
  seconds = format("%02d", conversion[:seconds]) # Used to make formatting line shorter
  format(%(#{degrees}#{DEGREE}#{minutes}'#{seconds}"), conversion[:minutes],
         conversion[:seconds])
end

# p dms(30) #== %(30°00'00")
p dms(76.73) #== %(76°43'48")
# p dms(254.6) #== %(254°36'00")
# p dms(93.034773) #== %(93°02'05")
# p dms(0) #== %(0°00'00")
# p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

puts
puts "LS solution"
DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(float)
  total_seconds = (float * SECONDS_PER_DEGREE).round # get seconds and then go up from here, dividing
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE) # nice multiple assignment
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE) # same here
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end
# p dms(30) #== %(30°00'00")
p dms(76.73) #== %(76°43'48")
# p dms(254.6) #== %(254°36'00")
# p dms(93.034773) #== %(93°02'05")
# p dms(0) #== %(0°00'00")
# p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
