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
    return_arr << arr.select.with_index { |elem, idx| idx % int == 0 }.join # the char at which index shall we select?
    p "after this iteration return_arr is #{return_arr}"
    arr.shift
    break
  end
  p "arr is #{arr}"
  return_arr.join(" ")
end

p fragment("a b c d e", 2)# == "ace bd ce d e"
# p fragment("abcde", 1) == "abcde bcde cde de e"
# p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
# p fragment("abcde", 100) == "a b c d e"
# p fragment("abcde", 0) == "i cannot be less than 1"
# p fragment("", 1) == ""

# first we need to delete spaces/clean the string
# ITERATION 0
# arr            ["a", "b", "c", "d", "e"], int = 2
# indices          0    1    2    3    4
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "a" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 2 == 1 - doesn't take char at this index
# index 2 -- 2 % 2 == 0 - takes char at index 2, which is "e" -- OK
# index 3 -- 3 % 2 == 1 - doesn't take char at this index
# index 4 -- 4 % 2 == 0 - takes char at index 4, which is "e" -- OK
# shift

# ITERATION 1
# arr            ["b", "c", "d", "e"]
# indices          0    1    2    3
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "b" -- OK
# index 1 -- 1 % 2 == 1 - doesn't take char at this index
# index 2 -- 2 % 2 == 0 - takes char at index 2, which is "d" -- OK
# index 3 -- 3 % 2 == 1 - doesn't take char at this index
# shift

# ITERATION 2
# arr            ["c", "d", "e"]
# indices          0    1    2
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "c" -- OK
# index 1 -- 1 % 2 == 1 - doesn't take char at this index
# index 2 -- 2 % 2 == 0 - takes char at index 2, which is "3" -- OK

# ITERATION 3
# arr            ["d", "e"]
# indices          0    1
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "d" -- OK
# index 1 -- 1 % 2 == 1 - doesn't take char at this index
# shift

# ITERATION 4
# arr            ["e"]
# indices          0    1
# index 0 -- 0 % 2 == 0 - takes char at index 0, which is "d" -- OK
# index 1 -- 1 % 2 == 1 - doesn't take char at this index
# shift

#[]

puts

def fragment(str, int)
  return 'i cannot be less than 1' if int == 0

  arr = str.delete(' ').chars
  return_arr = []

  loop do
    break if arr.empty?
    return_arr << arr.select.with_index { |elem, idx| idx % int == 0 }.join # the char at which index shall we select?
    arr.shift
  end
  p "return_arr is #{return_arr}"
  p "arr is #{arr}"
  return_arr.join(" ")
end

# first we need to delete spaces/clean the string

# ITERATION 0 COUNTING FROM 0
# arr            ["m", "a", "r", "y", "h", "a", "d", "a", "l", "i", "t", "t", "l", "e", "l", "a", "m", "b"]
# int = 3
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "m" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "y" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "d" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# index 9 -- 9 % 3 == 0 - takes char at index 9, which is "i" -- OK
# index 10 -- 10 % 3 == 1 - doesn't take char at this index
# index 11 -- 11 % 3 == 2 - doesn't take char at this index
# index 12 -- 12 % 3 == 0 - takes char at index 12, which is "l" -- OK
# index 13 -- 13 % 3 == 1 - doesn't take char at this index
# index 14 -- 14 % 3 == 2 - doesn't take char at this index
# index 15 -- 15 % 3 == 0 - takes char at index 15, which is "a" -- OK
# index 16 -- 16 % 3 == 1 - doesn't take char at this index
# index 17 -- 17 % 3 == 2 - doesn't take char at this index
# chars taken after this iteration ["m", "y", "d", "i" "l" "a"]
# joined ["mydila"]
# shift

# arr            ["a", "r", "y", "h", "a", "d", "a", "l", "i", "t", "t", "l", "e", "l", "a", "m", "b"]  -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 1 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "a" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "h" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "a" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# index 9 -- 9 % 3 == 0 - takes char at index 9, which is "t" -- OK
# index 10 -- 10 % 3 == 1 - doesn't take char at this index
# index 11 -- 11 % 3 == 2 - doesn't take char at this index
# index 12 -- 12 % 3 == 0 - takes char at index 12, which is "e" -- OK
# index 13 -- 13 % 3 == 1 - doesn't take char at this index
# index 14 -- 14 % 3 == 2 - doesn't take char at this index
# index 15 -- 15 % 3 == 0 - takes char at index 15, which is "m" -- OK
# index 16 -- 16 % 3 == 1 - doesn't take char at this index
# chars taken after this iteration ["a", "h", "a", "t" "e" "m"]
# joined ["mydila"]
# shift

