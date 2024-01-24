=begin
We want to mutate a string according to a code. In this code, given the command `"9a"`, we should change the character at index 9 of the string to `"a"`.
Write a method that takes a string and a list of these commands, and mutates the string accordingly.

PEDAC
Problem:
- write a method that takes  str and a list of commands
- method mutates the str argument according to the a code
- eg. 9a - this means replace index 9 with str 'a'

Examples:
test_1 = "dog"
encode!(test_1, ["0f"])
p test_1 == "fog"
=> we change the char at index 0 to the str 'f'

test_2 = "parrot"
encode!(test_1, ["0m", "3m", "8m"])
p test_2 == "marmot"
=>parrot
  012345
  m  m -> index 8 is not used/mutated

test_3 = "weimaraner"
encode!(test_1, ["0p", "2t", "3p", "6t"])
p test_3 == "petpartner"

Data Structures:
input: string, an array of strings
middle: Take each string instruction e.g. "Op" and break it into a two-element array, where the first element is an integer of the string position to mutate, and the second sele
output: mutated string

Notes:
[]=
-find required index
-each_char

ref = arr.map do |str|
str.split('')
end

arr.map { |str| [str[0].to_i, str[1]] }


[[0, "p"], [2, "t"], ]

Algorithm:
- change the 2nd arg so that it looks like this [[0, "p"], [2, "t"]], save it to `reference`

- iterate over the`reference` array?

- for each inner array, if the 1st element/the is not nil, change the char to the target char

- return the str
=end
def encode!(str, reference)
  reference = reference.map { |str| str.split('') }

  reference.each do |ref|
    index = ref.first.to_i
    target_letter = ref.last

    unless str[index].nil?
      str[index] = target_letter
    end
  end
  str
end


test_1 = "dog"
encode!(test_1, ["0f"])
p test_1 == "fog"

test_2 = "parrot"
encode!(test_2, ["0m", "3m", "8m"])
p test_2 == "marmot"

test_3 = "weimaraner"
encode!(test_3, ["0p", "2t", "3p", "6t"])
p test_3 == "petpartner"

puts

def encode!(str, reference)
  reference = reference.map { |str| str.split('') }

  reference.each do |ref|
    unless str[ref.first.to_i].nil?
      str[ref.first.to_i] = ref.last
    end
  end
end

test_1 = "dog"
encode!(test_1, ["0f"])
p test_1 == "fog"

test_2 = "parrot"
encode!(test_2, ["0m", "3m", "8m"])
p test_2 == "marmot"

test_3 = "weimaraner"
encode!(test_3, ["0p", "2t", "3p", "6t"])
p test_3 == "petpartner"


