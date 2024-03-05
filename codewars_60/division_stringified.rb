=begin
# Have the method division_stringified(num1, num2) take both parameters being passed, divide num1 by num2, and return the result as a string with properly formatted commas.
#
# If an answer is only 3 digits long, return the number with no commas.
#
# Example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".
#
# Note: 2 divided by 3 should return '1'

P: 
- write a method that takes 2 integers
-method divices num1 / num2
-return result as a str with properly formatted commas

N:
(6874.0/67.0).round
-use floats
-use round to get the accurate number
-returns a STRING
-how to format it?

-commas are every 3 places (counting from the end) if I have 
1,000
11,760,859
- commans are placed at indices multiples of 3
-i need to check that the number od digits is always 1 more than multiple of 3

- split to an array and see the size 
-how to insert the commans into the array
-reverse the array
- insert commas after every third element, provided that there is a forth element after every third element
- 103 [3, 0, 1] no comma here => no 4th element
-1222 [2, 2, 2, 1] COMMA after 3rd element because a 4th element exisits in the array
-612345 [5 4 3, 2 1 6]

E:
p division_stringified(2, 3) == "1"
=> 1

p division_stringified(5, 2) == "3"
p division_stringified(7, 3) == "2"
p division_stringified(6874, 67) == "103"
p division_stringified(1, 10) == "0"
=> round

p division_stringified(503394930, 43) == "11,706,859"
p division_stringified(100000, 1) == "100,000"
p division_stringified(10000000000000, 1) #== "100,000"

Hypothesis:
# Idea 1:
Change to floats to get a 'reliable' number, reverse and enter digits and a comma after every 3 digits into a `result` string. if the result is only 3 digits, return the string. Otherwise always check though if after the inserted comma there is a digit, if there isn't, it means it's the end and no comma is to be inserted.

# Idea 2:
Convert to floats and make a division, round. If result is 3 characters long, return it. Convert to digits and slice chunks of 3. Until the array is empty remove iteratively in a loop chunks of 3 and append to the `result` array, after append also a comma unless next chunk is nil. Remove nesting (flatten the array), join and return.

# Idea 3:
-Convert to flats, divide, round, convert to string and chars. Loop from char at index - 1 and after every third character, insert a comma. When you insert the comma, increase counter by 2 so now it will be -5, again count 0, 1, 2 and at index 3 insert a comma. Do that until array characters are over.

A:
-covert num1 and num2 to floats
-divide num1 / num2 and round the result
-if array size is smaller or equal to 3, return `result` as a string

-change `result` to array in order to insert commas
-reverse teh array
-if array size is smaller or equal to 3, return `result`

-create a copy of the array
-iterate over the copy
-from 0 step by 3 to array size
-at every index 3, insert a comma/after every 3rd character insert a comma
-- get indices
--use them to insert commas
--insert a comma unless the next index is nil

-reverse the array

-reverse back
-verify if there are no commas
-join and return a string

PlanB
-create a string, insert 3 digits from array, and comma in a loop
=end
def division_stringified(num1, num2)
  number = (num1.to_f / num2.to_f).round
  
  return number.to_s if number.to_s.size <= 3

  result = number.digits
    
  arr = []

  counter = 0
  loop do 
    arr << result.shift(3)
    arr << "," unless result[counter.next] == nil
    break if result == []
  end

  arr.flatten.reverse.join("")
end
# p division_stringified(2, 3) == "1"
# p division_stringified(5, 2) == "3"
# p division_stringified(7, 3 )== "2"

# p division_stringified(6874, 67) == "103"
# p division_stringified(1, 10) == "0"

p division_stringified(503394930, 43) #== "11,760,859"
p division_stringified(100000, 1) #== "100,000"
p division_stringified(10000000000000, 1) == "100,000"

puts "Solution from Ilke"

def division_stringified(num1, num2)
  quotient = (num1.to_f / num2).round
  return quotient.to_s if quotient.to_s.size < 4
  
  digits_array = quotient.digits
  sized_splits = []
  
  #get sized splits
  index = 0
  while index <= digits_array.size - 1
    sized_splits << digits_array[index, 3]
    index += 3
  end

  
  #iterate through sized splits, insert , after every sized split subarray except the last one
  sized_splits.each_with_index do |sub, index|
    unless index == sized_splits.size - 1
      sub << ','
    end
  end

  
  #convert each element in sized split subarray to a string, concatenate 
  sized_splits.map { |sub| sub.map(&:to_s) }.flatten.reverse.join
end
p division_stringified(2, 3) == "1"
p division_stringified(5, 2) == "3"
p division_stringified(7, 3 )== "2"
p division_stringified(6874, 67) == "103"
p division_stringified(1, 10) == "0"
p division_stringified(503394930, 43) #== "11,760,859"
p division_stringified(100000, 1) == "100,000"
p division_stringified(10000000000000, 1) #== "100,000"

puts "Implementing 3rd idea"
# Idea 3:
# -Convert to floats, divide, round, convert to string and chars. Reverse iterate from char at index - 1 take 3 chars, prepend, prepend a comma. Do that until array characters are over but check for initial redundant comma at the start

# Algorithm
# -initialize array to the rounded result of division of floats, this will be an int, change to str and to array
# -loop through this array starting at index - 1, so from the end, so initialize counter to - 1
# - initialize `chunks_of_3` array, shift into this array 3 characters until array is empty

# initialize `result_string`
# -itearate over `chunks_of_3`
# -insert each chunk into `result_str` but join it first
# -insert a comma after each chunk except when the chunk you're currently iterating over is the last chunk in the `chunks_of_3` (we don't want a comma at the end)

# return `result_string`
def division_stringified(n1, n2)
  number = (n1.to_f / n2.to_f)
  p number
  array = number.round.digits
  p array

  chunks_of_3 = []

  until array.empty?
    chunks_of_3 << array.shift(3)
  end
  p chunks_of_3

  result_string = ""

  chunks_of_3.each do |chunk|
    result_string << chunk.join
    result_string << ","
  end

  result_string.chop.reverse
end
p division_stringified(2, 3) == "1"
p division_stringified(5, 2) == "3"
p division_stringified(7, 3 )== "2"
p division_stringified(6874, 67) == "103"
p division_stringified(1, 10) == "0"
p division_stringified(503394930, 43) #== "11,760,859"
p division_stringified(100000, 1) #== "100,000"
p division_stringified(10000000000000, 1) == "100,000"


# refactored, this is not a good solution!
# this solution has a weekness
# a = [[1, 2, 3], [3,4,5], [3,4,5]]
#  => [[1, 2, 3], [3, 4, 5], [3, 4, 5]] 
# a[1] == a.last
# => true

# def division_stringified(n1, n2)
#   array = (n1.to_f / n2).round.to_s.chars

#   chunks_of_3 = []

#   until array.empty?
#     chunks_of_3 << array.shift(3)
#   end

#   result_string = ""

#   chunks_of_3.each do |chunk|
#     result_string << chunk.join
#     result_string << "," unless chunk == chunks_of_3.last
#   end

#   result_string
# end
# p division_stringified(503394930, 43) #== "11,760,859"
# p division_stringified(100000, 1) #== "100,000"
# p division_stringified(10000000000000, 1) #== "100,000"

