arr = %w[brandi leonardo li fiona]
arr = arr.map { |surname| [surname, surname.size] }.sort # order of names is same, only size added in each inner array
# => [["brandi", 6], ["leonardo", 8], ["li", 2], ["fiona", 5]]
p arr

# what if I added sort?
# arr = %w( brandi leonardo li fiona )
# arr = arr.map { |surname| [surname, surname.size] }.sort # the inner arrays get sorted (by name)
# [["brandi", 6], ["fiona", 5], ["leonardo", 8], ["li", 2]] # SORTS BY THE SURNAME

# arr = ["Barbara", "Jill", "Cathy"]

# arr.sort_by {|item| item.size}
# # ["li", "lopez","furuya", "fernandez", "bamrungpong"]

# arr = arr.sort_by { |item| -item.size } # sort descending
# # ["bamrungpong", "fernandez", "furuya", "lopez", "li"]
# p arr
