# SCISSORS CUTS PAPER COVERS ROCK
# CRUSHES LIZARD POISONS SPOCK
# SMASHES SCISSORS DECAPITATES LIZZARD
# EATS PAPER DISPROVES SPOCK
# VAPORIZES ROCK CRASHES SCISSORS

#1. Add Lizzard and Spock to my code

# 2. Typing the full word "rock" or "lizard" is tiring.
# Update the program so the user can type "r" for "rock," "p" for "paper," etc.
# Note that if you do bonus #1, you'll have two words that start with "s." How do you resolve that?

# 3. Keep score of the player's and computer's wins.
# When either the player or computer reaches three wins, the match is over,
# and the winning player becomes the grand winner.
# Don't add your incrementing logic to display_results.
# Keep your methods simple; they should perform one logical task — no more, no less.
#
# what defeats what - store this info in a hash
# VALID_CHOICES = %w[rock paper scissors]
# VALID_CHOICES = { :rock => "r", :paper => "p", :scissors => "s", :lizard => "l", :spock => "sp" }
VALID_CHOICES = {["r", "rock"]=>:rock, ["p", "paper"]=>:paper, ["s", "scissors"]=>:scissors, ["l", "lizard"]=>:lizard, ["sp", "spock"]=>:spock}

h = { rock: ['scissors, lizard'], paper: ['rock', 'spock'], scissors: ['paper', 'lizard'],
                    lizard: ['paper', 'spock'], spock: ['rock'] }

def prompt(message)
  Kernel.puts("=>#{message}")
end

# Algorithm
# check in the hash what player chose and what computer choose, if they're same, it's a tie

def win?(h, player_choice, computer_choice)
  player_choice == h.keys.any? && computer_choice == h.values.any? # h contains winning combinations for the player
end

def display_result(h, player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt("You won!")
  elsif win?(h, player_choice, computer_choice)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end
# VALID_CHOICES = {["r", "rock"]=>:rock, ["p", "paper"]=>:paper, ["s", "scissors"]=>:scissors, ["l", "lizard"]=>:lizard, ["sp", "spock"]=>:spock}
loop do
  player_choice = ""
  loop do
    prompt("Choose one, r for rock, p for paper, s for scissors, l for lizard or sp for spock")
    player_choice = Kernel.gets().chomp()

    def get_full_word(shortcut)
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

    if VALID_CHOICES.keys.any? { |subarray| subarray.include?(player_choice) }
      break
    else
      prompt("This is not a valid choice!")
    end

  end

    computer_choice = VALID_CHOICES.values.flatten.sample

    Kernel.puts "You chose #{player_choice}, computer chose #{computer_choice}." #display full forms here
    display_result(h, player_choice, computer_choice)

  # You chose r, computer chose sp.

  prompt("Do you want to play again? (y/n)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?("y")
end


prompt("Thank you for playing. Good bye.")
