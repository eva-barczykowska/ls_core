=begin
# Problem
 - Get all the 3 length combinations from a given array

# example
p combo_me(3, ["a", "b", "c", "d", "e"]) ==
[["a", "b", "c"], ["a", "b", "d"], ["a", "b", "e"], ["a", "c", "d"], ["a", "c", "e"], ["a", "d", "e"], ["b", "c", "d"],
["b", "c", "e"], ["b", "d", "e"], ["c", "d", "e"]]

## Intermediary
# algorithm
  Iterate through String 1 starting at idx 0
    Iterate through String 2 starting at idx 1
      Iterate Through String 3 starting at idx 2
        Add following to array, then return array:
        el at loop 1, loop 2, loop 3
=end

# short option with combination, combinations gives us unique combinations, e.g. [1, 2] and not [1, 2] and [2, 1] - that is given by permutations
def combo_me(required_length, array)
  array.combination(required_length).with_object([]) { |combo, combos_array| combos_array << combo }
end

p combo_me(3, ["a", "b", "c", "d", "e"]) == [["a", "b", "c"], ["a", "b", "d"], ["a", "b", "e"], ["a", "c", "d"], ["a", "c", "e"], ["a", "d", "e"], ["b", "c", "d"], ["b", "c", "e"], ["b", "d", "e"], ["c", "d", "e"]]

puts
# Long option without Combination, pattern repeats itself for additional levels
array_to_combo = ["a", "b", "c", "d", "e"]

length_array_to_combo = array_to_combo.length
long_way_results_array = []

(0...length_array_to_combo).each do |idx_1|
  (idx_1 + 1...length_array_to_combo).each do |idx_2|
    (idx_2 + 1...length_array_to_combo).map do |idx_3|
      long_way_results_array << [array_to_combo[idx_1], array_to_combo[idx_2], array_to_combo[idx_3]] # gathering elements to append
    end
  end
end
long_way_results_array


p combo_me(3, ["a", "b", "c", "d", "e"]) == [["a", "b", "c"], ["a", "b", "d"], ["a", "b", "e"], ["a", "c", "d"], ["a", "c", "e"], ["a", "d", "e"], ["b", "c", "d"], ["b", "c", "e"], ["b", "d", "e"], ["c", "d", "e"]]

# else it can be done like this
###### Option long without Combination, pattern repeats itself for additional levels
length_array_to_combo = array_to_combo.length
long_way_results_array = []

(0...length_array_to_combo).each do |idx_1|
  (idx_1...length_array_to_combo).each do |idx_2|
    (idx_2...length_array_to_combo).map do |idx_3|
      next if idx_3 <= idx_2 || idx_2 <= idx_1
      long_way_results_array << [array_to_combo[idx_1], array_to_combo[idx_2], array_to_combo[idx_3]]
    end
  end
end
long_way_results_array