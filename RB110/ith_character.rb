=begin
Given a string and an integer i, write a method that splits the string up into a sentence of strings, where each string in the sentence contains a character of the argued string and every ith character after it:

p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("abcde", 100) == "a b c d e"
p fragment("", 1) == ""

PEDAC:
P:
- write a method that takes 2 args, a string and an int
- the method splits the str into a sentence of strings, where each string in the sentence contains:
 a character of the arg string and every -ith character after it

 - for each char that we have in the string, we return that character and the ith char after

E:
p fragment("abcde", 1) == "abcde bcde cde de e"
=>abcde, 1, bcde, 1, cde, 1, de, 1, e => cut off the first letter from the string

p fragment("a b c d e", 2) == "ace bd ce d e"
first chracter and every second char after
=>a => ace
=>b => bd
=>c => ce
=>d => d
=>e => e

  # "abcde"
  #  01234
  # ace - bd - ce - e

p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
=>"mary had a little lamb"

p fragment("abcde", 0) == "i cannot be less than 1"

p fragment("abcde", 100) == "a b c d e"

p fragment("", 1) == ""

DS
input: str, int
middle: array
output: str

N:
gsub

A:
- return "" if str is empty
- return "i cannot be less than 1" if str.size is 1
- if there are spaces in str, get rid of them

- change str into arr

- initialize `final` array, final result will be stored
- initialize `temp` str where temporary str will be stored while doing the outer + inner iteration
- initialize `outer_counter` and `inner_counter`

- start outer loop
- break when `outer_counter` is greater or equal to the arr size
- append to `temp` str the char at the current counter

  - start inner loop
  - break when `inner_counter`is greater or equal to arr size
  - append to temp str the char at the current `inner_counter` - this is our -ith character
  - increase ther `inner_counter` by int/2nd argument/-ith char that you want to retrieve
  - end inner loop

- append `temp` that you retrieved from running outer loop + inner loop to `final`
- reassign `temp` to '' coz we need to start next iteration from scratch
- increase `outer_counter` by 1
- reinitialize `inner_counter` the result of `outer_counter` (coz we need to start with the next letter_now) + `int` (coz we need the -ith character)

- return `final` array converted into a str
=end

def fragment(str, int)
  return "" if str.empty?
  return "i cannot be less than 1" if int == 0

  str = str.gsub!(" ", "") if str.include?(" ")
  arr = str.chars

  final = [] # this will be my final string

  temp = '' # this is temporary string after every inner + outer iteration
  outer_counter = 0
  inner_counter = int

  loop do
    break if outer_counter >= arr.size
    temp << arr[outer_counter] # this adds the starting letter
    loop do
      break if inner_counter >= arr.size
      temp << arr[inner_counter] # this adds the inner letters to the starting letter
      inner_counter += int # skipping letters and adding only -ith character
    end
    p "the result of this outer + inner iteration is ---#{temp}"
    final << temp # append result of inner+ outer iteration to the result string and then, start from scratch
    temp = '' # start from scratch
    outer_counter += 1 # once done with the first letter, go to the next one
    inner_counter = outer_counter + int # inner counter changes because outer counter changes - increase the inner counter by the argument integer
  end
  final.join(" ")
end

p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 100) == "a b c d e"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("", 1) == ""

puts
puts "clean and refactor"
=begin
- return "" if str is empty
- return "i cannot be less than 1" if str.size is 1
- if there are spaces in str, get rid of them

- change str into arr

- initialize `final` array, final result will be stored
- initialize `temp` str where temporary str will be stored while doing the outer + inner iteration
- initialize `outer_counter` and `inner_counter`

- start outer loop
- break when `starting_letter` is greater or equal to the arr size
- append to `temp` str the char at the current counter

  - start inner loop
  - break when `ith_char`is greater or equal to arr size
  - append to temp str the char at the current `ith_char` - this is our -ith character
  - increase ther `ith_char` by int/2nd argument/-ith char that you want to retrieve
  - end inner loop

- append `temp` that you retrieved from running outer loop + inner loop to `final`
- reassign `temp` to '' coz we need to start next iteration from scratch
- increase `starting_letter` by 1
- reinitialize `ith_char` the result of `starting_letter` (coz we need to start with the next letter_now) + `int` (coz we need the -ith character)

- return `final` array converted into a str
=end
def fragment(str, int)
  return "" if str.empty?
  return "i cannot be less than 1" if int == 0

  str = str.gsub!(" ", "") if str.include?(" ")
  arr = str.chars

  final = []

  temp = ''
  starting_letter = 0
  ith_char = int

  loop do
    break if starting_letter >= arr.size
    temp << arr[starting_letter]
    loop do
      break if ith_char >= arr.size
      temp << arr[ith_char]
      ith_char += int
    end
    final << temp
    temp = ''
    starting_letter += 1
    ith_char = starting_letter + int
  end
  final.join(" ")
end

p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 100) == "a b c d e"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("", 1) == ""

# Kim's idea - won't work
# str = "abcde" # => with integer 2, expected "ace bd ce d e"
# temp << str.chars.each_with_index.select { |i| i % int == 0 }
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "a" -- OK
# index 1 -- 1 % 2 == 1 - takes char at index 1, which is "b" -- NOT OK
# index 2 -- 2 % 2 == 0
# index 3 -- 3 % 2 == 1
# index 4 -- 4 % 2 == 0

# temp << str.chars.each_with_index.select { |i| i % int != 0 }
# index 0 -- 0 % 2 == 0
# index 1 -- 1 % 2 == 1 - takes char at index 1, which is "b" -- NOT OK
# index 2 -- 2 % 2 == 0
# index 3 -- 3 % 2 == 1 - takes char at index 1, which is "b" -- NOT OK
# index 4 -- 4 % 2 == 0


# arr = str.chars
# starting_letter = 0
# temp = ''
#  loop do
# temp << arr[starting_letter]
#  temp << str.chars.each_with_index.select { |i| i % int == 0 } # this selects all chars so shift after is no good
# #  str.shift
# end

# - what if I loop
# - select char at index
# - shift by required integer
# - add char again
# - finish when arr chars over

# "abcde"
#  01234
# ace - bd - ce - e, ----- 0,2,4 - 1,3 - 2,4 - 4

# abcd
# add index 0, a, shift 2, str is now cde
# add index 0, c, shift 2, str is now e
# add index 0, e
puts "other solution"
str = "abcde"
arr = str.chars
ith = 2

counter = 0
temp = ''
final = ''
loop do
  break if arr[counter] == nil
  temp << arr[counter]
  p temp
  final += temp
  p "final is #{final}"
  temp = ''
  arr.shift(ith)
end
p final
p arr

# abcd
# <a
# cd
# <c
# e
# <e
puts "solving according to the algorithm from Philip"
# TA session with Philip - his suggestion:

#  - iterate over the string without spaces, starting with char at index 1
#    - at each outer iteration, we get the whole word
#    - given "a b c d e", 2, at the first outer iteration we have ["ace"]
#    - iterate over the string without spaces starting with starting_index until str.size
#      - at each inner iteration, we compose the word composed of starting char + every ith character
#      - given "a b c d e", 2, at the first inner iteration we have "a", at the second we have "ac", etc.

#  - populate `result` with char at that index + every character at index 2nd argument

