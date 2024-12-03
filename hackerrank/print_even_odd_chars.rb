# Sample Input
# 2
# Hacker
# Rank
#
# Sample Output
# Hce akr
# Rn ak

def solve(s)
  even_chars = s.chars.select.with_index{|_, i| i.even? }.join
  odd_chars = s.chars.select.with_index{|_, i| i.odd? }.join
  "#{even_chars} #{odd_chars}"
end

t = gets.to_i

t.times do
  s = gets.chomp
  puts solve(s)
end