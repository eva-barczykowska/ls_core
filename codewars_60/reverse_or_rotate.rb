=begin
Reverse or rotate?
The input is a string digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size ss
(ignore the last chunk if its size is less than ss).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise
rotate it to the left by one position. Put together these modified chunks and return the result as a string.

If ss is <= 0 or if str is empty return ""

ss is greater (>) than the length of str it is impossible to take a chunk of size ss hence return "".
P:
-method that takes a string of digits, and integer as an argument
-integer is the ss - substring size
-cut the string into chunks of size ss 

-chunk has digits
-calculate the sum of the cube of all its digits 3*3*3 
-if the sum of the cubes is divisible by 2, reverse that chunk
-else I have to rotate it to the left by 1 position

-if ss > greater than str, return ""
-if arg is "", then I have return ""
-if ss is 0, I return ""

E:
p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("", 8) == ""
p revrot("123456779", 0) == ""

p revrot("73304 99108 72815 764", 5) == "33047 91089 28157"
73304 7**3 + 3**3 + 3**3 + 0**3 + 4**3 => 461 NOT divisible by 2 => 33047
first digit goes to the end - rotate it to the left
99108 => 91089 
9**3 + 9**3 + 1**3 + 0**3 + 8**3 = 1971 NOT divisible by 2 => rotate
first digit goes to the end - rotate it to the left

72815 => 28157 rotated
764 ----- ONLY substring size substrings

p revrot("123456987654", 6) == "234561 876549"
123456 => 234561, rotated
987654 => 876549, rotated

p revrot("66443875", 4) == "44668753"
6644 => reversed
3875 => rotated

p revrot("66443875", 8) == "64438756"
66443875 => rotated

p revrot("664438769", 8) == "67834466"
=> rotated

p revrot("123456779", 8) == "23456771"
=> rotated
p revrot("563000655734469485", 4) == "0365 0650 7345 6944"
5630 rotated
0065 rotated
5734 rotated
4694 rotated
85

DS
input: str, integer
output: string 

A; 
-create all chunks of required size
- remove chunks that are of less size, if any

-initialize `result_str`
-iterate over chunks of strings
-transforms them to chunks of digits
- transform those digits into the sum of their cubes
-(each element have to be risen to the power of 3)
-is the sum divisible by 2 evenly

-if yes, rotate that chunk
-rotate: first digit goes to the end, remove the first digit, join it and append it at the end of the chunk
-add to the `result_str` 

-if sum not evenly disible by 2, join into str, reverse and append to `result_str`
=end

def revrot(str, ss)
  if ss == 0 #use shorter version
    return ""
  elsif str.empty?
    return ""
  elsif ss > str.size
    return ""
  end

  chunks = []
  counter = 0
  loop do 
    chunks << str[counter, ss]
    counter += ss
    break if counter > str.size
  end

  chunks = chunks.reject { |ch| ch.size < ss }

  result_str = ""

  chunks.each do |chunk|
    sum = chunk.to_i.digits.map { |d| d**3 }.inject(:+)
    if sum % 2 == 0
      result_str << chunk.reverse
    else
      first = chunk[0]
      chunk = chunk.reverse.chop.reverse << first
      result_str << chunk
    end
  end

  result_str
end
p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("", 8) == ""
p revrot("123456779", 0) == ""

p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("563000655734469485", 4) == "0365065073456944"

def revrot(string, size)
  return '' if size == 0 || string.empty? || string.size < size
  
  chunks_array = []
  index = 0
  
  while index <= string.size - 1
    chunks_array << string[index, size]
    index += size
  end
  
  chunks_array.map do |chunk|
    next chunk.clear if !(chunk.size >= size) 
    if cube_sum_even?(chunk)
      chunk.reverse!
    else
      chunk.chars.rotate(1).join
    end
  end.join
  
end

def cube_sum_even?(string_chunk)
  (string_chunk.to_i.digits.reverse.map { |num| num ** 3 }.sum) % 2 == 0
end


puts

=begin
Reverse or rotate?
The input is a string digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size cs
(ignore the last chunk if its size is less than ss).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise
rotate it to the left by one position. Put together these modified chunks and return the result as a string.

If ss is <= 0 or if str is empty return ""

ss is greater (>) than the length of str it is impossible to take a chunk of size ss hence return "".

P:
-method takes a string of digits and a required chunk size, cs as args
-ignore last chunk if its size is less than required cs
-if the chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse thank chunk
-if it not NOT divisible by 2, rotate it left: this means first number goes to the end

-if cs is 0 or str is empty, return ""
- if cs is greater than str.size, return ""

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("", 8) == ""
p revrot("123456779", 0) == ""

"73304 - 33047 rotate why? 7**3+3**3+3**3+0**3+4**3= 461, not divisible by 2
99108 - 91089 rotate
72815 - 28157 rotate
764" delete

p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("563000655734469485", 4) == "0365065073456944"

Idea 1
Slice chunks, get rid of chunks of smaller than required size. Convert chunks to digits, raise each to the power of 3 and sum it's cubes.
If the sum is evenly disible by 2, change chunk to string and reverse it, else change the chunk to a string, chop off its first character and stick it at the end. Return the string made out of processed chunks.
A:
if cs 0, retun ""
if cs greater than cs, return ""
if str.empty? return ""

-create chunks of required cs size, delete chunks that are less than required cs

- iterate over chunks
--convert each chunk to digits, cube each digit and sum up the result
--the result if `sum`

- determine if that `sum`` if evenly divisible by 2?
- if yes, convert the chunk to a string and reverse, add to `result`
- else rotate it left
- that means first digit of the chunk goes to the end
- append reversed or rotated chunk, changed into string to the `result`

- return `result`
=end

def revrot(str, cs)
  return "" if str.empty? || cs == 0 || cs > str.size

  chunks = []
  last_index = str.size - 1

  current_index = 0
  while current_index < str.size - 1
    chunks << str[current_index, cs]
    current_index += cs
  end

  chunks.reject! { |ch| ch.size < cs }

  result = ""
  chunks.each do |chunk|
    sum = chunk.chars.map { |s| s.to_i }.map { |ch| ch**3 }.sum
    if sum % 2 == 0
      result << chunk.to_s.reverse 
    else
      first = chunk[0]
      chunk = chunk.reverse.chop.reverse << first
      result << chunk
    end
  end

  result
end
p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("", 8) == ""
p revrot("123456779", 0) == ""

p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("123456779", 8) == "23456771"

p revrot("563000655734469485", 4) == "0365065073456944"