# Problem 9
# Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.
#
# You may assume that the second argument is never an empty string.
#
# p count_substrings('babab', 'bab') == 1
# p count_substrings('babab', 'ba') == 2
# p count_substrings('babab', 'b') == 3
# p count_substrings('babab', 'x') == 0
# p count_substrings('babab', 'x') == 0
# p count_substrings('', 'x') == 0
# p count_substrings('bbbaabbbbaab', 'baab') == 2
# p count_substrings('bbbaabbbbaab', 'bbaab') == 2
# p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1
#
# Problem
# ========
# -method takes 2 str arguments
# -method returns number of times that the second string occurs in the fist
# -overlapping strings don't count:
# -'babab' contains 1 instance of 'bab', not 2.
#
# Examples
# ========
# p count_substrings('babab', 'bab') == 1
# => '*bab* ab' => 1
# p count_substrings('babab', 'ba') == 2
# '*ba**ba* b'=> 2
# p count_substrings('babab', 'b') == 3
# *b* a *b* a *b* => 3
# p count_substrings('babab', 'x') == 0
# => 0 no, x
# p count_substrings('', 'x') == 0
# => empty str
# p count_substrings('bbbaabbbbaab', 'baab') == 2
# 'bb* baab* bb*baab*'
# p count_substrings('bbbaabbbbaab', 'bbaab') => 2
# 'b*bbaab* b *bbaab*' => 2
# p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1
# '*bbbaabb* bbaabb'
#
# Algorithm1
# =========
# FIND substrings in string, store in array (scan method)
# RETURN the size of that array
#
# Algorithm2 -- will not work COZ OF OVERLAPPING !!!
# GET `substrings`
# ITERATE and select those that are equal to `target`
# -RETURN the size of the selected array
#
# Algorithm3
# ==========
# INIT count
# INIT index
# while index is true/not nil (because it is equal to the return value of calling the #index method on the string argument with arguments of (target, index))
# increase count (becasue index is true, this means you found the beginning of another whole target word)
# increase index by the size of target (we need to skip this target word since we found it)
# end while loop
#
# RETURN count
