=begin
29. Split Strings
(https://www.codewars.com/kata/515de9ae9dcfc28eb6000001)
6 kyu
Complete the solution so that it splits the string into pairs of two characters.
If the string contains an odd number of characters then it should replace
the missing second character of the final pair with an underscore ('_').
  PEDAC TEMPLATE

************** Problem **************
-split the string into pairs
-if the last pair is not a pair but just one character, add _ in place where the characters should be

Questions:

************** Examples **************
p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []

************** Data Structures **************

************** Algorithm **************
-return empty array if string argument is empty
-initialize a result variable
-split argument string into an array
-iterate over the array and each time remove first 2 elements
-append these first 2 elements into the result array
-if not, add an underscore
-return result

************** Code **************
=end
def solution(str)
  return str.split if str.empty?
  result = []
  arr = str.split("")
  while arr.size > 0
    result << arr.shift(2)
  end
  # p result => [["a", "b"], ["c"]]
  result.map! { |a| a.join }
  # p result #=> ["ab", "c"]
  result.last << "_" if result.last.size == 1
  result #=> ["ab", "c"]
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []

puts

def solution(string)
  return_array = []
  index = 0
  array = string.chars
  array.each do |char|
    until index > array.size - 1
      return_array << string.slice(index, 2)
      index += 2
    end
  end
  return_array.map do |ele|
    if ele.size == 1
      ele << "_"
    else
      ele
    end
  end
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []

puts "thinking about other solutions:"
# Algorithm
# -add _ at the end if string.size is odd
# -split the string into an array
# -slice the array into 2 elements, join these 2 elements and append them to the result array
# -return the result

def solution(str)
  str << '_' if str.size.odd?
  result = []
  str.split("").each_slice(2) { |slice| result << slice.join }
  result
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []

puts

def solution(str)
  res = []

  my_arrays = str.chars.each_slice(2).to_a
  my_arrays.each do |subarray|
    if subarray.size == 2
      res << subarray.join
    else
      res << subarray.join.concat("_")
    end
  end

  res
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []


