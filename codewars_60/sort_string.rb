=begin

Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.

Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).


If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.

P:
- sort the arg str

- there will be 1 number in every str part/word (not 0)

- the number is the target index that this word should have in the result

- so we need to reorganize this string according to those numbers, starting with 1

- if input empty, return empty str


E:
p sort_string("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
=> is2 is second, THis1s is first, etc.

p sort_string("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"

p sort_string("") == ""
=> empty str is returned

Idea 1
Split and iterate over the words array with index and append words to `result` array according to the index, so if a word contains index 0, append it, then index 1,etc. Join the string and return it.

Idea 2
Sort the characters of each word by min value character(which will be 1, 2, 3...)

Idea 3
Iterate over the string with a loop and counter, starting 1, and if the word contains the counter, then add it to the `result`

DS:
input: str
middle: array
output: str

A:

- change the str into an array

- initialize `result`

- iterate over the words, finding a number that is index

- from 1 to string size iterate over the words and insert them into the `result`

- join and return `result`

=end

def sort_string(str)
  arr = str.split

  result = []

  (1..arr.size).each do |number|
    arr.each do |word|
      result << word if word.include?(number.to_s)
    end
  end

  result.join(" ")
end

p sort_string("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p sort_string("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p sort_string("") == ""

puts

def order(words)
  words.split.sort_by { |w| w.chars.min }.join(" ") # brilliant
end

p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""

puts

def order(words)
  arr = words.split(" ")
  hash = {}

  int = "123456789"

  arr.each do |word|
    word.each_char do |char|
      if int.include?(char)
        hash[word] = char
      end
    end
  end

  sorted = hash.sort_by { |k, v| v } # [["Thi1s", "1"], ["is2", "2"], ["3a", "3"], ["T4est", "4"]]

  # sentence = sorted.map { |k, v| k } # like we want but still an array

  # sentence.join(" ")
end

p order("is2 Thi1s T4est 3a") #== "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""

puts

def order(string)
  return "" if string.empty?
 
  result = []

  counter = 1
  index = 0

  words = string.split

  loop do
    words.each do |element|
      result << element if element.include?(counter.to_s)
    end

    counter += 1
    index += 1
    break if index == words.size
  end

result.join(" ")
end

p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""

# refactored, break up
puts

def order(string)
  result = []
  counter = 1
 
  words = string.split

  loop do
    words.each do |element|
      result << element if element.include?(counter.to_s) # very interesting how this works: (see down)

      p "looking for string #{counter} in all the words in the array"

      p "counter is #{counter}, result is #{result}" # this is result after EVERY WORD

    end

    # p result # this is result after each iterated through ALL the words
    counter += 1
    break if counter > words.size
  end

result.join(" ")
end

order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"

# each iteration (4 iterations because the array has 4 words)

# LOOKING FOR 1
# []        # 1st word is taken into consideration, nothing gets pushed to `result`
# ["Thi1s"] # 2nd word is taken into consideration, because it includes "1" soIT GETS PUSHED TO `result`
# ["Thi1s"] # 3rdt word is taken into consideration, nothing gets pushed to `result`
# ["Thi1s"] # 4th word is taken into consideration, nothing gets pushed to `result`

 

# LOOKING FOR 2
# ["Thi1s", "is2"] # 1st word is taken into consideration, it includes "2" so IT GETS PUSHED `result`
# ["Thi1s", "is2"] # 2nd word is taken into consideration, nothing gets pushed to `result`
# ["Thi1s", "is2"] # 3rd word is taken into consideration, nothing gets pushed to `result`
# ["Thi1s", "is2"] # 4th word is taken into consideration, nothing gets pushed to `result`
# -end of 2nd iteration of each

# LOOKING FOR 3
# ["Thi1s", "is2"]
# ["Thi1s", "is2"]
# ["Thi1s", "is2"]
# ["Thi1s", "is2" "3a"]  # 4th word is taken into consideration, it includes "3" so IT GETS PUSHED to `result`

 
# LOOKING FOR 4
# ["Thi1s", "is2", "3a"] #each is looking at 'is2', "4" is not there so the words doesn't get pushed to `result`
# ["Thi1s", "is2", "3a"]
# ["Thi1s", "is2", "3a", T4est], #each is looking at 'T4est', "4" is there so 'T4est' GETS PUSHED to result
# ["Thi1s", "is2", "3a", T4est]


# very interesting how this works:

# main point is that it goes through all the words and adds the right word in the right place. It finds
# the right word thanks to the include? method and it goes through ALL THE WORDS at EVERY LOOP ITERATION.

# goes through all the array asking which words has 1 converted to str (because we're searching within the str so we need to convert int to str)

# it finds it and adds to the `result`

# we increase the counter

# we repeat the search but now asking which of the words contains 2 converted to str. etc.

puts

def order(words)
  words.split(' ').sort_by { |word| word.delete('A-z') }.join(' ')
end

p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""