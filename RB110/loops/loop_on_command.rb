# Loop on Command
# Modify the code below so the loop stops iterating when the user inputs 'yes'.
#
# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
# end

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
end