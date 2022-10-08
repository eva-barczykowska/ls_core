=begin
After Midnight (Part 1)
The time of day can be represented as the number of minutes before or after
midnight. If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns
the time of day in 24 hour format (hh:mm).
Your method should work with any integer input.

You may not use ruby's Date and Time classes.

HINT
The Integer#divmod method and the % (modulo) operator may prove useful
in your solution. You may also find Kernel#format handy for formatting your results.

You may want to solve this problem for non-negative arguments that are
between 0 and 1439 first. Once you've done that, try handling arguments
that are greater than 1439. Finally, solve it for negative values.
Think about how you might be able to simplify the final two parts.
(Hint: one day is 1440 minutes)

PEDAC
Problem
-We get an integer that represents the number of minutes before or after midnight
-If the number of minutes is positive, the time is after midnight
-If the number of minutes is negative, the time is before midnight
-write a method that takes this number and returns the time in 24 hours format,
 so hh:mm
 - a day has 24 hours
 - 1 hour has 60 minutes

 Examples:
p time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

Data Structures:
-input: Integer
-output: String

Algorithm
-one day has 1440 mins
-if it is a 0, return time formatted as "00:00", user Kernel#format for that
-if it is other positive number less than 1439
-divmod the number by 60, this will give me hours and minutes. e.g. 1439.divmod(6) => [23, 59]
-now I need to display it nicely so

***The syntax of a format sequence is as follows: %[flags][width][.precision]type ***

Code
=end

def time_of_day(int)
  if int.zero?
    return "00:00"
  elsif int > 0 && int < 1140
    time = int.divmod(60)
    return "#{time[0]}:#{time[1]}"
  end
end

p time_of_day(0) #== "00:00"
# time_of_day(-3) == "23:57"
p time_of_day(35) #== "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
p time_of_day(800) #== "13:20"
# time_of_day(-4231) == "01:29"
