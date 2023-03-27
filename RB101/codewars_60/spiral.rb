=begin
Feedback that i often give:
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

