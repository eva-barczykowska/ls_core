#!/usr/bin/ruby
# Count the number of occurences of a specified substring in a string:
# in scan the pattern passed as an argument can be both regex or a string
# scan returns an array with substrings
# it is different to count in that count takes the characters of the substring passed
# in as an argument and counts them separately: "hello".count("lo") => 3
def count_substring_instance(input_string, substring)
  input_string.scan(substring).size
end

# separating vowels from consonants in an input string:
def get_vowels_consonants(input_string)
  vowels = input_string.scan(/[aeiouAEIOU]/)
  consonants = input_string.scan(/[a-zA-Z&&[^aeiouAEIOU]]/)

  [vowels, consonants]
end

# when using index on a string or array, it returns the index of the FIRST OCCURENCE of the argument in the caller
# this custom method is needed if you have duplicate characters or elements and you need to return the index of the LAST OCCURENCE
# this does the same as method rindex
def last_occurence_index(input_string, element)
  indices = []
  input_string.chars.each_with_index { |char, index| indices << index if char == element }
  indices.max
end

# in permutations the order matters: [1, 2] != [2, 1], but in combinations order does not matter: [1, 2] is the same combo as [2, 1]
def get_permutations(input_array, size = input_array.size)
  input_array.permutation(size).to_a
end

# combinations of x size:
def get_combinations(input_array, size)
  input_array.combination(size).to_a
end

# OR get combination of size 2:
def get_combinations(_input_array)
  last_index = input.size - 1

  (0..last_index).each_with_object([]) do |index_1, output|
    (index_1 + 1..last_index).each do |index_2|
      output << [input[index_1], input[index_2]]
    end
  end
end

# delete the last digit in a number:
# sub replaces the first occurence of a pattern with a substring, delete deletes all occurences of given substring
# therefore delete_at(last_index) must be used
def delete_last_digit(number)
  string_number = number.to_s.chars
  string_number.delete_at(number.to_s.size - 1) # because I need index
  string_number.join.to_i
end

# can also use pop:
def delete_last_digit(number)
  string_number = number.to_s.chars
  string_number.pop
  string_number.join.to_i
end

# determine if prime number:
def prime?(number)
  (2...number).all? { |divisor| number % divisor != 0 }
end

# get sized split of input:
def get_sized_split(input, size)
  last_index = input.size - 1
  output = []
  current_index = 0

  while current_index <= last_index
    output << input[current_index, size]
    current_index += size
  end

  output
end

# get subarrays of a certain size:
def subs_of_size_x(array, size)
  subarrays = []

  (0..array.size - size).each do |index|
    subarrays << array[index, size]
  end

  subarrays
end

# get all possible substrings (with characters appear consecutively in input array) that are greater than size 2:
def get_subs(input)
  last_index = input.size - 1

  (0..last_index).each_with_object([]) do |index_a, output|
    (index_a + 1..last_index).each do |index_b|
      output << input[index_a..index_b]
    end
  end
end

# anagrams?
def anagrams?(word_a, word_b)
  word_a.chars.sort == word_b.chars.sort
end

# palindrome?
def palindrome?(input_string)
  input_string == input_string.reverse
end

# select all subarrays that are the greatest in size:
sub_arrays.select do |sub|
  sub.size == sub_arrays.max_by { |sub| sub.size }.size
end

# delete last occurrence of a char (as opposed to all occurrences):
def delete_last_occurrence(string, char_to_remove)
  last_index = string.rindex(char_to_remove)

  string[last_index] = '' unless last_index.nil?

  string
end

# delete first occurrence of a char:
def delete_first_occurrence(string, char_to_remove)
  first_index = string.index(char_to_remove)

  string[first_index] = '' unless first_index.nil?

  string
end

# or
def delete_first_occurrence(string, char_to_remove)
  string.sub(char_to_remove, '')
end
