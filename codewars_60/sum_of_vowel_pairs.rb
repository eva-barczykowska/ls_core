=begin
Problem 2
Create a function sum_of_vowel_pairsthat takes a sentence and returns the total sum of the lengths of all word pairs where both words start with a vowel (a, e, i, o, u).

# Test cases
puts sum_of_vowel_pairs("An apple a day keeps the doctor away") == 36 
puts sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156

P: 
-write a method that takes a str as an arg
-str returns total sum of the lengths of all word pairs where both words start with a vowel

E:
p sum_of_vowel_pairs("An apple a day keeps the doctor away") == 36
an
apple
a
away

p sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156
every
engineer
enjoys
innovative
algorithms

Notes
-find words that start with a vowel
-make combinations of 2/pairs
-calculate their lenghs
arr = %(an apple a away).split
p arr.combination(2).to_a.flatten.join.size
# p sum_of_vowel_pairs("An apple a day keeps t
arr = %(an apple a away).split
arr = %(every engineer enjoys innovative algorithms).split
p arr.combination(2).to_a.flatten.join.size

A:
-change str to arr
-find words that start with a vowel (define vowels)
-make combinations of 2/pairs
-calculate the lenghs of that array, flattned and joined into 1 string 
-return the size
=end

def sum_of_vowel_pairs(str)
  arr = str.split.select { |word| word.start_with?(/[aeouiAEOUI]/) }
 
  arr.combination(2).to_a.flatten.join.size
 end
 
 p sum_of_vowel_pairs("An apple a day keeps the doctor away") == 36 
 p sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156
 
 puts
 # if combination not allowed
 def sum_of_vowel_pairs(str)
   arr = str.split.select { |word| word.start_with?(/[aeouiAEOUI]/) }
  
   last_index = arr.size - 1
   combinations = []
 
   (0..last_index).each do |start|
     (start + 1..last_index).each do |finish|
       combinations << [arr[start], arr[finish]]
     end
   end
 
   combinations.flatten.join.size
  end
  
  p sum_of_vowel_pairs("An apple a day keeps the doctor away") == 36 
  p sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156