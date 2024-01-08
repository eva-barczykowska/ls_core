# 1. How to get every second character from this word?
word = "impeccable"
result = []
word.chars.each_with_index { |char, index| result << char if index.odd? }
puts "even characters:"
p result
# ["m", "e", "c", "b", "e"]


def get_every_second_char word
  arr_word_chars = word.chars
  arr_word_chars_length = arr_word_chars.length
  arr_solution = []

  # arr_solution = arr_word_chars.select.with_index do |char, idx|
  #   idx.odd?
  # end
  # arr_solution
  puts "with step"
  1.step(by: 2, to: arr_word_chars_length) { |a| arr_solution << arr_word_chars[a] }
  # we are starting with the index that we need
end
p get_every_second_char("impeccable")

#also the same is possible with the .step method
result = []
(1...word.size).step(2) do |index|
  result << word[index]
end
puts "with step:"
p result
# ["m", "e", "c", "b", "e"]

# 2. You have a word 'impeccable'. Your goal is to produce an array of strings:
word = "impeccable"
array = ["i", "im", "imp", "impe", "impec", "impecc", "impecca", "impeccab", "impeccabl", "impeccable"]

result = []
(0...word.size).each do |index|
  result << word[0..index]
end

p result
# ["i", "im", "imp", "impe", "impec", "impecc", "impecca", "impeccab", "impeccabl", "impeccable"]

puts

# 3. You have a word 'impeccable'. Cut it in such a way that you start from the beginning, take four characters,
# move by 1 character, take 4 characters again etc. See the example.
word = "impeccable"
["impe", "mpec", "pecc" "ecca", "ccab", "cabl", "able"]

result = []
(0...word.size - 4).each do |index|
  result << word[index..index + 4]
end

p result # ["impec", "mpecc", "pecca", "eccab", "ccabl", "cable"]

puts

# 4. Retrieve every 4th letter from this. Save it into an array.
word = "impeccable"
# 0-1-2-3-4-5-6-7-8-9-10
# i-m-p-E-c-c-a-B-b-l-e
# ["e", "b"]

result = []
(3...word.size).step(4) do |char|
  result << word[char]
end

puts "every 4th character:"
p result # ["e", "b"]

puts

# 3. Create all possible pairs from this array [1, 2, 3, 4, 5, 6, 7, 8]
# creating pairs of elements from a given array
arr = [1, 2, 3, 4, 5, 6, 7, 8]
result = []
(0...arr.size).each do |index|
  (index + 1...arr.size).each do |second_index|
    result << [arr[index], arr[second_index]]
  end
end

p result
# [[1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8], [3, 4],
 # [3, 5], [3, 6], [3, 7], [3, 8], [4, 5], [4, 6], [4, 7], [4, 8], [5, 6], [5, 7], [5, 8], [6, 7], [6, 8], [7, 8]]
puts
puts "another way of creating all possible pairs from this array -- but this creates a different array"
result = []
result = arr.product(arr)
# result = result.reject { |arr| arr == arr.reverse } #removing [1, 1] etc.
result = result.reject { |array| array[0] == array[-1] && arr[-1] == arr[0] } #does same as the line above

p result.size



