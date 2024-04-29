#
# Capitalize the second last occurence of a given character in the string. If char occurs only once, don't do anything.
#
# Problem
# =======
# -method takes a str argument
# -method returns a str where each penulatimate occurence of a string is capitalized
# -if char is in str only once, don't do anything
#
# Examples
# ========
# capitalize_second_last("aa") == "Aa"
# =>
# capitalize_second_last("launschool") == "LaunCHschOol"
# => LaunCHschOol
# capitalize_second_last("assessments")
# =>
#
# Algorithm
# =========
# -TRANSFORM str to arr
# -COUNT all chars and store in a hash
# -REMOVE all chars that occur less than 2 times in the array, now you have `target_chars`, get keys
# -ITERATE over the array of these `target_chars`
# -for each char in the `target_chars` array, find penulatimate index using the helper method
# -store it in `target_indices`
#
# -ITERATE over the arr with index
# -if index is in `target_indices`, upcase the char
#
# -HELPER METHOD finding indices of a given char in the array
# -method takes a char
# -method finds all indices of that char
# -method returns penulatimate index of a char that was passed as an argument

def find_penultimate_index(arr, target_char)
  indices = []
  arr.find_all.with_index do |char, index|
    indices << index if char == target_char
  end
  indices[-2]
end

# arr = "launschool".chars
# target_char = "o"
# p find_penultimate_index(arr, target_char)

def capitalize_second_last(str)
  arr = str.chars
  target_chars = arr.tally.reject { |_k, v| v < 2 }.keys

  target_indices = []
  target_chars.each do |char|
    target_indices << find_penultimate_index(arr, char)
  end

  str.each_char.with_index do |_char, index|
    str[index] = str[index].upcase if target_indices.include?(index)
  end

  str
end

p capitalize_second_last('aa') == 'Aa'
p capitalize_second_last('launchschool') == 'LaunCHschOol'
capitalize_second_last('assessments')

puts

def capitalize_second_last(str)
  arr = str.chars
  target_chars = arr.tally.reject { |_k, v| v < 2 }.keys

  indices = []
  target_indices = []
  target_chars.each do |target_char|
    arr.find_all.with_index { |char, index| indices << index if char == target_char }
    target_indices << indices[-2]
  end

  str.each_char.with_index do |_char, index|
    str[index] = str[index].upcase if target_indices.include?(index)
  end

  str
end

p capitalize_second_last('aa') == 'Aa'
p capitalize_second_last('launchschool') == 'LaunCHschOol'
p capitalize_second_last('assessments') == 'assEsSments'
