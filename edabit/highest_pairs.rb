=begin
You will be given a collection of five cards (representing a player's hand in poker).
If your hand contains at least one pair, return an array of two elements: true and the card number of the highest pair
(trivial if there only exists a single pair).
Else, return false.
PEDAC
- you have an array of 5 cars passed as an argument to a method
- return true and the number of the card if the array contains at least 1 pair
- if it doesn't, return false

Examples
highest_pair(["A", "A", "Q", "Q", "6" ]) ➞ [true, "A"]
=> A is the pair, return [true, "A"]
highest_pair(["J", "6", "3", "10", "8"]) ➞ false
=> no pair
highest_pair(["K", "7", "3", "9", "3"]) ➞ [true, 3]
=> true, 3
highest_pair(["K", "9", "10", "J", "Q"]) ➞ false
=> no pair
highest_pair(["3", "5", "5", "5", "5"]) ➞ [true, 5]
=> true, 5
Notes
Hands with three or more of the same card still count as containing a pair (see the last example).

DS
input: array of cards
output: false of an array [true < name_of_card]

A:
- I have to also know which pair is the highest, I could store this in an array and work with index:
["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2", "1" ]

- iterate over the array and count the elements, store the count in a hash `count`

- iterate over cards element and build a hash counting each element and adding it as a value to the card from `card`
  array as a key
- now I have an array with keys-cards and values-occurrences

- iterate over the result hash
- if count has a value that is 2 or more, return that true and the key-card for that value in an array:

- else return false

- the great idea here is building that hash from cards in order of importance, then I can just easily pick and
  return the card/key from the hash, based on the value being a pair
=end

CARDS = ["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2", "1" ]

def highest_pair(arr)
  result = {}
  count = arr.tally

  CARDS.each do |card|
    if arr.include?(card)
      result[card] = arr.count(card)
    end
  end
  # p result
  # {"A"=>2, "Q"=>2, "6"=>1}, {"K"=>1, "9"=>1, "7"=>1, "3"=>2}, {"K"=>1, "Q"=>1, "J"=>1, "10"=>1, "9"=>1}
  result.each do |card, pairs|
    if pairs >= 2
      return [true, card]
    end
  end

  false
  end

p highest_pair(["A", "A", "Q", "Q", "6" ]) == [true, "A"]

p highest_pair(["J", "6", "3", "10", "8"]) == false

p highest_pair(["K", "7", "3", "9", "3"]) == [true, 3]

p highest_pair(["K", "9", "10", "J", "Q"]) == false

p highest_pair(["3", "5", "5", "5", "5"]) == [true, 5]