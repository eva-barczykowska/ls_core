# Algorithm:
# **PSEUDO - Informal**
# - Initialize NUMBERS constant with string > number key/values
# - Create method `string_to_signed_integer` with one param of (string)
# - Initialize variable `positive` = true
# - Initialize variable `sum` to integer 0
# - Initialize variable `digits` equal to mapping each string char (element) to
# the value of the matching NUMBERS hash key
# - If the first element of `digits` is a -, set `positive` to false
# - Delete + or - from `digits` if exists
# - Itereate through `digits` array to set `sum` equal to `sum` * 10 + the current element
# - If `positive` not equal to true, then sum = sum * -1
# - Return sum

# Code:

NUMBERS = { '+' => '+', '-' => '-', '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_signed_integer(string)
  positive = true
  sum = 0
  digits = string.each_char.map { |char| NUMBERS[char] }

  positive = false if digits[0].eql?('-')

  if digits[0] == '-' || digits[0] == '+'
    digits = digits[1..-1]
  end

  digits.each do |num|
    sum = sum * 10 + num
  end
  positive == true ? sum : -sum
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

puts
puts "how AJ solved it"
NUMBERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  sum = 0
  digits = []
  string.each_char { |char| digits << NUMBERS[char] }
  digits.each do |num|
    sum = sum * 10 + num # 4, 43, 432, 4321
  end
  sum
end

def string_to_signed_integer(string)
  negative = true if string[0].eql?('-')
  string.delete!('-') || string.delete!('+') if string[0].eql?('+') || string[0].eql?('-')
  return -string_to_integer(string) if negative == true

  string_to_integer(string)
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

puts
puts "Refactoring AJ's method"
NUMBERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  sum = 0
  digits = []
  string.each_char { |char| digits << NUMBERS[char] }
  digits.each do |num|
    sum = sum * 10 + num # 4, 43, 432, 4321
  end
  sum
end

def string_to_signed_integer(string)
  negative = true if string[0].eql?('-')
  string.delete!('-+')
  return -string_to_integer(string) if negative == true

  string_to_integer(string)
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
