=begin
# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

PEDAC
P:
- write a method that takes a string
- method returns the same sequence of characters, with every 2nd character in every 3rd word upcased, other characters remain the same

# Examples:
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
'Lorem Ipsum is simply dummy text of the printing'
              |               |           |
'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
=> word index 2, always count to 2 and work with the 2nd word
=> in that word, start with index 1(odd) and upcase every odd character

p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".
DS:
input: str
output: new str

A:
- change word to array
- initialize `return_array` to []

- initialize an array of `special_counters`, where you start with 2 and go up to arr.size
- save all those numbers

- iterate over the array using a loop and `counter`
- if the index of word at the current counter is included in `special_counters`
- change that word to array of characters
- iterate over this array of characters and get access to index
- upcase every character at the odd index

- else add word to `return_array` just as it is

- join the array on a space in order to return a string

N:
- each with index
=end

def to_weird_case(str)
  return_array = []

  arr = str.split

  special_counters = []
  counter = 2
  while counter < arr.size
    special_counters << counter
    counter += 3
  end

  special_counters

  counter = 0
  while counter < arr.size
    if special_counters.include?(counter)
      return_array << arr[counter].chars.each_with_index { |ch, index| ch.upcase! if index.odd? }.join
    else
      return_array << arr[counter]
    end
    counter += 1
  end

  return_array.join(" ")
end
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
    'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# 'Lorem Ipsum is simply dummy text of the printing'
#               |               |           |
# 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# => word index 2, always count to 2 and work with the 2nd word
# => in that word, start with index 1(odd) and upcase every odd character

p to_weird_case(
    'It is a long established fact that a reader will be distracted') ==
    'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
    'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
    'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'