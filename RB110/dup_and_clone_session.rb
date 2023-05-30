
# array = ['ba', 'ca', 'da']
# new_array = array.last(3) #does this return a new array????
# # last returns a new array, which is a shallow copy of the original array, which
# # means that the elements are shared by both arrays

# # THESE ARRAYS ARE SHARING THE SAME ELEMENTS!!!

# p new_array #=>? ['ba', 'ca', 'da']

# array[1] << 't' #=>['ba', 'cat', 'da']
# # new_array[2] << 'd' #=>['ba', 'ca', 'dad']

# p array #=>?
# p new_array #=>?

# p array.object_id == new_array.object_id #=>? false
# THE OBJECTS ARE DIFFERENT OBJECTS BUT THEY SHARE THE SAME ELEMENTS WITHIN THEM!
# ==> definition of a SHALLOW COPY

# With reference to the difference between a shallow copy and a deep copy,
# explain what is happening in this code snippet. What output can we expect?

# # arr_a = %w(ant bat cat)
# # arr_b = arr_a.dup

# # # arr_b.map! { |word| word.upcase }
# # # arr_b.map { |word| word.upcase! }
# # # arr_b.map! { |word| word.upcase! }
# # arr_b.map { |word| word.upcase }

# # p arr_a
# # p arr_b

# # p arr_a.object_id
# # p arr_b.object_id

# # p arr_a[0].object_id
# # p arr_b[0].object_id

# # Why is it when we invoke #freeze on the array object arr_a is assigned to and run the code we get this error message:  `map!': can't modify frozen Array: ["ant", "bat", "cat"] (FrozenError). Is the array object arr_b is referencing not
# # a COPY of arr_a?

# arr_a = %w(ant bat cat).freeze
# # arr_b = arr_a.clone
# arr_b = arr_a.dup

# arr_b.map! { |word| word.upcase }

# p arr_a
# p arr_b

# # .dup doesn't preserve the frozen state of the object
# # .clone preserves the frozen state of the object that is copied
# # because array a is frozen, array b is frozen
# # and that's why you can't mutate it with the map! method.

# array = [1, 2, 3, 55, 66, 100]
# nested = array.product

# p nested
# puts

# array = ["b", "a", "c"]
# array = array.product([1, 2, 3])
# p array

# puts

# array = ["b", "a", "c"]
# array2 = [[1, 2, 3]]
# array = array.product(array2)
# p array


# puts
# alphabet = ("a".."z").to_a
# p alphabet.zip(1..26).to_h

array = Array(2)
a, b, c = array.partition do |num|
  num.even?
end

# a, b, = a, b
p a
p b
p c

# x, y = "hey", "bye"
# p x
# p y

1.upto(10) { |number| puts number }
99.downto(0) { |number| puts "#{number} green bottles on the wall!" }

# def add_one_to(nums)
#   0.upto(nums.length) do |i|
#     nums[i] += 1
#   end
#   nums
# end

# numbers = [0, 1, 2, 3, 4]

# p add_one_to(numbers)
# p numbers

# sandi metz

word = "impeccable"

subs = []
0.upto(word.length - 4) do |number|
  subs << word[number + 3]
end

p subs
# i, im, imp, impe, impec

"a".upto("v") do |letter|
  puts letter.upcase
end
