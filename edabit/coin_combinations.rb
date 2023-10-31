=begin
Given an amount of money and an array of coins denominations, create a function that counts how many different ways
you can make change with the given money.

Order of coins does not matter (i.e. 1+1+2 == 2+1+1).
You have an infinite amount of coins.

coins_combinations(4, [1, 2]) == 3
# 1+1+1+1 = 4
# 1+1+2 = 4
# 2+2 = 4

coins_combinations(10, [5, 2, 3]) == 4
coins_combinations(11, [5, 7]) == 0

P:
- write a method that takes 2 arguments
- 1st is amount of money, i.e. 10
- 2nd is is an array with coin denominations, i.e. [5, 2, 3]
- return how many different ways we can achieve this first number with the given money

E:
coins_combinations(4, [1, 2]) == 3
# 1+1+1+1 = 4
# 1+1+2 = 4
# 2+2 = 4

coins_combinations(11, [5, 7]) == 0
=>none because they cannot be combined in any way to give the expected sum of 11

coins_combinations(10, [5, 2, 3]) == 4
5+2+3 = 10
5+5 = 10
2+2+2+2+2 = 10
3+3+2+2 = 10
=> these are 4 combinations

coins_combinations(11, [5, 7]) == 0

DS:
- input: sum, array of coins
- number of possible unique combinations

A:
- how to take any of the numbers from the array to make the required sum???
=end

# def coins_combinations(sum, array)
#
# end
# p coins_combinations(10, [5, 2, 3]) #== 4
# # p coins_combinations(11, [5, 7]) == 0
def coins_combinations(amount, coins)
  # Initialize an array to store the number of combinations for each amount from 0 to amount
  combinations = Array.new(amount + 1, 0) # produces [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] for amount: 10

  # There is one combination to make change for 0 (no coins used)
  combinations[0] = 1

  # Iterate through each coin denomination
  coins.each do |coin|
    # Update the combinations array for amounts from coin to amount
    (coin..amount).each do |i| # coins are [5, 2, 3] and amount is 10
      combinations[i] += combinations[i - coin]
    end
  end

  # The last element of the combinations array contains the result
  return combinations[amount]
end

# Example usage:
p coins_combinations(10, [5, 2, 3]) == 4
p coins_combinations(4, [1, 2]) == 3
p coins_combinations(11, [5, 7]) == 0

puts "Ilke's solution"
=begin
Algo:
- initialize smallest_size variable assigned to input integer / input_array.max
- initialize largest_size variable assigned to input integer / input_array.min
- initialize an empty storage array
- iterate through a range starting from smallest_size to largest_size (size)
  - get "repeated combinations" of input array based on current size
  - add to storage array
- iterate through storage array and select sub_arrays that when summed equal the input integer
- return the count of selected sub_arrays in the storage array
=end

def coins_combinations(money, coins)
  possible_combinations = []
  smallest_combo = money / coins.max
  largest_combo = money / coins.min

  (smallest_combo..largest_combo).each do |size|
    possible_combinations << coins.repeated_combination(size).to_a
  end

  possible_combinations.flatten(1).select do |combination|
    combination.sum == money
  end.size
end

p coins_combinations(4, [1, 2]) == 3
p coins_combinations(10, [5, 2, 3]) == 4
p coins_combinations(11, [5, 7]) == 0
p coins_combinations(10, [5, 2]) == 2
p coins_combinations(10, [5, 2, 4, 1]) == 17

puts "rewritten"
def coins_combinations(target, coins)
  possible_combinations = []
  smallest_combination = target / coins.max # so 4/2 in case of first test case (4, [1, 2]) => 2
  largest_combination = target / coins.min # so 4/1 in case of first test case (4, [1, 2])  => 4

  (smallest_combination..largest_combination).each do |size| # so effectively from (2..4).each do...
    possible_combinations << coins.repeated_combination(size).to_a # this method is amazing!
  end
  p possible_combinations
  # [[[1, 1], [1, 2], [2, 2]], [[1, 1, 1], [1, 1, 2], [1, 2, 2], [2, 2, 2]], [[1, 1, 1, 1], [1, 1, 1, 2], [1, 1, 2, 2], [1, 2, 2, 2], [2, 2, 2, 2]]]

  possible_combinations.flatten(1).select do |combination|
    combination.sum == target
  end.size
end

