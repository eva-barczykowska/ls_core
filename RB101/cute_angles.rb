# Cute angles
# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in degrees,
# minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (')
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
# -the floating point number represents the angle betweeen 0 and 360 degrees in degrees, minutes and seconds
# -return a STRING that represents that angle in degrees, minutes and seconds
# -use a degree symbol to represent degrees - (°)
# -use a single quote to represent minutes - (')
# -use a double quote to represent seconds - (")
#
# -use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07"

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
# of the angle
#
# Algorithm
# -if the argument is an integer, return the integer in the correct format,
# indicating degrees, minutes and seconds
# -if the argument is a float, there will be a few stages
(info above)
e.g. when the nubmer is 121.135
-save the number before the floating point into a variable `degrees`
-to calcuate minutes (hint above), mutliply the decimal portion of the figure
by 60 and save it to `minutes` variable
-to get minutes, take the remaining decimal and multiply it by 60, save it
to a variable `minutes`

# Examples
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")


puts "*****************"
puts "AJ"
