def string_to_integer(str)

  str.chars.map!.with_index do |_, index| #ask about the return value of this, why the arg is not mutated
    index + 1
  end

  # str # well, str is not mutated coz #chars returns a new object, an array and THAT ARRAY is mutated
  # index = 0
  # ones_tens_hundreds_etc = 1
  # int = 0
  #
  # loop do
  #   int = str[index] * 10
  #   break
  # end
  # int
end

p string_to_integer('4321') #== 4321 #works for the first one but not the second one coz logic was wrong
# string_to_integer('570') == 570

puts

DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6"=> 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10 }

def string_to_integer(str)
  integers_array = str.chars.map { |char| DIGITS[char] }

  res = 0
  multiplier = 1
  loop do
    break if integers_array.empty?
    res += integers_array.pop * multiplier
    multiplier *= 10
  end
  res
end

p string_to_integer('4321') == 4321
# 4 * 1
# 2 * 10
# 3 * 100
# 4 * 1000

p string_to_integer('570') == 570
# 0 * 1
# 0 * 1 + 7 * 10 = 70
# 70 + 5 * 100 + 570
puts
# ls solution
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570