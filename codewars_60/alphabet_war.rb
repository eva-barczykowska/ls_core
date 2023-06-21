# https://www.codewars.com/kata/59377c53e66267c8f6000027/ruby

# Write a method that accepts fight string that consists of only small letters and return who wins the fight. When the left side wins return Left side wins!, when the right side wins return Right side wins!, in other case return Let's fight again!.

=begin

The left side letters and their power:

 w - 4
 p - 3
 b - 2
 s - 1

 The right side letters and their power:

 m - 4
 q - 3
 d - 2
 z - 1

Examples:

AlphabetWar("z");        //=> Right side wins!
AlphabetWar("zdqmwpbs"); //=> Let's fight again!
AlphabetWar("zzzzs");    //=> Right side wins!
AlphabetWar("wwwwwwz");  //=> Left side wins!

PEDAC TEMPLATE

************** Problem **************
-write a method that accepets a `fight string`
-the argument is only lowercase letters
-the return value is:
Left side wins! --- if left side wins
Right side wins! --- if right side wins
Let's fight again! --- if no one wins

the values of letters:
The left side letters and their power:

 w - 4
 p - 3
 b - 2
 s - 1

 The right side letters and their power:

 m - 4
 q - 3
 d - 2
 z - 1

Questions:

************** Examples **************

AlphabetWar("z");        //=> Right side wins!
AlphabetWar("zdqmwpbs"); //=> Let's fight again!
 w-4, p-3, b-2, s-1 => 10           z-1, d-2, q-3, m-4 => 10
AlphabetWar("zzzzs");    //=> Right side wins!
AlphabetWar("wwwwwwz");  //=> Left side wins!
************** Data Structures **************
input: a string
output: a string
************** Algorithm **************
-differentiate between left and right side

-initiliaze a left hash with keys as letters
-initiliaze a right hash with keys as letters

-if size is 1, check the letter value  and return the correct string according to which side won

-divide the string into an array if its size is more than 1

create left result - does not need to be a hash probably
craete right result

iterate though the array
if a letter belongs to is a key in the left hash, increase left (hash) result value
elsif the letter is a key in the right hash, increase the right (hash) result value

check which hash values sum is greater

if left, return Left side wins!

if right, return Right side wins!

else 
  return Let's fight again!

************** Code **************
=end

LEFT_LETTERS = { w: 4, p: 3, b: 2, s: 1}
RIGHT_LETTERS = { m: 4, q: 3, d: 2, z: 1}

def alphabet_war(str)
  left_result = []
  right_result = []
  array = str.split("")
  array.each do |letter|
    if LEFT_LETTERS.include?(letter.to_sym)
      left_result << LEFT_LETTERS[letter.to_sym]
    else
      RIGHT_LETTERS.include?(letter.to_sym)
      right_result << RIGHT_LETTERS[letter.to_sym]
    end
  end

  left_result = left_result.sum
  right_result = right_result.sum

  if left_result > right_result
    return "Left side wins!"
  elsif right_result > left_result
    return "Right side wins!"
  else
    return "Let's fight again!"
  end

end

p alphabet_war("z") == "Right side wins!"
p alphabet_war("zdqmwpbs") == "Let's fight again!"
p alphabet_war("wq") == "Left side wins!"
p alphabet_war("zzzzs") == "Right side wins!"
p alphabet_war("wwwwww") == "Left side wins!"

puts

# debugging, why it didn't work
LEFT = { w: 4, p: 3, b: 2, s: 1}
RIGHT = { m: 4, q: 3, d: 2, z: 1}

def alphabet_war(str)
  left_res = 0
  right_res = 0

  str.split("").each { |let|
 LEFT.include?(let.to_sym) ? left_res += LEFT[let.to_sym] : right_res += RIGHT[let.to_sym] }

  return "Let's fight again!" if left_res == right_res

  left_res > right_res ? "Left side wins!" : "Right side wins!"
end

p alphabet_war("z") == "Right side wins!"
p alphabet_war("zdqmwpbs") == "Let's fight again!"
p alphabet_war("wq") == "Left side wins!"
p alphabet_war("zzzzs") == "Right side wins!"
p alphabet_war("wwwwww") == "Left side wins!"

