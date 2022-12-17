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
# -if the argument is an integer, return the integer in the correct format,
# indicating degrees, minutes and seconds
# -if the argument is a float, there will be a few stages
# (info above)
# e.g. when the number is 121.135
# -save the number before the floating point into a variable `degrees`
# -to calcuate minutes (hint above), mutliply the decimal portion of the figure
# by 60 and save it to `minutes` variable
# -how will I get the decimal portion of the number?
# 121.135 - convert it to a string and split it on a dot, prepend a zero
# and finally insert a dot after zero, this will give me a floating point number
# -write a method for this?
# -to get minutes, take the remaining decimal and multiply it by 60, save it
# to a variable `minutes`
# -repeat the process above to get seconds
# -lastly, format the string to the desired output

DEGREE = "\xC2\xB0"

# def integer?(number)
#   number.instance_of?(Integer)
# end

# def dms(float)
#   degrees = float.to_i
#
#   minutes = float.to_s.split('.')[1].to_i # gives the decimal part of the number as the 2nd element in the array -- to calculate minutes
#   # minutes = ((minutes.to_f - float) * 60) # dividing by 100.00 to get the decimal float, multiplying by 60 to get the minutes
#   minutes = ((float - degrees) * 60).to_i
#   p minutes
#   seconds = ((float - minutes) * 60).to_i
#   p seconds


  # seconds = minutes.to_s.split(".") # gives me the remaining decimal part the as the 2nd element of the array -- to calculate seconds
  # # p seconds
  # # seconds = ((seconds[1].to_i / 10.00) * 60).to_i
  #
  # minutes = minutes.to_i # I get get rid of decimal part after extracting seconds out of it on the 2 previous lines

  # format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# p dms(30) #== %(30°00'00")
# p dms(76.73) #== %(76°43'48")
# p dms(254.6) #== %(254°36'00")
# p dms(93.034773) #== %(93°02'05")
# p dms(0) #== %(0°00'00")
# p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

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
