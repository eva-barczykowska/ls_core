=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

Problem
We're given a string with an assortment of letter and non-letter characters, we need count up the lowercase and uppercase characters and non-letter characters and return a hash with the percentage represented by each lowercase, uppercase, neither in the string.

rULES:
you'll never receive an empty string
the value of each key will be represented as a float which represents the percentage of low,up,neith that are in the string
you might recieve a string with no upper or lower or neither, so a value can be 0.0

Datastructures
input: string
output: hash with three values

Algorithm:
Create a hash to hold the keys the keys and values
break up the string into characters and count the characters type for each characters, updating the total value in the hash. Once we have the value, we'll determine the percentage based off the total size of the string.

Given a String
SET resutl hash {}
count total of each key and set the value to the count/string size
return the result hash


=end

def letter_percentages(string)
  percents = {}
  percents[:lowercase] = string.count('a-z').fdiv(string.size) * 100
  percents[:uppercase] = string.count('A-Z').fdiv(string.size) * 100
  percents[:neither] = 100 - (percents[:lowercase] + percents[:uppercase])
  percents
end

p letter_percentages('abCdef 123')  == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }


# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# PEDAC
# Problem
# -I have a string with 1 or more space separated words
# -I need to return a hash
# -The hash needs to tell me the number of words of different sizes
# -the key is number is characters
# -the value is how many words with this number of characters

# Data Structures
# input: string
# output: hash

# Algorithm
# if str is empty, return an empty hash
# divide the string on a space/split
# look at every words and calculate its characters
# add the result as a key to the hash
# add value as one
# if the key already exists, add 1 to the value
# it the key doesn't exist, I have to put it in the hash
# return the hash


# Code

def word_sizes(str)
  h = {}
  if str.empty?
    return {}
  elsif
   arr = str.split(" ")
   arr.each do |word|
     if !h.include?(word.size)
      h[word.size] = 1
     else
      h[word.size] += 1
     end
    end
  end
  h
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
p word_sizes('Hello') == {5 => 1}

=begin
Unlucky Days
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

Examples:

Copy Code
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
Hint

Ruby's Date class may be helpful here.
Look at how to initialize a Date object
Look at the friday? method

(Date.new(2012, 01, 01)..Date.new(2012, 01, 30)).each do |date|
  # Do stuff with date
end
=end
require 'date'
def friday_13th(date)
  count = 0
  start_date = Date.new(date,01, 01)
  end_date = Date.new(date,12,31)
  (start_date..end_date).each do |date|
    if date.friday? && date.mday == 13
      count += 1
    end
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

=begin
Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.
=end

# How to exclude non-letters

# [^.] # any character not a period

def word_sizes(str)
  str = str.gsub(/[^A-Za-z \s]/, "") #remove all characters which are not letters or spaces
  h = {}
  if str.empty?
    return {}
  elsif
   arr = str.split(" ")
   arr.each do |word|
     if !h.include?(word.size)
       h[word.size] = 1
     else
       h[word.size] += 1
     end
    end
  end
  h
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

def word_sizes(str)
  h = {}
  if str.empty?
    return {}
  else
    arr = str.split(" ")
    arr.each do |word|
      word = word.gsub(/[^A-z]/, '')
      if !h.include?(word.size)
        h[word.size] = 1
      else
        h[word.size] += 1
      end
    end
  end
  h
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
