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

Notes
# The syntax of a format sequence is as follows:

# %[flags][width][.precision]type

# 1439.divmod(60) => [23, 59] => "23:59"
# p format('%02d:%02d:%02d', 1, 59, 53)

Algorithm
-one day has 1440 mins
-if it is a 0, return time formatted as "00:00", user Kernel#format for that
-if it is other positive number less than 1439
-divmod the number by 60, this will give me hours and minutes. e.g. 1439.divmod(6) => [23, 59]
-now I need to display it nicely so

***The syntax of a format sequence is as follows: %[flags][width][.precision]type ***

Code
=end

MINUTES_PER_HOUR = 60 # we start by defining some useful constants
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR # the most important constant

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

=begin
-the solution is down to 3 operations
-the most difficult and interesting part of this code is NORMALIZING the
 argument so that we only have to deal with values that represent part of a single day
-once we've normalized the number of minutes, we can use Integer#divmod to know
 how many hours and minutes are represented by that value
-finally we use hours and minutes to format the time of the day

The fact that delta_minutes can be outside the range 0-1439 minutes makes this
problem more complex than it seems. However, if you think about the problem for
a few minutes, you may realize that there is something we can do to make our
job easier. We can normalize the number of minutes so that we only have to
deal with values that are positive but less than a full day: 0-1439.

Consider for instance, the time of day 3 minutes before midnight
(delta_minutes == 3). That's the same time of day as 1437 minutes after midnight
(MINUTES_PER_DAY - 3 == 1437). On the other hand, the time of day 1443 minutes
past midnight is the same as the time of day 3 minutes past midnight
(MINUTES_PER_DAY - 1440 == 3). The #normalize_minutes_to_0_through_1439 method
restricts each argument to this range without changing the expected results.

If delta_minutes is greater than or equal to 0, we can normalize it easily
enough by computing the remainder of dividing delta_minutes by MINUTES_PER_DAY,
which we do on line 10. Lines 6-8 won't have any effect on these values of
delta_minutes, so we should now have the normalized number of minutes.

If delta_minutes is less than 0, normalization is a little more complex, but
not by much. All we have to do is add 1440 minutes to the argument's value
repeatedly until the value is no longer negative. Thus, -2500 is normalized to
380 (-2500 + 1440 == -1060; -1060 + 1440 == 380; 380 >= 0). Once we have a
normalized value, we're done. We could return the value as-is at this point,
but we can simplify the code a bit by just treating the normalized value as a
normal non-negative value; it doesn't change anything, but eliminates extra code.
=end

puts ""

def time_of_day(n)
  format("%02d:%02d", (n / 60) % 24, n % 60) # first getting hrs, then rest of minutes and rest of seconds
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

puts ""

def time_of_day(time)
  if time >= 1440
    time = time % 1440
  elsif time < 0
    time = time.abs % 1440
    time = 1440 - time
  end

  hours, minutes = time.divmod(60)
  hours_mil = sprintf("%.2d", hours)
  minutes_mil = sprintf("%.2d", minutes)

  mil_time = "#{hours_mil}:#{minutes_mil}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

puts ""

def time_of_day(minutes)
  hour, minute = minutes.abs.divmod(60) # assigning 2 variables at the same time
  _, hour = hour.divmod(24) # minute are not significant here, hour is

  if minutes < 0
    current_hour, current_minute = [23, 60]
    hour = current_hour - hour
    minute = current_minute - minute
  end

  "#{format("%02d", hour)}:#{format("%02d", minute)}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

puts ""

DAY = 1440 # number of minutes in 1 day

def time_of_day(minutes)
  minutes = minutes % DAY #so -4231 % 1440 = 89(the remainder)
  p minutes #89 in case of argument -4231
  hour, minute = minutes.divmod(60) # getting hour and minute is what I will need to have for the format method
  p hour
  p minute
  format("%02d:%02d", hour, minute)
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

puts ""

def time_of_day(num)
 array = num.divmod(60) #-4231 % 60 = [-71,29](result of division gives me hours and remainder, minutes)
 p array
 array[0] = array[0] % 24 #gives me hour that I need, minutes are already there
 p array
 time_format(array)
end

def time_format(array)
  array.insert(1, 0) if array.last < 10 # padding with 0 for the minutes
  array.unshift(0) if array.first < 10 # padding with 0 for the hours
  p array
  array = array.join # joining to display as hours and mintues
  array.insert(2, ':') # adding the divider in the form of :
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

puts ""

def time_of_day(total_minutes)
  minutes = total_minutes % 60
  hours = (total_minutes / 60) % 24
  "#{format("%0.2d", hours)}:#{format("%0.2d", minutes)}"
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

puts ""

=begin
Further exploration 3
How would you approach this problem if you were allowed to use ruby's Date and
Time classes and wanted to consider the day of week in your calculation?
(Assume that delta_minutes is the number of minutes before or after midnight
between Saturday and Sunday; in such a method, a delta_minutes value of -4231
would need to produce a return value of Thursday 01:29.)
=end

