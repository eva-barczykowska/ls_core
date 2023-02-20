# SCISSORS CUTS PAPER COVERS ROCK
# CRUSHES LIZARD POISONS SPOCK
# SMASHES SCISSORS DECAPITATES LIZARD
# EATS PAPER DISPROVES SPOCK
# VAPORIZES ROCK CRASHES SCISSORS

# Requirements:
# 1. Add Lizard and Spock to my code
# 2. Update the program so the user can type "r" for "rock," "p" for "paper," etc.
# 3. Note that if you do bonus #1, you'll have two words that start with "s." How do you resolve that?
# 4. Keep score of the player's and computer's wins.
#    When either the player or computer reaches three wins, the match is over,
#    and the winning player becomes the grand winner.
#    Don't add your incrementing logic to display_results.
#    Keep your methods simple; they should perform one logical task — no more, no less.

VALID_CHOICES = { ["r", "rock"] => :rock, ["p", "paper"] => :paper, ["s", "scissors"] => :scissors, ["l", "lizard"] => :lizard, ["sp", "spock"] => :spock }

# if computer selected any values from the array belonging to the key that player had selected (from this hash), player wins
h = { rock: ['scissors', 'lizard'], paper: ['rock', 'spock'], scissors: ['paper', 'lizard'],
                    lizard: ['paper', 'spock'], spock: ['rock', 'scissors'] }

def prompt(message)
  Kernel.puts("=>#{message}")
end

# at this point both variables player_choice and computer_choice are string objects
def win?(h, player_choice, computer_choice)
  player_choice == "rock" && h[player_choice.to_sym].any? { |word| word == computer_choice } ||
    player_choice == "paper" && h[player_choice.to_sym].any? { |word| word == computer_choice } ||
    player_choice == "scissors" && h[player_choice.to_sym].any? { |word| word == computer_choice } ||
    player_choice == "lizard" && h[player_choice.to_sym].any? { |word| word == computer_choice } ||
    player_choice == "spock" && h[player_choice.to_sym].any? { |word| word == computer_choice }
end

def display_result(h, player_choice, computer_choice)
  if player_choice == computer_choice
    prompt("It's a tie in this round!")
  elsif win?(h, player_choice, computer_choice)
    prompt("YOU won this round!")
  else win?(h, computer_choice, player_choice)
       prompt("COMPUTER won this round!")
  end
end

player_score = 0
computer_score = 0

loop do
  player_choice = ""
  loop do # basic loop - for getting the correct input from the user
    prompt("Choose one, 'r' for rock, 'p' for paper, 's' for scissors, 'l' for lizard or 'sp' for spock")
    player_choice = Kernel.gets().chomp()

    def get_full_word(shortcut) # could change this to hash but this is easier to read
      case shortcut
      when "r"
        "rock"
      when "p"
         "paper"
      when "s"
        "scissors"
      when "l"
        "lizard"
      when "sp"
        "spock"
      end
    end

    player_choice = get_full_word(player_choice) # I want to display full form in the terminal for both players

    if VALID_CHOICES.keys.any? { |subarray| subarray.include?(player_choice) } # keys is a nested array, we're looking inside all sub-arrays
      break
    else
      prompt("This is not a valid choice!")
    end
  end # basic loop - ends here

  computer_choice = VALID_CHOICES.values.sample.to_s # have to change sym to str, otherwise we will be comparing str with symbol in the win? method

  Kernel.puts "You chose #{player_choice}, computer chose #{computer_choice}." #display full forms here
  display_result(h, player_choice, computer_choice)

  if win?(h, player_choice, computer_choice)
    player_score += 1
  elsif win?(h, computer_choice, player_choice)
    computer_score += 1
  end
  # puts "--after update"
  #
  # Kernel.puts player_score
  # Kernel.puts computer_score

  if player_score == 3 || computer_score == 3
    prompt("Score of 3 points has been reached, the grand winner is #{player_score > computer_score ? "YOU" : "COMPUTER"}!")
    prompt("Do you want to play again? (y/n)")
    answer = Kernel.gets().chomp()
    player_score = 0
    computer_score = 0
  else
    prompt("Do you want to play again? (y/n)") # so after every move (and not after we've 3 points have been reached) we are asking the player if they want to continue
    answer = Kernel.gets().chomp()
  end
  break unless answer.downcase.start_with?("y")

end

prompt("Thank you for playing. Good bye.")