# arr            [r", "y", "h", "a", "d", "a", "l", "i", "t", "t", "l", "e", "l", "a", "m", "b"]  -    -
# indices         0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 2 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "r" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "a" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "l" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# index 9 -- 9 % 3 == 0 - takes char at index 9, which is "t" -- OK
# index 10 -- 10 % 3 == 1 - doesn't take char at this index
# index 11 -- 11 % 3 == 2 - doesn't take char at this index
# index 12 -- 12 % 3 == 0 - takes char at index 12, which is "l" -- OK
# index 13 -- 13 % 3 == 1 - doesn't take char at this index
# index 14 -- 14 % 3 == 2 - doesn't take char at this index
# index 15 -- 15 % 3 == 0 - takes char at index 15, which is "b" -- OK
# index 16 -- 16 % 3 == 1 - doesn't take char at this index
# chars taken after this iteration ["r", "a", "l", "t" "l" "b"]
# joined ["raltlb"]
# shift

# arr            ["y", "h", "a", "d", "a", "l", "i", "t", "t", "l", "e", "l", "a", "m", "b"]  -    -   -
# indices         0    1    2     3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 3 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "y" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "d" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "i" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# index 9 -- 9 % 3 == 0 - takes char at index 9, which is "l" -- OK
# index 10 -- 10 % 3 == 1 - doesn't take char at this index
# index 11 -- 11 % 3 == 2 - doesn't take char at this index
# index 12 -- 12 % 3 == 0 - takes char at index 12, which is "a" -- OK
# index 13 -- 13 % 3 == 1 - doesn't take char at this index
# index 14 -- 14 % 3 == 2 - doesn't take char at this index
# chars taken after this iteration ["y", "d", "i", "l" "a"]
# joined ["ydila"]
# shift

# arr            ["h", "a", "d", "a", "l", "i", "t", "t", "l", "e", "l", "a", "m", "b"]  -    -   -     -
# indices         0    1    2     3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 4 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "h" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "a" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "t" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# index 9 -- 9 % 3 == 0 - takes char at index 9, which is "e" -- OK
# index 10 -- 10 % 3 == 1 - doesn't take char at this index
# index 11 -- 11 % 3 == 2 - doesn't take char at this index
# index 12 -- 12 % 3 == 0 - takes char at index 12, which is "m" -- OK
# index 13 -- 13 % 3 == 1 - doesn't take char at this index
# chars taken after this iteration ["h", "a", "t", "e" "m"]
# joined ["hatem"]
# shift

# arr            ["a", "d", "a", "l", "i", "t", "t", "l", "e", "l", "a", "m", "b"]  -    -   -     -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 5 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "a" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "l" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "t" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# index 9 -- 9 % 3 == 0 - takes char at index 9, which is "l" -- OK
# index 10 -- 10 % 3 == 1 - doesn't take char at this index
# index 11 -- 11 % 3 == 2 - doesn't take char at this index
# index 12 -- 12 % 3 == 0 - takes char at index 12, which is "b" -- OK
# chars taken after this iteration [a", "l", "t" "l", "b]
# joined ["altlb"]
# shift

# arr            ["d", "a", "l", "i", "t", "t", "l", "e", "l", "a", "m", "b"]  -    -   -     -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 6 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "d" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "i" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "l" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# index 9 -- 9 % 3 == 0 - takes char at index 9, which is "a" -- OK
# index 10 -- 10 % 3 == 1 - doesn't take char at this index
# index 11 -- 11 % 3 == 2 - doesn't take char at this index
# chars taken after this iteration [d", "i", "l", a"]
# joined ["dila"]
# shift


# arr            ["a", "l", "i", "t", "t", "l", "e", "l", "a", "m", "b"]  -    -   -     -    -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 7 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "a" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "t" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "e" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# index 9 -- 9 % 3 == 0 - takes char at index 9, which is "m" -- OK
# index 10 - 10 % 3 == 1 - doesn't take char at this index
# chars taken after this iteration ["a", "t", "e", "m"]
# joined ["atem"]
# shift

# arr            ["l", "i", "t", "t", "l", "e", "l", "a", "m", "b"]  -    -   -     -    -    -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 8 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "l" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "t" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "l" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# index 9 -- 9 % 3 == 0 - takes char at index 9, which is "b" -- OK
# chars taken after this iteration ["l", "t", "l", "b"]
# joined ["ltlb"]
# shift

# arr            ["i", "t", "t", "l", "e", "l", "a", "m", "b"]  -    -   -     -    -    -    -   -     -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 9 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "i" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "l" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "a" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# index 8 -- 8 % 3 == 2 - doesn't take char at this index
# chars taken after this iteration ["i", "l", "a"]
# joined ["ila"]
# shift

# arr            ["t", "t", "l", "e", "l", "a", "m", "b"]  -    -   -     -    -    -    -   -     -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 10 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "t" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "e" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "m" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# chars taken after this iteration ["t", "e", "m"]
# joined ["tem"]
# shift

