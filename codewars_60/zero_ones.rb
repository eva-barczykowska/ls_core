=begin
  Check Zero Ones
  Given a binary string s, return true if the longest contiguous segment of 1's is strictly longer than
  the longest contiguous segment of 0's in s, or return false otherwise.
  ** get the chunks of string
    divide into 0s and 1s
    which has the longer segment, the 0s or the 1s?
    true: longest is 1s
    false : longest is 0s
  For example, in s = "110100010" the longest continuous segment of 1s has length 2, and the
  longest continuous segment of 0s has length 3.
** 11 000 => false
  Note that if there are no 0's, then the longest continuous segment of 0's is considered to have a
  length 0. The same applies if there are no 1's.
  ** if no 0s then count 0s as 0 in length
  ** if no 1s then count 1s as 0 in length
=begin pedac

*************Problem********************
Overall goal: To write a method that takes a string of 1s and 0s, returns true if the longest segment is 1s, false if longest segment is 0s
initial input: string
overall output: boolean

explicit requirements:
input string: only 1 0
return value:
  true: if longest segment is 1s
  false if longest segment is 0s



implicit requirements:
if there is no one max value, but there is 2, then  return false
questions:

**********Examples/Test cases************
p check_zero_ones("110") == true
** longest segment is 11 > true
p check_zero_ones("0011") == false
** longest is both 00 and 11 > false
p check_zero_ones("1") == true
**true
p check_zero_ones("0") == false
** false
p check_zero_ones("110100010") == false
** 11 000 > false
p check_zero_ones("1101") == true
**11 > true
p check_zero_ones("11010111100") == true
** 1111 > true

*************Data Structure**************
string > boolean

***************Algorithm*****************
Overall approach:
define a method, 1 parameter string
divide the string into chunks
  slice the string when the char != next char
  [[111], [00], [11], [0]]
select the maximum length subarr
  max_by length
if subarr includes 1 return true, else return false

=end
def check_zero_ones(string)
  chunks = string.chars.slice_when { |char1, char2| char1 != char2 }.max_by {|subarr| subarr.length}
  chunks.include?('1') ? true : false
end

p check_zero_ones("110")  == true
p check_zero_ones("0011") == false
p check_zero_ones("1") == true
p check_zero_ones("0") == false
p check_zero_ones("110100010") == false
p check_zero_ones("1101") == true
p check_zero_ones("11010111100") == true

# Slice_when
