=begin
In this kata you will be given an integer n, which is the number of times that is thrown a coin. You will have to
return an array of string for all the possibilities (heads[H] and tails[T]). Examples:

coin(1) should return {"H", "T"}
coin(2) should return {"HH", "HT", "TH", "TT"}
coin(3) should return {"HHH", "HHT", "HTH", "HTT", "THH", "THT", "TTH", "TTT"}

When finished sort them alphabetically.


INPUT:
0 < n < 18

Careful with performance!! You'll have to pass 3 basic test (n = 1, n = 2, n = 3), many medium tests (3 < n <= 10)
and many large tests (10 < n < 18)

PEDAC
P:
- write a method that takes an int as argument
- the integer stands for the no of times that a coin is thrown
- method returns an array of strings for all the possibilities

E:
coin(1) should return {"H", "T"}
=> 2 possibilities, H and T

coin(2) should return {"HH", "HT", "TH", "TT"}
=> if I throw twice:
H H, - H, T, - T, H - T, T

coin(3) should return {"HHH", "HHT", "HTH", "HTT", "THH", "THT", "TTH", "TTT"}
=> if I throw 3 times:
"HHH", "HHT", "HTH", "HTT", "THH", "THT", "TTH", "TTT"

N:
- repeated_permuation

DS:
- input: int
- middle: array
- output: an array of strings

A:
- start with H for HEAD and T for TAIL in an array
- create all the possible (repated) combinations according to the no of throws

- join inner arrays into strings in order to return an array of strings
=end


def coin(n)
  coins = ['H', 'T']

  coins.repeated_permutation(n).to_a.map(&:join) # repeated permutations. takes an argument and it can be bigger than the caller size
end

p coin(1) == ["H","T"]
p coin(2) == ["HH", "HT", "TH", "TT"]
p coin(3) == ["HHH", "HHT", "HTH", "HTT", "THH", "THT", "TTH", "TTT"]

puts
=begin
In this kata you will be given an integer n, which is the number of times that is thrown a coin. You will have to return an array of string for all the possibilities (heads[H] and tails[T]). Examples:

coin(1) should return {"H", "T"}
coin(2) should return {"HH", "HT", "TH", "TT"}
coin(3) should return {"HHH", "HHT", "HTH", "HTT", "THH", "THT", "TTH", "TTT"}

When finished sort them alphabetically.


INPUT:
0 < n < 18

Careful with performance!! You'll have to pass 3 basic test (n = 1, n = 2, n = 3), many medium tests (3 < n <= 10)
and many large tests (10 < n < 18)

PEDAC
P:
- write a method that takes an int as argument
- the integer stands for the no of times that a coin is thrown
- method returns an array of strings for all the possibilities

E:
coin(1) should return {"H", "T"}
=> 2 possibilities, H and T

coin(2) should return {"HH", "HT", "TH", "TT"}
=> if I throw twice:
H H, - H, T, - T, H - T, T

coin(3) should return {"HHH", "HHT", "HTH", "HTT", "THH", "THT", "TTH", "TTT"}
=> if I throw 3 times:
"HHH", "HHT", "HTH", "HTT", "THH", "THT", "TTH", "TTT"

N:
- repeated_permuation

DS:
- input: int
- middle: array
- output: an array of strings

A:
- start with H for HEAD and T for TAIL in an array
- create all the possible (repated) combinations according to the no of throws

- join inner arrays into strings in order to return an array of strings
=end

# solving with permutations, instead of repeated_permutations requires us to prepare coins because we need to
# pass an argument to permutation and if it's bigger than the coins array, our result will be an empty array
# (and not an error!)

# so here argument cannot be bigger than the caller size!
def coin(n)
  coins = ['H', 'T']
  coins = coins * n # preparing coins


  permutations = []
  coins.permutation(n) { |permutation| permutations << permutation }

  permutations = permutations.uniq.map { |a| a.join }

  permutations.sort
end

p coin(1) == ["H","T"]
p coin(2) == ["HH", "HT", "TH", "TT"]
p coin(3) == ["HHH", "HHT", "HTH", "HTT", "THH", "THT", "TTH", "TTT"]