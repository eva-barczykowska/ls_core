# Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn
# and marks a square on the board. First player to reach 3 squares in a row,
# including diagonals, wins. If all 9 squares are marked and no player
# has 3 squares in a row, then the game is a tie.
#
# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

# here we need to come up with the decision for the data structure that is going
# to represent board state
# we're deciding for the hash
# the keys will represent the square,
# the values will represent what we want to display, X, O or space
require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +  # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +  # columns
                [[1, 5, 9], [3, 5, 7]]               # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd) # method definition, brd is a parameter
  system 'clear' # clears, makes changes with info coming from the changing hash
  puts "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER } # assign k and v 2 the h
  new_board
end

# at this point we have our initial board and we can display it

def empty_squares(brd)
  # binding.pry
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ' '
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "Sorry, that's not a valid choice."
    puts "Choose a square (#{empty_squares(brd).join(', ')}):"
  end
  # binding.pry
  brd[square] = PLAYER_MARKER
  # binding.pry
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # we need a boolean here but also nil
end

# detect_winner should return a string like computer (won) or player (won)
# but it should also return a nil if nobody won and it's a tie
# !! will forcibly turn the value of detect_winner into a true boolean (false)
# we don't want an incidental boolean like nil
# so in case of the value returned is NIL, !! will turn it into FALSE
# if no player wins, then nil is returned from the detect_winner method

def detect_winner(brd)
  WINNING_LINES.each do |line| # line stands for line in a game and array here
    # binding.pry
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

loop do
  board = initialize_board # creating a hash with keys and values

  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    # binding.pry
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)

  # binding.pry
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
