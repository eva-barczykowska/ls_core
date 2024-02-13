=begin
[Train: Sort Arrays (Ignoring Case) \| Codewars](https://www.codewars.com/kata/51f41fe7e8f176e70d0002b9/train/ruby)
6 kyu
Sort the given strings in alphabetical order, case insensitive. For example:

["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

A:
- sort this array according to the first character of each string as if all the strings were starting with lower
case letters only NO NO NO
=end

def sortme(arr)
  arr.sort_by { |str| str[0].downcase } #doesn't pass all tests on codewars because it's the WHOLE str that needs to be downcased
end
p sortme(["Hello", "there", "I'm", "fine"]) #== ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"])# == ["a", "Ba", "be", "C", "d"]
p sortme(["C", "d", "a", "Ba", "be", "Bc"])# == ["a", "Ba","Bc", "be", "C", "d"] # my code fails!!!, Ekerin's doesn't
p sortme(["CodeWars"]) #== ["CodeWars"]

# ["a", "Ba","Bc", "be", "C", "d"] expected
# ["a", "Ba", "be", "Bc", "C", "d"] actual
# what comes first? capital letters
# it's comparing b to b and they're equal so order won't change
#
# it has to be:
def sortme(arr)
  arr.sort_by { |str| str.downcase } #doesn't pass all tests on codewars because it's the WHOLE str that needs to be downcased
end
p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["C", "d", "a", "Ba", "be", "Bc"]) == ["a", "Ba","Bc", "be", "C", "d"] # my code fails!!!, Ekerin's doesn't
p sortme(["CodeWars"]) == ["CodeWars"]