# arr            ["t", "l", "e", "l", "a", "m", "b"]  -    -   -     -    -    -    -   -     -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 11 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "t" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "l" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# index 6 -- 6 % 3 == 0 - takes char at index 6, which is "b" -- OK
# index 7 -- 7 % 3 == 1 - doesn't take char at this index
# chars taken after this iteration ["t", "l", "b"]
# joined ["tlb"]
# shift

# arr            ["l", "e", "l", "a", "m", "b"]  -    -   -     -    -    -    -   -     -    -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 12 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "l" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "a" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# index 5 -- 5 % 3 == 2 - doesn't take char at this index
# chars taken after this iteration ["l", "a"]
# joined ["la"]
# shift

# arr            ["e", "l", "a", "m", "b"]  -    -   -     -    -    -    -   -     -    -    -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 13 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "e" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "m" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# chars taken after this iteration ["e", "m"]
# joined ["em"]
# shift

# arr            ["l", "a", "m", "b"]  -    -   -     -    -    -    -   -     -    -    -    -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 14 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "l" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# index 3 -- 3 % 3 == 0 - takes char at index 3, which is "b" -- OK
# index 4 -- 4 % 3 == 1 - doesn't take char at this index
# chars taken after this iteration ["l", "b"]
# joined ["lb"]
# shift

# arr            ["a", "m", "b"]  -    -   -     -    -    -    -   -     -    -    -    -    -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 15 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "a" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# index 2 -- 2 % 3 == 2 - doesn't take char at this index
# chars taken after this iteration ["a"]
# joined ["a"]
# shift

# arr            ["m", "b"]  -    -   -     -    -    -    -   -     -    -    -    -    -    -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# # p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

# ITERATION 16 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "m" -- OK          *** we always mod index by the integer
# index 1 -- 1 % 3 == 1 - doesn't take char at this index
# chars taken after this iteration ["m"]
# joined ["m"]
# shift

# arr            ["b"]  -    -   -     -    -    -    -   -     -    -    -    -    -    -    -    -    -
# indices          0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15  16    17
# p fragment("mary had a little lamb", 3) #== "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
#
# ITERATION 17 COUNTING FROM 0
# index 0 -- 0 % 3 == 0 - takes char at index 0, which is "b" -- OK          *** we always mod index by the integer
# chars taken after this iteration ["b"]
# joined ["b"]
# shift

p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"

puts "what if we don't shift?"
# we have to, otherwise it's an infinite loop
# def fragment(str, int)
#   return 'i cannot be less than 1' if int == 0
#
#   arr = str.delete(' ').chars  # ["a", "b", "c", "d", "e"]
#   return_arr = []              #   0    1    2    3    4
#
#   loop do
#     break if arr.empty?
#     return_arr << arr.select.with_index { |elem, idx| idx % int == 0 }.join # the char at which index shall we select?
#     # at each iteration I am getting an array of target characters, which I join in order to push a str into my return_arr
#     p "arr is #{arr}"
#   end
#   p "return_arr is #{return_arr}" # joining return_arr because str is required as a return value
#   return_arr.join(" ")
# end
# p fragment("a b c d e", 2)# == "ace bd ce d e"

puts "what if I introduce counter in order not to have to shift?"
# I will get the same string over and over again because... I didn't shift
# the indices that we select are always THE SAME but we START WITH a different index
# that is why we need shift - to always start with a different character
# and we will can retrieve that character based on the index
# on every loop iteration we start with the consecutive character as the first
# and then select characters (indicated by int) starting from on the first character in the array
# if we shift, we are sure that we always start with the next consecutive character as the first character of the
# string that we are building
# we start counting from that character only and we use the second argument int, e.g. 2
# int remains the same on every iteration of the loop
# on every execution of the loop we select all characters that we need to select on that iteration using mod
# if we index mod int, and check the result
# we want to select each index, which, mod by target, gives a ZERO remainder. e.g.
# 0%2 == 0 -- pick char at this index so at index 0
# 1%2 == 1
# 2%2 == 0 -- pick char at this index so at index 2
# 3%2 == 1
# 4%2 == 0 -- pick char at this index so at index 4
# 5%2 == 1
# 6%2 == 0 -- pick char at this index so at index 6
# so what's constant through looping are the target indices, what changes on every loop iteration is the starting letter
# and that is thanks to shifting
# very smart!

def fragment(str, int)
  return 'i cannot be less than 1' if int == 0

  arr = str.delete(' ').chars  # ["a", "b", "c", "d", "e"]
  return_arr = []              #   0    1    2    3    4
  counter = 0

  loop do
    break if counter > arr.size
    return_arr << arr.select.with_index { |elem, idx| idx % int == 0 }.join # the char at which index shall we select?
    # at each iteration I am getting an array of target characters, which I join in order to push a str into my return_arr
    counter += 1
    p "arr is #{arr}"
  end
  p "return_arr is #{return_arr}" # joining return_arr because str is required as a return value
  return_arr.join(" ")
end
p fragment("a b c d e", 2)# == "ace bd ce d e"

