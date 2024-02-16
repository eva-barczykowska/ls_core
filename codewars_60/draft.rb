puts "you've got this"
result = []
word = "incredible"
(0...word.size).each do |index|
  result << word[0..index]
end
p result

puts

result = []
word = "incredible"
(0...word.size).each do |index|
  result << word[0..index]
end
p result

puts
array = [1, 2, 3, 4, 5]
second_array = array.product([55])
p second_array

array = [1, 2, 3, 4, 5]
second_array = array.product([55, 99]) # each of the elements from the 1st array with elements from the arg array
p second_array

check = [1, 2, 3, 4, 5, 55, 99]
second_check = check.combination(2).to_a
p second_check