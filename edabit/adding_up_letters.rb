=begin
Create a function add_letters that takes a list/array of letters a, and returns the "sum" of them.

To add two letters, take their number value, add them together, and convert it back together.
For example, a would be 1, b would be 2, etc. So to add b and c, take 2 + 3 = 5,
and then get the fifth letter of the alphabet (e).

So then d + e + f would be 4 + 5 + 6 = 15, and the fifteenth letter is o, so that's what you return.

Letters can also wrap. Like with y + c, that's 25 + 3 = 28, which doesn't exist.
Consider that the 27th letter just wraps around and ends back up at a. With this logic, y + c = b.
Don't just do 27 = 1 though, because you could end up with a much higher sum like 70.

add_letters(["a"]) ➞ "a"
add_letters(["a", "b"]) ➞ "c"
add_letters(["a", "b", "c"]) ➞ "f"
add_letters(["a", "b", "c", "d", "e", "f"]) ➞ "u"
add_letters(["y", "a"]) ➞ "z"
add_letters(["y", "c"]) ➞ "b"
add_letters(["z", "a"]) ➞ "a"
add_letters(["x", "y", "z"]) ➞ "w"
add_letters([]) ➞ "z"

Don't forget to return the result.
An empty array should return z. The logic behind this is that if you get a sum of 0,
then wrap it all the way around backwards (since the 0th letter doesn't exist), giving you 26 which = z.
All letters given will be lowercase.

P:
- input is an array of letters
- we calculate their value based on the alphabet so a = 1, b = 2 etc.
- we add letters from the array and when we get the sum, we retrieve the letter at the index, which is equal to sum
- but if the sum is greater than 26, we start counting from 1(a) again

-only lowercase letters are going to be used in the input

- an empty array returns z

Examples:
add_letters(["a"]) == "a"
=> a = 1 and so the first letter of the alphabet is a

add_letters(["a", "b"]) == "c"
1 + 2 = 3 so letter at the 3rd place in the alphabet is c

add_letters(["a", "b", "c"]) == "f"
1+2+3 = 6 so the letter the 6th position is f

add_letters(["a", "b", "c", "d", "e", "f"]) == "u"
1+2+3+4+5+6=21 sp the letter at the 21st position is u

add_letters(["y", "a"]) == "z"
25+1 = 26, so letter which is letter number 26 in the alphabet, which is the last letter, letter z

add_letters(["y", "c"]) == "b"
25+1 = 28, so we subtract 28 - 26 (always when the nubmer > 26) and retrieve the letter at the result so at 2 so b

add_letters(["z", "a"]) == "a"
26+1 = 27, same idea of substraction like above

add_letters(["x", "y", "z"]) == "w"
24+25+26 = 75-26-26 so -26 until you get a number less or equal to 26, in this case 23 so letter at position 23 is w

add_letters([]) == "z"
empty array gives us z

A:
- initialize `alphabet` and create it by combining numbers 1-26 and letters "a".."z"

- calculate the sum of the input array letters- how?
- via the value, retrieve the key from the hash and add it to a calculation result
- sum the retrieved keys/numbers from the hash

-once you have the sum, if it is more than 26, keep subtracting 26 from it until you get number that is equal or smaller
 than 26

-then, based on that number, retrieve the correct letter from the array

-if the number is less or equal to 26, retrieve the correct letter from the hash, based on the key/integer
=end
def add_letters(arr)
  return "z" if arr.empty?

  alphabet = ("a".."z").zip(1..26).to_h

  sum = arr.map { |letter| alphabet[letter] }.sum

  while sum > 26
    sum = sum - 26
  end

  alphabet.each do |k, v|
    return k if v == sum
  end
end

p add_letters(["a"]) == "a"
p add_letters(["a", "b"]) == "c"
p add_letters(["a", "b", "c"]) == "f"
p add_letters(["a", "b", "c", "d", "e", "f"]) == "u"
p add_letters(["y", "a"]) == "z"
p add_letters(["y", "c"]) == "b"
p add_letters(["z", "a"]) == "a"
p add_letters(["x", "y", "z"]) == "w"
p add_letters([]) == "z"