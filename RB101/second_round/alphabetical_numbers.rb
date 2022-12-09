=begin
Question:
Alphabetical Numbers
Write a method that takes an Array of Integers between 0 and 19, and returns an
Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: Array of integers
Middle: Hash for conversion
Output: Array of integers in alphabetical order
Rules:
  Explicit Requirements
  - Method takes in an array of integers between 0 and 19
  - Method returns array of input integers sorted by english words for each
    number

  Implicit Requirements

-----------------------
Examples:
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

-----------------------
Data Structure: Hash for conversion then Array output
Algorithm:
1. Create a constant TO_NUMBER_CONVERSION equal to a hash of key/value pairs:
    - Keys are going to be `zero` to `nineteen`
    - Values are going to be 0 to 19
2. Create a constant TO_ALPHA_CONVERSION equal to TO_NUMBER_CONVERSION inverted
3. Create method `alphabetic_number_sort` with on param of `arr`
   a. Initialize `conversion` equal to iterating through `arr` and converting
   integers to english words
-----------------------
Code:
=end

TO_NUMBER_CONVERSION = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3,
                         'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7,
                         'eight' => 8, 'nine' => 9, 'ten' => 10, 'eleven' => 11,
                         'twelve' => 12, 'thirteen' => 13, 'fourteen' => 14,
                         'fifteen' => 15, 'sixteen' => 16, 'seventeen' => 17,
                         'eighteen' => 18, 'nineteen' => 19 }

TO_ALPHA_CONVERSION = TO_NUMBER_CONVERSION.invert # this is how we wanted the hash to look like in the first place

p TO_ALPHA_CONVERSION

{ 0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 19=>"nineteen" }

def alphabetic_number_sort(arr)
  conversion = arr.map { |num| TO_ALPHA_CONVERSION[num] }.sort # nums sorted alphabetically
  p conversion # gives me ["eight", "eighteen", "eleven", "fifteen", "five", "four", "fourteen", "nine", "nineteen", "one", "seven", "seventeen", "six", "sixteen", "ten", "thirteen", "three", "twelve", "two", "zero"]
  arr = conversion.map { |word| TO_NUMBER_CONVERSION[word] } # now I need to get the keys (integers) for those values in the hash
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
