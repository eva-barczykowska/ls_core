=begin
Create a function that takes in an array (slot machine outcome) and returns true if all elements in the array
are identical, and false otherwise. The array will contain 4 elements.
testJackpot(["@", "@", "@", "@"]) ➞ true

testJackpot(["abc", "abc", "abc", "abc"]) ➞ true

testJackpot(["SS", "SS", "SS", "SS"]) ➞ true

testJackpot(["&&", "&", "&&&", "&&&&"]) ➞ false

testJackpot(["SS", "SS", "SS", "Ss"]) ➞ false

P:
- write a method that takes an array of 4 elements
- method returns true or false, depending if all of them are same

E:
test_jackpot(["@", "@", "@", "@"]) == true
-true because all 4 are equal

test_jackpot(["abc", "abc", "abc", "abc"]) == true
-true because all 4 are equal

test_jackpot(["SS", "SS", "SS", "SS"]) == true
- -true because all 4 are equal

test_jackpot(["&&", "&", "&&&", "&&&&"]) == false
- false because they are of different size

DS:
- input: array
- output: true or false

Algorithm:
- out of the arg array, create an array of unique elements
- if that array's size is equal to 1, return true
- else return false


=end

def test_jackpot(arr)
  arr.uniq.size == 1 ? true : false
end
p test_jackpot(["@", "@", "@", "@"]) == true
p test_jackpot(["abc", "abc", "abc", "abc"]) == true
p test_jackpot(["SS", "SS", "SS", "SS"]) == true
p test_jackpot(["&&", "&", "&&&", "&&&&"]) == false
p test_jackpot(["SS", "SS", "SS", "Ss"]) == false