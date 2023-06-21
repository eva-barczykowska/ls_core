# 6.Non-even substrings
# (https://www.codewars.com/kata/59da47fa27ee00a8b90000b4/train/ruby)
# 6 kyu
=begin
Given a string of integers,
return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.
1, 13, 134, 1341 > 1, 13, 1341
3, 34, 341 > 3, 341
4, 41 > 41
1 > 1

solve("1341") = 7. See test cases for more examples.

=begin pedac

*************Problem********************
Overall goal: return number of odd substrings
initial input: string of integer strings
overall output: integer (count of odd substrings)

explicit requirements:
generate all substrings
count only the odd substrings
return count (integer)


implicit requirements:

questions:

**********Examples/Test cases************
solve("1357") == 10
1, 13, 135, 1357 > all odd > 10
3, 35, 357
5, 57
7

*************Data Structure**************
string > integer > array > integer/count

***************Algorithm*****************
Overall approach: convert string  to array  [1, 3, 5, 7].
Iterate over array and find all substrings and save to 'return_array'.
Iterate over 'return_array' and count the number of odd integers.
1. initialize substrings array to empty array
1. iterate over string and find substrings add to substrings array
details: nested each, start_idx and end_idx > array of substrings
2. iterate over substrings, count strings to integer that are odd
details: count, string.to_i.odd? > integer

=end

def solve(string)
  substrings = []
  (0...string.size).each do |start_idx| # ... means exclude last index (because we are starting from 0), what happens if we include it?*
    (start_idx...string.size).each do |end_idx|
      substrings << string[start_idx..end_idx] # additional question: what does the str[..] method do when it encounters nil?
    end
  end
  p substrings
  substrings.count {|substring| substring.to_i.odd?}
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

puts
def solve(string)
  substrings = []
  (0..string.size).each do |start_idx|
    (start_idx..string.size).each do |end_idx|
      p "start #{start_idx}"
      p "end #{end_idx}"
      p "#{string[start_idx..end_idx]}"
      substrings << string[start_idx..end_idx]
    end
  end
  p substrings
  substrings.count {|substring| substring.to_i.odd?}
end

puts
puts 'Experimenting with index:'
def solve(string)
  substrings = []
  (0...string.size).each do |start_idx| # play around changing ... to ..
    (start_idx...string.size).each do |end_idx|
      p "range from inx #{start_idx} to #{end_idx} so adding #{string[start_idx..end_idx]}"
      substrings << string[start_idx..end_idx]
    end
  end
  p substrings
  # substrings.count {|substring| substring.to_i.odd?}
end

p solve("789") #== 7

# what happens if we try to extract a range of characters by [] method,
# passing the range inside so  [..]
# but there are no elements at the starting index or ending index?
# then an empty string is 'extracted'

# puts "---"
# puts "question:"
# str = '456'
# p str[3]
# p str[3..3] #=> "" so from index 3 that doesn't exist to index 3
# p str[3...3]
# I think it the each's method fault that nothing gets added
# each returns its caller, which is essentially nothing?
# str = "ewa"
# 3.0.0 :038 > str[3..3].split.each do |s|
# 3.0.0 :039 >   print s
# 3.0.0 :040 > end   => []
# so on line 104 we essentially have ["7", "78", "789", "8", "89", "9"] + []
# which results in ["7", "78", "789", "8", "89", "9"]
# but hey, it's <<
# ["7", "78", "789", "8", "89", "9"] << [] should have ["7", "78", "789", "8", "89", "9", []]
#
# from the docs
# When the single Range argument range is given,
# derives start and length values from the given range, and returns values as above:
# 'foo'[0..1] is equivalent to 'foo'[0, 2]
# 'foo'[0...1] is equivalent to 'foo'[0, 1].
puts "---"

# ... and ... give us the expected result but WHY:

# ... on line 92 up =>["7", "78", "789", "8", "89", "9"]
# .. on line 93 up => ["7", "78", "789", "8", "89", "9"] -- does NOT change result
# "range from inx 0 to 0 so 7"
# "range from inx 0 to 1 so 78"
# "range from inx 0 to 2 so 789"
# "range from inx 1 to 1 so 8"
# "range from inx 1 to 2 so 89"
# "range from inx 2 to 2 so 9" -- str.size is 1 less than counting by index so str.size == 3, this line (start_idx...string.size) will NOT get executed AT ALL coz str[3..3]
# ["7", "78", "789", "8", "89", "9"]
# ["7", "78", "789", "8", "89", "9"]
#
# .. on 92 and 93 => ["7", "78", "789", "789", "8", "89", "89", "9", "9", ""] -this will change the result
# "range from inx 0 to 0 so 7"
# "range from inx 0 to 1 so 78"
# "range from inx 0 to 2 so 789"
# "range from inx 0 to 3 so 789"
# "range from inx 1 to 1 so 8"
# "range from inx 1 to 2 so 89"
# "range from inx 1 to 3 so 89" -takes only what's available which is the same string as previously (coz there is nothing at index 3)
# "range from inx 2 to 2 so 9"
# "range from inx 2 to 3 so 9" -takes only what's available which is the same string as previously (coz there is nothing at index 3)
# "range from inx 3 to 3 so "  -nothing here, so just adds an empty string