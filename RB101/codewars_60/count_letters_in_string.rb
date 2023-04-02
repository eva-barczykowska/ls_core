# # 1.Count letters in string
# # (https://www.codewars.com/kata/5808ff71c7cfa1c6aa00006d/train/ruby)
# # 6 kyu

# =begin
# Count letters in string
# In this kata, you've to count lowercase letters in a given string
# and return the letter count in a hash with 'letter' as key and count as 'value'.
# The key must be 'symbol' instead of string in Ruby.

# Example:

# letter_count('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
# =end
# PEDAC TEMPLATE

# ************** Problem **************
# -write a method that takes a string as an argument
# -the method returns the lowercase letter count in a hash
# -in the hash letter will be the key and count will be the value
# -the key must be a symbol, not a string

# Questions:

# ************** Examples **************
# letter_count('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# ************** Data Structures **************
# input: a String
# output: a hash

# ************** Algorithm **************
# -initialize a `result` variable and point it to an empty hash
# -convert string argument to an array of characters
# -iterate over the array of characters and:
# -look at the current character
# -if the current character downcased and converted to a symbol is not yet a key in my result hash, then I will add it as a symbol
# -else, if it is already there, I will increase the count (value)
# -implicitly return the `result` hash

# DRY
# ************** Code **************

def letter_count(str)
  result = {}
  arr = str.chars.reject { |char| char == char.upcase }
  arr.each do |char|
    char = char.to_sym # to avoid DRY change char to symbol right now
    if !result.has_key?(char)
      result[char] = 1
    else
      result[char] += 1
    end
  end
  result
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('codewAars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

puts
# solve it with each_with_object

def letter_count(string)
  array = string.chars.sort
  new_hash = array.each_with_object(Hash.new(0)) do |char, hash|
    hash[char] += 1
  end
  new_hash = new_hash.delete_if {|k, _| k == k.upcase }
  new_hash.transform_keys { |key| key.to_sym }
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('codewAars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

puts
puts "shorter solution:"

def letter_count(string)
  array = string.chars.sort
  array.each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }.transform_keys { |key| key.to_sym }.delete_if {|k, _| k == k.upcase }
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('codewAars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

puts
puts "one-liner:"

def letter_count(string)
  string.chars.tally.transform_keys { |key| key.to_sym }.delete_if {|k, _| k == k.upcase }
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('codewAars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

puts

def letter_count(word)
  word.chars.each_with_object(Hash.new(0)) do |char, hash|
    hash[char.to_sym] += 1
  end
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

puts

def letter_count(word)
  return_hash = word.chars.sort.each_with_object(Hash.new(0)) do |char, hash|
    hash[char.to_sym] += 1
  end
  return_hash.sort.to_h
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
