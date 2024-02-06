=begin
P:
- move all exclamation marks to the end
- spaces after the exclamation marks get removed
- all other characters stay in place

E:
p move_exclamation_marks("Hi!") == "Hi!"
=> stays as it is

p move_exclamation_marks("Hi! Hi!") == "Hi Hi!!"
=> 2 !! moved to the end

p move_exclamation_marks("Hi! Hi! Hi!") == "Hi Hi Hi!!!"

p move_exclamation_marks("Hi! !Hi Hi!") == "Hi Hi Hi!!!"
p move_exclamation_marks("Hi! Hi!! Hi!") == "Hi Hi Hi!!!!"

DS:
input: str with exclamation marks in different indices
output: str with exclamation marks only in the end

A:
- transform str to array
- select !! and store in a separate array `ex_marks`
- remove all the !!!, and add to this array `exmarks`
- join on a space and return the str
=end

def move_exclamation_marks(str)
  arr = str.chars
  ex_marks = arr.select { |e| e == '!' }

  moved = arr.reject { |e| e == '!'} + ex_marks
  moved.join("")
end
p move_exclamation_marks("Hi!") == "Hi!"
p move_exclamation_marks("Hi! Hi!") == "Hi Hi!!"
p move_exclamation_marks("Hi! Hi! Hi!") == "Hi Hi Hi!!!"
p move_exclamation_marks("Hi! !Hi Hi!") == "Hi Hi Hi!!!"
p move_exclamation_marks("Hi! Hi!! Hi!") == "Hi Hi Hi!!!!"