def time_of_day(total_minutes)
  (Time.new(0, 1, 2) + (total_minutes * 60)).strftime("%A %H:%M")
end

p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"

#second time round
=begin
After Midnight (Part 1)
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

HINT
The Integer#divmod method and the % (modulo) operator may prove useful in your solution. You may also find Kernel#format handy for formatting your results.

You may want to solve this problem for non-negative arguments that are between 0 and 1439 first. Once you've done that, try handling arguments that are greater than 1439. Finally, solve it for negative values. Think about how you might be able to simplify the final two parts. (Hint: one day is 1440 minutes)
PEDAC
P:
- time of day can be represented as the number of minutes before or after midnight
- if the num of minutes is positive, the time is after midnight
- if negative, it's before midnight

- write a method that takes number of minutes and returns the time of day in a 24 hour format (hh:mm)
- the method should work with any integer format

E:
time_of_day(0) == "00:00"
=> "00:00" because 0 is a positive number so time is after midnight

time_of_day(-3) == "23:57"
=> negative input so before midnight hence the "23:57"

time_of_day(35) == "00:35"
=> "00:35" because 0 is a positive number so time is after midnight

time_of_day(-1437) == "00:03"
=> 24 hours is 1440 min, - means it's before midnight - how?

time_of_day(3000) == "02:00"
1440 - 3000 = 1560/60 = 26 / 24, 26%24 = 2

time_of_day(800) == "13:20"
=>
time_of_day(-4231) == "01:29"

DS:
input: integer
output: string, representing time in a 24 hour format

A:
- initialize MINUTES_PER_HOUR to 60
- initialize HOURS_PER_DAY to 24
- initialize MINUTES_PER_DAY to HOURS_PER_DAY * MINUTES_PER_HOUR

write 2 methods, 1 to normalize_minutes_to_0_through_1439
-if minutes is negative
add MINUTES_PER_DAY to min, eg. if minutes -3, I add += 1440 and I get 3, which then I just need to format

else I just modulo minutes % MINUTES_PER_DAY,
  e.g. 35%1440 = 35, then just format this output
      800%1440 = 800


  - 2nd method
  first
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR #1440

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0 # ~~notice while
    minutes += MINUTES_PER_DAY # this is what's getting returned
  end

  minutes % MINUTES_PER_DAY # this is what's getting returned
end
# time_of_day(0) == "00:00"
# 0-1440 = 0
# 0%1440 = 0
# 2nd method:
# hours, minutes = minutes.divmod(60) so 0.divmod(60)
# hours = 0
# minutes = 0
# ~~~~~~~~~~~~~~

# time_of_day(-3) == "23:57"
# -3 + 1440 = 1437
# 1437
# 2nd method:
# hours, minutes = minutes.divmod(60) so 1437.divmod(60)
# hours = 23
# minutes = 57
# ~~~~~~~~~~~~~~

# time_of_day(35) == "00:35"
# 35 % 1440 = 35
# 2nd method:
# hours, minutes = minutes.divmod(60) so 35.divmod(60)
# hours = 0
# minutes = 35
# ~~~~~~~~~~~~~~

# time_of_day(-1437) == "00:03"
# -1437 + 1440 = 3
# 3%1440 = 3
# 2nd method
# hours, minutes = minutes.divmod(60) so 3.divmod(60)
# hours = 0
# minutes = 3
# ~~~~~~~~~~~~~~

# time_of_day(3000) == "02:00"
# 3000%1440 = 120
# 2nd method
# hours, minutes = minutes.divmod(60) so 120.divmod(60)
# hours = 2
# minutes = 0
# ~~~~~~~~~~~~~~

# p time_of_day(800) == "13:20"
# 800%1440 = 800
# 2nd method
# hours, minutes = minutes.divmod(60) so 800.divmod(60)
# hours = 13
# minutes = 20
# ~~~~~~~~~~~~~~

# p time_of_day(-4231) == "01:29"
# -4231-1440=2791, 2791-1440=1351. 1351-1440=89
# 2nd method
# hours, minutes = minutes.divmod(60) so 89.divmod(60)
# hours = 1
# minutes = 29
# ~~~~~~~~~~~~~~

def time_of_day(minutes)
  minutes = normalize_minutes_to_0_through_1439(minutes)
  hours, minutes = minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

puts

#how do I rewrite this so that it makes more sense for me?
# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR #1440

#normalizing the argument so that we only have to deal with values that represent part of ONE DAY
def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0 # ~~notice while
    minutes += 1440
  end

  minutes % 1440 #returns the number of minutes as a positive integer
end

def time_of_day(minutes)
  minutes = normalize_minutes_to_0_through_1439(minutes)
  # Once we've normalized the number of minutes, we can use Integer#divmod to determine how many hours and minutes are represented by that value.
  hours, minutes = minutes.divmod(60)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

Notes:
# The % operator's interaction with negative values is confusing and difficult to remember, as described in the Introduction to Programming with Ruby Book. Because of that, we recommend not using % with negative numbers, but that you should first convert the negative values to positive numbers so you can write more explicit code. This problem is one such place where it's probably easier to take this approach.
