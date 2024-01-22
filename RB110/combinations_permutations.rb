array =  ["a", "b", "c", "d", "e"]

# combination method makes combinations from the array, the combinations are unique so just ['a', 'b'] and not both
# ['a', 'b'] and ['b', 'a']
# we can't pass 0, negative argument or argument greater than the array size, we'll get an empty array

array =  ["a", "b", "c", "d", "e"]
result = []
will_not_work = array.combination(0) { |comb| result << comb }
p result # [[]]

puts

array =  ["a", "b", "c", "d", "e"]
result = []
will_not_work = array.combination(6) { |comb| result << comb }
p result # []

puts

array =  ["a", "b", "c", "d", "e"]
result = []
will_not_work = array.combination(-1) { |comb| result << comb }
p result # []

puts

array =  ["a", "b", "c", "d", "e"]
result = []
result = array.combination(2) { |comb| result << comb }
p result # [["a", "b"], ["a", "c"], ["a", "d"], ["a", "e"], ["b", "c"], ["b", "d"], ["b", "e"], ["c", "d"], ["c", "e"], ["d", "e"]]
# THESE ARE NOT REPEATED, IF WE NEED REPEATED, we need to use:

puts

array =  ["a", "b", "c", "d", "e"]
result = []
result = array.repeated_combination(2) { |comb| result << comb }
p result
# [["a", "a"], ["a", "b"], ["a", "c"], ["a", "d"], ["a", "e"], ["b", "b"], ["b", "c"], ["b", "d"], ["b", "e"], ["c", "c"], ["c", "d"], ["c", "e"], ["d", "d"], ["d", "e"], ["e", "e"]]
# the extra ones here are
# ["a", "a"]
# ["b", "b"]
# ["c", "d"]
# ["d", "d"]
# ["e", "e"]

# it works also without a block but it returns ENUMERATOR so we need to convert Enumerator to an array?
array =  ["a", "b", "c", "d", "e"]
result = []
result = array.combination(2).to_a
p result # [["a", "b"], ["a", "c"], ["a", "d"], ["a", "e"], ["b", "c"], ["b", "d"], ["b", "e"], ["c", "d"], ["c", "e"], ["d", "e"]]

puts

# Now permutation method
# This method gives us ALL possible permutations except the repeated ones so we'll get both ['a', 'b'] and ['b', 'a'],
array =  ["a", "b", "c", "d", "e"]
result = []
result = array.permutation(2).to_a # notice that this is without a block
p result
# [["a", "b"], ["a", "c"], ["a", "d"], ["a", "e"], ["b", "a"], ["b", "c"], ["b", "d"], ["b", "e"], ["c", "a"],
# ["c", "b"], ["c", "d"], ["c", "e"], ["d", "a"], ["d", "b"], ["d", "c"], ["d", "e"], ["e", "a"], ["e", "b"],
# ["e", "c"], ["e", "d"]]
# so we have the extra ones like both ["a", "b"] and ["b", "a"], ["a", "c"], etc.

puts
# repeated_permutations will have all the above plus repeated permutations:

array =  ["a", "b", "c", "d", "e"]
result = []
result = array.repeated_permutation(2).to_a # notice that this is without a block
p result
# [["a", "a"], ["a", "b"], ["a", "c"], ["a", "d"], ["a", "e"], ["b", "a"], ["b", "b"], ["b", "c"], ["b", "d"],
# ["b", "e"], ["c", "a"], ["c", "b"], ["c", "c"], ["c", "d"], ["c", "e"], ["d", "a"], ["d", "b"], ["d", "c"],
# ["d", "d"], ["d", "e"], ["e", "a"], ["e", "b"], ["e", "c"], ["e", "d"], ["e", "e"]]
# so the extra ones are:
# ["a", "a"], ["b", "b"], ["c", "c"], ["d", "d"], ["e", "e"]