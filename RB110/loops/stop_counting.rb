# Stop Counting
# The method below counts from 0 to 4. Modify the block so that it prints the current number and stops iterating when
# the current number equals 2.
#
#   5.times do |index|
#   puts index
#   # ...
# end

5.times do |index| #times counts from 0 to self - 1 !!! #times counts from 0 to self - 1 !!!
  puts index
  break if index == 2
end

#Further exploration
# How many numbers will be printed?

5.times do |index|
  puts index
  break if index == 4
end

#5

# and now?
# 1
5.times do |index|
  puts index
  break if index < 7
end