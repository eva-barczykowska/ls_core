=begin
-write a method that takes an array as an argument
-the method returns the min amount of common lettters
-so if there are 2 'o' in every word, returns both of them in the return array

E:
common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
e mininumm is once in EVERY word, l is twice in EVERY word
b is not only in the 1st word
e e e - e is in every word minimum ONCE so it's printed once
l is minimum TWICE in every word so it gets printed twice
ll ll ll
a is not in every word so it doesn't get printed

common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
c is once, o is once in EVERY word
c c c
o is minimum once in every word so it gets printed once
oo o oo

common_chars(['hello', 'goodbye', 'booya', 'random']) ==['o']
h is not in every word so it doesn't get printed
o is minimuonce in EVERY word
oo oo o

common_chars(['aabbaaaa', 'ccdddddd', 'ggrrrrr', 'yyyzzz']) == []
no common characters so an empty array

DS:
input: Array
mmiddl: Hash
outpt: Array

N:
tally

A:
- take first word as a base, retrieve all letters in that first word and save them to `must_have` array

-initialize `count_in_every_word` array and count how many times a given letter from the `must_have` occurs in a given
  word, can use the `must_have` and transform it into the counts
   [[1, 1, 1], [2, 1, 2], [1, 1, 0]]

- now zip the `must_have`` letters with their counts e
  in every word so with the `count_in_every_word` variabl
  [["c", [1, 1, 1]], ["o", [2, 1, 2]], ["l", [1, 1, 0]]], store the result in `chars_and_counts`
- initialize a `return_array`

- iterate over `letters_and_counts` and push the letter to the 'return_array' as many times as the minimum amount in
  the corresponding array for that letter
=end


def common_chars(arr)
  must_have = arr.first.chars.uniq

  count_in_every_word = must_have.map do |letter|
    arr.map do |word|
      word.chars.count((letter))
    end
  end

  chars_and_counts = must_have.zip(count_in_every_word)
  result = []

  chars_and_counts.each do |array|
    array[1].min.times do |n|
      result << array.first
    end
  end

  result
end

p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'ggrrrrr', 'yyyzzz']) == []