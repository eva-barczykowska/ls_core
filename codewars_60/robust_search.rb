# Write a method robust_ssearch that takes two arguments: an array of words and a query term. The function should return an array of words from the given array that match the query term. The function should be case insensitive, it should consider partial matches, and to account for keyboard typo should consider the that last two letters of the query term may have been reversed.

#  # Test Cases
#  puts robust_search(["develop", "develpo", "deep", "dive", "devel"], "devel").inspect # => ["develop", "develpo", "devel"]
#  puts robust_search(["apple", "banana", "cherry"], "naan").inspect # => ["banana"]
#  puts robust_search(["testing", "switch", "characters"], "testnig").inspect # => []

def swapped_case(string)
  string[0..-3] + string[-1] + string[-2]
end

def robust_search(words, query)
  nomal_query = query.downcase
  swaped_query = swapped_case(query)

  words.select { |word| word.include?(nomal_query) || word.include?(swaped_query)}
end


p robust_search(["develop", "develpo", "deep", "dive", "devel"], "devel")  == ["develop", "develpo", "devel"]
p robust_search(["apple", "banana", "cherry"], "naan") == ["banana"]
p robust_search(["testing", "switch", "characters"], "testnig") == []