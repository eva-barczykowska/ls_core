#Given an array of integers, find the one that appears an odd number of times.

#There will always be only one integer that appears an odd number of times.
#Examples
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).
# P:
#
# -write a method that takes an array of integers as an argument
# -the method returns the integers that appears an odd number of times
# -there will be always only one such integer
# E:
#
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).
#
# DS:
# input is an array of integers
# ouput is an integer
#
# A:
# -count how many times every integer appears and store results in a hash
# -this will give me keys as integers and values as the count: how many times a certain int appears
# -retrieve the odd value from the values - there will be only 1 (BUT IT WILL BE AN ARRAY!!!)
# -convert that 1-element array to str and then to int
# -now that I have int to work with, using that int retrieve the key that belongs to that int

def find_it(arr)
  hsh = {}
  arr.each { |int| hsh[int] = arr.count(int) }

  odd_value = hsh.values.select { |v| v.odd? }.join.to_i

  hsh.each do |k, v|
    return k if v == odd_value
  end

end

p find_it([7]) == 7
p find_it([0]) == 0
p find_it([1,1,2]) == 2
p find_it([0,1,0,1,0]) == 0
p find_it([1,2,2,3,3,3,4,3,3,3,2,2,1]) == 4
#
p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) ==  5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10

puts
#Given an array of integers, find the one that appears an odd number of times.

#There will always be only one integer that appears an odd number of times.

#Examples
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

# ************** Problem **************
# -write a method that takes an array of integers as an argument
# -find the integer that appear an odd number of times
# -there will be only 1
# ************** Examples **************
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

# ************** Data Structures **************
# Input: array

# Output: integer
# ************** Notes **************
# tally / hash
# ************** Algorithm **************
# -count each integer and store in a hash how many times it appears in the argument array
# -key: integer, value: how many times it appears
# -iterate over the values and extract the odd value

# -without tally
# -initialize an empty hash
# -iterate over the Array
# -if the number you're currently iterating doesn't exisit as a key in the hash, add it
# -if it exists, increase its count by 1

# -iterate over the hash, select the key for the value which is odd
# ************** Code **************

# ************** Refactor **************

# def find_it(seq)
#   hash = seq.tally.each { |k, v| return k if v.odd? }
# end


def find_it(seq)
  hash = {}

  seq.each do |number|
    if !hash.include?(number)
      hash[number] = 1
      # p hash
    else
      hash[number] += 1
    end
  end

  hash.each { |key, value| return key if value.odd? }
end

p find_it([7]) == 7
p find_it([0]) == 0
p find_it([1,1,2]) == 2
p find_it([0,1,0,1,0]) == 0
p find_it([1,2,2,3,3,3,4,3,3,3,2,2,1]) == 4

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) ==  5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10
