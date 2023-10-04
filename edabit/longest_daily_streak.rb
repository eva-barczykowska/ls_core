=begin
Create a function that takes an array of booleans that represent whether or not a player has logged into a game
that day. Output the longest streak of consecutive logged in days.

  Examples
daily_streak([true, true, false, true]) ➞ 2

daily_streak([false, false, false]) ➞ 0

daily_streak([true, true, true, false, true, true]) ➞ 3

Notes
Return your output as an integer.
  If a given array is all false, return 0 (see example #2).

P:
- write a method that takes an array of booleans as an argument
- the array represents whether a player has logged to play or not on a particular day
- the method outputs longest streak so the longest consecutive number of booleans TRUE
- if all booleans are false, method returns 0

E:
daily_streak([true, true, false, true]) == 2
=> 2 consecutive true
daily_streak([false, false, false]) == 0
=> no true at all
daily_streak([true, true, true, false, true, true]) == 3
=> 3 consecutive true

DS:
input: an array of booleans
output: an integer

A:
- iterate over the array input
- initialize `result` to 0
-initialize `temp` to 0
- while iterating if an element is true, add 1 to `temp` variable
- if not, store the value that `temp` is pointing to into `result` if the value is greater than what the `result` is
  pointing to right now
- and clear temp so that we can start counting from 0 again

- when iteration if over, return 1result

C:
=end
def daily_streak(arr)
  result = 0
  counter = 0
  temp = 0

  loop do
    if arr[counter] == true
      temp += 1
    else
      result = temp if temp > result
      temp = 0
    end

    counter += 1
    break if counter > arr.size
  end

  result
end

p daily_streak([true, true, false, true]) == 2
p daily_streak([false, false, false]) == 0
p daily_streak([true, true, true, false, true, true]) == 3

puts
=begin
solution with each

Notes: each
- initialize `result` and `counter`
- iterate over the array
- if the element at the current counter is true, add 1 to counter
- if not
1. add counter to result
2. point counter to 0
=end
def daily_streak(arr)
  counter = 0
  result = 0

  arr.each do |element|
    if element == true
      counter += 1
    else
      result = counter if counter > result
      counter = 0
    end
  end

  result
end
p daily_streak([true, true, false, true]) == 2
p daily_streak([false, false, false]) == 0
p daily_streak([true, true, true, false, true, true]) == 3