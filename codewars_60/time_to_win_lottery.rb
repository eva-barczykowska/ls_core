# Time to win the lottery!
#
# Given a lottery ticket (ticket), represented by an array of 2-value arrays, you must find out
# if you've won the jackpot.
#
# Example ticket:
# Example ticket:

[ [ 'ABC', 65 ], [ 'HGR', 74 ], [ 'BYHT', 74 ] ]

# To do this, you must first count the 'mini-wins' on your ticket.
# Each subarray has both a string and a number within it.
# If the character code of any of the characters in the string matches the number,
# you get a mini win. Note you can only have one mini win per sub array.
# Once you have counted all of your mini wins, compare that number to the other input provided (win).
# If your total is more than or equal to (win), return 'Winner!'. Else return 'Loser!'.
# All inputs will be in the correct format. Strings on tickets are not always the same length.

=begin
PEDAC

Problem
========
- method takes a nested array / an array of arrays
- sub-arrays contain a string and a number
- the string consists of characters, characters have codes (in the ASCII table?)
- if a the code, corresponds to any of the characters, it's a mini-win
- there can be only 1 mini win per subarray
- once all the mini wins have been calculated, compare this number (sum) with the the second argument,
  the number to win the jackpot
- if the number of mini-wins is equal or greater, return 'Winner!', else, return 'Loser!'

Examples
=========
bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2) == 'Loser!'
['ABC', 65]
analyzing 'ABC' ->
'A' -> 65 -> it's a mini win, no need to analyze further(coz there can be only 1 mini win per ticket)
['HGR', 74]
analyzing 'HGR' ->
'H' -> 72
'G' -> 71
'R' -> 82 -> none is equal to 74 so no mini win here, moving on
analyzing 'BYHT' ->
'B' -> 66
'Y' -> 89
'H' -> 72
'T' -> 84 -> none is equal to 74 so no mini win here

Algorithm
==========
- create a method helper calculate_mini_win(subarray)
- method takes an array and
- splits first element of the array into an array of characters
- maps those characters into their ASCII table numbers
- checks if any of those characters, when converted to its position in the ASCII table
  is equal to the second element of the array
- if yes, it returns true, else it returns false

- main method, get_jackpot_result(tickets)
- initialize `score`
- iterate over tickets
- invoke calculate_mini_win on each ticket with the ticket/sub array as an argument
- if method returns true, add 1 to the score
- else add 0
- when iteration finished, compare score to the second argument, expected score
- if score is equal or greater, return 'Winner!', else return 'Loser!'
=end
def calculate_mini_win(inner_ticket)
  array_of_characters = inner_ticket[0].chars
  ascii = array_of_characters.map {|char| char.ord}
  ascii.any? { |int| int == inner_ticket[1]}
end

# p calculate_mini_win(['ABC', 65])
# p calculate_mini_win(['BYHT', 74])
def get_jackpot_results(ticket, win)
  score = 0
  ticket.each do |inner_ticket|
    score += 1 if calculate_mini_win(inner_ticket)
  end

  if score >= win
    return 'Winner!'
  else
    return'Loser!'
  end
end

p get_jackpot_results([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2) == 'Loser!'
p get_jackpot_results([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1) == 'Winner!'
p get_jackpot_results([['HGTYRE', 74], ['BE', 66], ['JKTY', 74]], 3) == 'Loser!'

puts
# refactored
def calculate_mini_win(inner_ticket)
  inner_ticket.first.chars.map(&:ord).any? { |int| int == inner_ticket.last}
end
def get_jackpot_results(ticket, win)
  score = 0

  ticket.each do |inner_ticket|
    score += 1 if calculate_mini_win(inner_ticket)
  end

  score >= win ? 'Winner!': 'Loser!'
end


p get_jackpot_results([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2) == 'Loser!'
p get_jackpot_results([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1) == 'Winner!'
p get_jackpot_results([['HGTYRE', 74], ['BE', 66], ['JKTY', 74]], 3) == 'Loser!'