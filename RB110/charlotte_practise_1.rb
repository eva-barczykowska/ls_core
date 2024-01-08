=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times. The input string consists of lowercase latin letters. Your function should return an array  [t, k]

PEDAC
P:
- string s
- find a minimum substring t
- and a maximum number k
- string = minimum_substring * maximum_number
-input string is lowercase letters
- method should return an array [t, k]

E:
p f("ababab") == ["ab", 3]
"ababab"
a
ab => ab * 3 = ababab ARGUMENT
aba
abab
ababa
ababab
-b
-ba
-bab
-baba
-babab
--a
--ab
--aba
--abab
--abab
---b
---ba
---bab
----a
----ab
-----b
p f("abcde") == ['abcde', 1]

Notes:
-min_by

A:
initialize `substrings` Array

-iterate over the string and generate substrings
-append to `subtrings` all substrings that target.size / substring.size == 0

-iterate over the string retrieving its indices -starting index
-inner loop will iterate over the ending index

-append the substring into the `substrings` Array

6 = 2 * (6/2)
-does the original str == my substring * (string.length / substring.lenth)
=end

def f(string)
  substrings = []

  (0...string.size).each do |starting_index|
    (starting_index...string.size).each do |ending_index|
      substrings << string[starting_index..ending_index]
    end
  end

  substrings.select! { |substring| string.size % substring.size == 0 }.select! { |substring| substring.start_with?(string[0]) }

  substrings.sort_by!(&:size)

  substrings.each do |substring|
    if string == substring * (string.size / substring.size)
      return [substring, (string.size / substring.size)]
    end
  end

  # string == substring * (str.size / substring.size)
  # "ababab" == "ab"    * ("ababab".size / "ab".size)

end

p f("ababab") #== ["ab", 3]
p f("abcde") == ['abcde', 1]