p coins_combinations(4, [1, 2]) == 3
# p coins_combinations(10, [5, 2, 3]) == 4
# p coins_combinations(11, [5, 7]) == 0
# p coins_combinations(10, [5, 2]) == 2
# p coins_combinations(10, [5, 2, 4, 1]) == 17
# p coins_combinations(1, [1, 2]) == 1


puts "my glorious attempt lol"
# A:
# - get all combinations and store them in a array - how?
# - how many combinations should I get - all of the possible combinations but unique, e.g. only [1, 2], [2, 1] is then not needed
# - for example for [1, 2], all combinations will be
# [[[1, 1], [1, 2], [2, 2]], [[1, 1, 1], [1, 1, 2], [1, 2, 2], [2, 2, 2]], [[1, 1, 1, 1], [1, 1, 1, 2], [1, 1, 2, 2], [1, 2, 2, 2], [2, 2, 2, 2]]]
# - number of combinations depends on the size of the input array
# - we need to iterate, outer loop starts from element at the index 0 and continues to the last element inclusively
# - then return the size of that array
#
def coins_combinations(target, coins)
  possible_combinations = []

  smallest_combination = target / coins.max # so 4/2 in case of first test case (4, [1, 2]) => 2
  largest_combination = target / coins.min # so 4/1 in case of first test case (4, [1, 2])  => 4

  (smallest_combination..largest_combination).each do |size| # so effectively from (2..4).each do...
    coins.repeated_combination(size) { |combination| possible_combinations << combination if combination.sum == target }
  end

  possible_combinations.size
end

p coins_combinations(4, [1, 2]) == 3
p coins_combinations(10, [5, 2, 3]) == 4
p coins_combinations(11, [5, 7]) == 0
p coins_combinations(10, [5, 2]) == 2
p coins_combinations(10, [5, 2, 4, 1]) == 17
p coins_combinations(1, [1, 2]) == 1

# Allister
puts "Allister"
def triplets(arr)
  triplets = []
  0.upto(arr.size - 1) do |first_ele|
    (first_ele + 1).upto(arr.size - 1) do |second_ele|
      (second_ele + 1).upto(arr.size - 1) do |third_ele|
        triplets << [arr[first_ele], arr[second_ele], arr[third_ele]]
      end
    end
  end
  triplets
end

def pairs(arr)
  pairs = []
  0.upto(arr.size - 1) do |first_ele|
    (first_ele + 1).upto(arr.size - 1) do |second_ele|
      pairs << [arr[first_ele], arr[second_ele]]
    end
  end
  pairs
end

def coins_combinations(money, coins)
  count = 0
  coin_count = 0
  coins_max_count = {}
  coins.each do |coin|
    coin_count = 0
    coin_sum = 0
    until coin_sum >= money
      coin_sum += coin
      coin_count += 1
    end
    count += 1 if coin_sum == money
    coins_max_count[coin] = coin_count
  end
  pairs = pairs(coins)
  pairs.each do |pair|
    1.upto(coins_max_count[pair[0]]) do |multiply1|
      1.upto(coins_max_count[pair[1]]) do |multiply2|
        if (pair[0] * multiply1) + (pair[1] * multiply2) == money
          count += 1
        elsif (pair[0] * multiply1) + (pair[1] * multiply2) > money
          break
        end
      end
    end
  end

  triplets = triplets(coins)
  triplets.each do |triplet|
    1.upto(coins_max_count[triplet[0]]) do |multiply1|
      1.upto(coins_max_count[triplet[1]]) do |multiply2|
        1.upto(coins_max_count[triplet[2]]) do |multiply3|
          if (triplet[0] * multiply1) + (triplet[1] * multiply2) + (triplet[2] * multiply3) == money
            count += 1
          elsif (triplet[0] * multiply1) + (triplet[1] * multiply2) + (triplet[2] * multiply3) > money
            break
          end
        end
      end
    end
  end
  count
end

p coins_combinations(10, [5, 2, 3]) == 4
p coins_combinations(11, [5, 7]) == 0
p coins_combinations(4, [1, 2]) == 3
p coins_combinations(10, [5, 2, 3]) == 4
p coins_combinations(11, [5, 7]) == 0
p coins_combinations(10, [5, 2]) == 2
p coins_combinations(10, [5, 2, 4, 1]) == 17
p coins_combinations(1, [1, 2]) == 1


