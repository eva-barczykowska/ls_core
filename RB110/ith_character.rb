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

puts "remarks from Philip"

# 1. Because you use gsub! on line 5, your solution mutates the calling string:
# str = "a b c d e"
# fragment(str) # p str #=> "abcde"
#
# 2. We never actually need to use an array arr instead of our original string str.
#
# 3. After making those changes, we can actually remove some guard clauses - return "" if str.empty? and
# if str.include?(" ") - the rest of the program logic handles them BUT use the non-mutating version of gsub
# because the mutating version - gsub! - returns nil if no changes are made.
#
# 4. Rather than initializing temp and ith_char outside the loop and manually resetting them to starting values,
# we can just let variable scoping rules handle this for us:
def fragment(str, int)
  return "i cannot be less than 1" if int == 0
  final = []

  str = str.gsub(" ", "")
  starting_letter = 0

  loop do
    break if starting_letter >= str.size
    ith_char = starting_letter + int
    temp = str[starting_letter]
    loop do
      break if ith_char >= str.size
      temp << str[ith_char]
      ith_char += int
    end
    final << temp
    starting_letter += 1
  end

  final.join(" ")
end

p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 100) == "a b c d e"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("", 1) == ""

# Kim's solution
def fragment(str, int)
  return 'i cannot be less than 1' if int == 0

  arr = str.delete(' ').chars  # ["a", "b", "c", "d", "e"]
  return_arr = []              #   0    1    2    3    4

  loop do
    break if arr.empty?
    return_arr << arr.select.with_index { |elem, idx| idx % int == 0 }.join
    arr.shift
  end

  return_arr.join(" ")
end

p fragment("a b c d e", 2)# == "ace bd ce d e"
# p fragment("abcde", 1) == "abcde bcde cde de e"
# p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
# p fragment("abcde", 100) == "a b c d e"
# p fragment("abcde", 0) == "i cannot be less than 1"
# p fragment("", 1) == ""

# FIRST ITERATION
# arr            ["a", "b", "c", "d", "e"]
# indices          0    1    2    3    4
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "a" -- OK
# index 1 -- 1 % 2 == 1 - doesn't take char at this index
# index 2 -- 2 % 2 == 0 - takes char at index 2, which is "e" -- OK
# index 3 -- 3 % 2 == 1 - doesn't take char at this index
# index 4 -- 4 % 2 == 0 - takes char at index 4, which is "e" -- OK
# shift!

# SECOND ITERATION
# arr            ["b", "c", "d", "e"]
# indices          0    1    2    3
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "b" -- OK
# index 1 -- 1 % 2 == 1 - doesn't take char at this index
# index 2 -- 2 % 2 == 0 - takes char at index 2, which is "d" -- OK
# index 3 -- 3 % 2 == 1 - doesn't take char at this index

# THIRD ITERATION
# arr            ["c", "d", "e"]
# indices          0    1    2
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "c" -- OK
# index 1 -- 1 % 2 == 1 - doesn't take char at this index
# index 2 -- 2 % 2 == 0 - takes char at index 2, which is "3" -- OK

# FOURTH ITERATION
# arr            ["d", "e"]
# indices          0    1
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "d" -- OK
# index 1 -- 1 % 2 == 1 - doesn't take char at this index

# FIFTH ITERATION
# arr            ["d", "e"]
# indices          0    1
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "d" -- OK
# index 1 -- 1 % 2 == 1 - doesn't take char at this index

# SIXTH ITERATION
# arr            ["e"]
# indices          0
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "e" -- OK

