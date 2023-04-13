=begin

# An array of integers is a SPIRAL if the integers increase to a single max
# value, and then decreases down from there. Write a method that returns
# true if an array is a spiral, else return false.

=begin
Given an array of integers, check to see if the integers ascend, then descend. There can't be any other pattern. The peak must be a single integer. Return a boolean for whether the array qualifies.

Algorithm
Initialize a flag for if the spiral has peaked
Initialize a `previous` variable to the first number
Iterate through all the integers starting with the second
  If the current value is equal to the previous
    Return false
  If the spiral hasn't peaked
    Check if each integer is less than the previous
      If it is, set the flag that the spiral peaked
  If the spiral has peaked
    Check if each integer is greater than the previous
      If it is, return false
  Set previous to current integer
Return true
=end

def spiral(arr)
  peaked = false
  previous = arr[0]
  1.upto(arr.size - 1) do |i| # getting hold of the counter
    if arr[i] == previous
      return false
    elsif !peaked
      if arr[i] < previous
        peaked = true
      end
    elsif peaked
      if arr[i] > previous
        return false
      end
    end
    previous = arr[i] # updating what the previous is pointing to
  end
  true
end

p spiral([1,2,4,3,2,1]) == true
p spiral([1,2,4,6,4,2,1]) == true
p spiral([0,3,5,4,3,2,1]) == true
p spiral([0,3,5,5,4,3,2,1]) == false
p spiral([1,2,4,6,4,2,4]) == false
p spiral([1,5,4,6,4,2,1]) == false

puts
=begin
Feedback that i often give (Patrick Moran):
- Think of the interview as a presentation of your process; you want to make
it transparent what you're thinking and why, and also package it in a way
that is easy for them to understand and follow. While thinking, talk through
your solution process. Once you've settled on something, state it clearly,
and then type it out. Bite-sized ideas are great. Say a sentence or two about
 each line of algorithm or code that you type, before you type. Then type in
silence to give you and the interviewer a moment of silence to process.
- When testing as you code, Always communicate what you *expect* the code to do
*before* running the code. This demonstrates that you are in control of the
code
- Test as often as possible for each unique bit of code; err on the side of
testing too much
=end

# An array of integers is a SPIRAL if the integers increase to a single max
# value, and then decreases down from there. Write a method that returns
# true if an array is a spiral, else return false.

# p spiral([1,2,4,3,2,1]) == true
# p spiral([1,2,4,6,4,2,1]) == true
# p spiral([0,3,5,4,3,2,1]) == true
# p spiral([0,3,5,5,4,3,2,1]) == false
# p spiral([1,2,4,6,4,2,4]) == false
# p spiral([1,5,4,6,4,2,1]) == false

# PEDAC TEMPLATE
=begin
# ************** Problem **************
-write a method that decides if an array of integers is a SPIRAL
-SPIRAL means that the integers increase to a single maximum value and then
decrease from there

# Questions: Account for empty array?

# ************** Examples **************
p spiral([1,2,4,3,2,1]) == true
p spiral([1,2,4,6,4,2,1]) == true
p spiral([0,3,5,4,3,2,1]) == true

p spiral([0,3,5,5,4,3,2,1]) == false - because its no a single MAX value
p spiral([1,2,4,6,4,2,4]) == false because each consecutive descending num is not smaller
p spiral([1,5,4,6,4,2,1]) == false because ascending numbers are not in proper order

# ************** Data Structures **************
input: an array of numbers
output: a boolean value: true / false
# ************** Algorithm **************
-what's the max value in the array
-find out if the max value appears only once in the array
-if it appears more than once, return false
-find out if every number up to the max value is greater than the previous one
-find out if every number descending is less than the previous one
=end
# ************** Code **************

def ascending?(left_side)
  counter = 0
  while counter < left_side.size - 1
    unless left_side[counter] < left_side[counter + 1]
      return false
    end
    counter += 1
  end
  return true
end

def descending?(right_side)
  counter = 0
  while counter < right_side.size - 1
    unless right_side[counter] > right_side[counter + 1]
      return false
    end
    counter += 1
  end
  return true
end

def spiral(array)
  max_value = array.max

  max_value_count = array.count(max_value)
  return false if max_value_count > 1

  index_of_max_value = array.index(max_value)

  left_side = array.shift(array.index(max_value))
  right_side = array

  ascending?(left_side) && descending?(right_side) ? true : false

end

p spiral([1,2,4,3,2,1]) == true
p spiral([1,2,4,6,4,2,1]) == true
p spiral([0,3,5,4,3,2,1]) == true
p spiral([0,3,5,5,4,3,2,1]) == false
p spiral([1,2,4,6,4,2,4]) == false
p spiral([1,5,4,6,4,2,1]) == false

