=begin
Create a function that takes in a number as a string n and returns the number without trailing and leading zeros.

Trailing Zeros are the zeros after a decimal point which don't affect the value (e.g. the last three zeros in 3.4000 and 3.04000).
Leading Zeros are the zeros before a whole number which don't affect the value (e.g. the first three zeros in 000234 and 000230).

Notes:
Return a string.
If you get a number with .0 on the end, return the integer value (e.g. return "4" rather than "4.0").
If the number is 0, 0.0, 000, 00.00, etc... return "0".
E:
# p remove_leading_trailing("230.000") == "230"
-remove 3 zeros after the dot
p remove_leading_trailing("00402") #== "402"
# remove 2 zeros before, there's no .
# p remove_leading_trailing("03.1400") == "3.14"
# remove zero before and after, there is a dot
# p remove_leading_trailing("30") == "30"
#return as it it
# p remove_leading_trailing("0.00") == "0"
A:
- return 0 if string is all zeros

- if there is no zeros at the beginning and no dot in the string, return the string number as it is

-now the processing starts:
-remove zeros from the beginning:
  - change str to an array
  - until the first char in my array is NOT a string that is "0", remove the first element of the array
  - join the array into a string and return it if there is no dots

- reverse the string and do the above again

- reverse back
- check for a dot at the end

 - return joined string
=end

def remove_leading_trailing(str)
  return "0" if str.delete(".").chars.all? { |c| c == "0"}

  return str unless str[0] == "0" || str.include?(".")

  arr = str.chars
  until arr[0] != "0"
    arr.shift
  end

  return arr.join unless arr.include?(".")

  arr = arr.reverse

  until arr[0] != "0"
    arr.shift
  end

  arr = arr.reverse
  arr.pop if arr.last == "."
  arr.join

end
p remove_leading_trailing("230.000") == "230"
p remove_leading_trailing("00402") == "402"
p remove_leading_trailing("03.1400") == "3.14"
p remove_leading_trailing("30") == "30"
p remove_leading_trailing("0.00") == "0"