evens = (1..99).to_a.select(&:even?)
puts evens

# ls solution
value = 1
while value <= 99
  puts value if value.even?
  value += 1
end

#solution I liked:
100.times { |i| puts i if i.even? && !i.zero? }
