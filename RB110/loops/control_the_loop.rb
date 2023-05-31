# Control the Loop
# Modify the following loop so it iterates 5 times instead of just once.
# iterations = 1
#
# loop do
#   puts "Number of iterations = #{iterations}"
#   break
# end

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# If the break statement is moved up one line so it runs before iterations is incremented, what would need to be changed?

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations >= 5
  iterations += 1

end