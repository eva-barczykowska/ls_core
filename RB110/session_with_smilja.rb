
# Given a string s, find the length of the longest substring without repeating characters.




# p length_of_longest_substring('aaaabbcba') == 3 # p length_of_longest_substring('aaaaaa') == 1
# p length_of_longest_substring('pwwkea') == 4
# p length_of_longest_substring('') == ''
# p length_of_longest_substring('a') == 1
# p length_of_longest_substring('robtuunop') == 5
# p length_of_longest_substring('tucccaassaa') == 3
=begin
PEDAC TEMPLATE

************** Problem **************
-write a method
-the method takes a string as an argument
-the method returns the lenght of longest substring without repeating characters

Questions:
Any questions to this?
************** Examples **************
# p length_of_longest_substring('aaaabbcba') == 3
=> cba, whose size is 3
# p length_of_longest_substring('aaaaaa') == 1
=>a, whose size is 1
# p length_of_longest_substring('pwwkea') == 4
=>wkea, whose size is 4
# p length_of_longest_substring('') == ''
=> '' because there are no characters
# p length_of_longest_substring('a') == 1
=>a, whose size is 1
# p length_of_longest_substring('robtuunop') == 5
=>robtu, whose size is 5
# p length_of_longest_substring('tucccaassaa') == 3
=> tuc, whose size is 3

************** Data Structures **************
Input: a string
Middle: XXX
Output: an integer
************** Algorithm **************
-if a string is empty, return an empty string

-get the substrings where characters do not repeat
  -loop through the string
  -look at the current character and compare it with the next character

  -if the next character is different from this current one, add this current character to temp string
  -else, so if the next character is same as this one, add the accummulated them to the result array and
  -increase the counter
  -when the counter is 1 less from the str size, break out of the loop


-sort the substrings by their size (find out which one is the longest)

- return the size of the longest substring from all the possible substrings

Test assumptions in irb.

Take your time.

************** Code **************

************** Refactor **************

Differentiate between EXPLICIT AND IMPLICIT requirements?
=end

# this code works for the 'pwwkea' string argument but not for the first test case with argument 'aaaabbcba' for example
def length_of_longest_substring(str)
  return '' if str.empty?

  result = []
  index = 0
  temp = ""

  loop do
    # 'ind0-> p ind1-> w ind2-> w ind3-> k ind4-> e ind5-> a'
    # p != w TRUE
    # w != w FALSE
    # w != k FALSE
    # k != e FALSE
    # e!= a FALSE
    if str[index] != str[index + 1]
      temp << str[index] #p
      p index
      p "temp is #{temp}"
    else
      temp << str[index]
      # p "temp is #{temp}"
      result << temp
      # p "result is #{result}"
      temp.clear
    end
    index += 1
    break if index >= str.size
  end
result
end

p length_of_longest_substring('aaaabbcba') #== 3
# a, a, a,  ab, bc, ba
# p length_of_longest_substring('aaaaaa') == 1
# p length_of_longest_substring('pwwkea') #== 4
# p, pw, pww, pwwk, pwwwke, pwwkea, wkea

# p length_of_longest_substring('') == ''
# p length_of_longest_substring('a') == 1
# p length_of_longest_substring('robtuunop') #== 5
# p length_of_longest_substring('tucccaassaa') == 3

puts
puts "second try"
# second try
def length_of_longest_substring(str)
  return '' if str.empty?

  result = []
  index = 0
  temp = ""

  loop do
    # 'ind0-> a ind1-> a ind2-> a ind3-> a ind4-> b ind5-> b ind6-> c ind7-> b ind8-> a' # 'aaaabbcba'
    # p != a FALSE
    # a != a FALSE
    # a != a FALSE
    # a != b TRUE
    # b != b FALSE
    # b != c TRUE
    # c != b TRUE
    #  b != a TRUE                     '0 1 2 3 4 5 6 7 8'
    if str[index] != str[index + 1]  # 'a a a a b b c b a'
      temp << str[index] unless temp.chars.include?(str[index])
      # p "temp in if is #{temp}"
      result << temp if str[index + 1] == nil
    else
      temp << str[index]
      # p "temp in else is #{temp}"
      result << temp
      # p "result after else is #{result}"
      temp = ''
    end
    index += 1
    # p index
    break if index >= str.size
  end
  # p "final result is #{result}"
  result.sort_by(&:size).last.size
end

p length_of_longest_substring('aaaabbcba') == 3
p length_of_longest_substring('aaaaaa') == 1
p length_of_longest_substring('pwwkea') == 4
p length_of_longest_substring('') == ''
p length_of_longest_substring('a') == 1
p length_of_longest_substring('robtuunop') == 5
p length_of_longest_substring('tucccaassaa') == 3

puts
# solution I got the idea for:
def length_of_longest_substring(str)
  return '' if str.empty?

  res = str.chars.chunk_while { |i, j| i != j }.to_a
  res = res.map { |subarray| subarray.uniq }
  res.sort_by(&:size).last.size
end

p length_of_longest_substring('') == ''
p length_of_longest_substring('a') == 1
p length_of_longest_substring('aaaabbcba') == 3
p length_of_longest_substring('robtuunop') == 5
p length_of_longest_substring('tucccaassaa') == 3
p length_of_longest_substring('pwwkea') == 4

puts
puts "solved!"
def length_of_longest_substring(str)
  return '' if str.empty?

  result = []
  index = 0
  temp = ""

  loop do
    if str[index] != str[index + 1]
      temp << str[index] unless temp.chars.include?(str[index])
      result << temp if str[index + 1] == nil
    else
      temp << str[index]
      result << temp
      temp = ""
    end
    index += 1
    break if index >= str.size
  end
  result.sort_by(&:size).last.size
end

p length_of_longest_substring('aaaabbcba') == 3
p length_of_longest_substring('aaaaaa') == 1
p length_of_longest_substring('pwwkea') == 4
p length_of_longest_substring('') == ''
p length_of_longest_substring('a') == 1
p length_of_longest_substring('robtuunop') == 5
p length_of_longest_substring('tucccaassaa') == 3

