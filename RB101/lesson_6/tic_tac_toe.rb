# Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and
# marks a square on the board. First player to reach 3 squares in a row, including diagonals,
# wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie.
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

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd) # method definition, brd is a parameter
  system 'clear' #this is very interesting how it clears previous and makes changes, info coming from the changing hash
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER } # assigning keys and values to the hash
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
    prompt "Choose a square (#{empty_squares(brd).join(", ")}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "Sorry, that's not a valid choice. Choose a square (1-9):"
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

def someone_won?(board)
  false
end

board = initialize_board # creating a hash with keys and values
display_board(board) # displaying th e board, i.e.

loop do
  player_places_piece!(board)
  computer_places_piece!(board)
  # puts board.inspect
  display_board(board)
  break if someone_won?(board) || board_full?(board)
end

display_board(board)
