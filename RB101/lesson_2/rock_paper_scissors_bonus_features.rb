# SCISSORS CUTS PAPER COVERS ROCK
# CRUSHES LIZARD POISONS SPOCK
# SMASHES SCISSORS DECAPITATES LIZZARD
# EATS PAPER DISPROVES SPOCK
# VAPORIZES ROCK CRASHES SCISSORS

defeats = {:rock => ['scissors, lizard'], :paper => ['rock', 'spock'], :scissors => ['paper', 'lizard'],
           :lizard => ['paper', 'spock'], :spock => ['rock']}

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
VALID_CHOICES = %w[rock paper scissors lizard spock]
h = {:rock => ['scissors, lizard'], :paper => ['rock', 'spock'], :scissors => ['paper', 'lizard'],
                    :lizard => ['paper', 'spock'], :spock => ['rock']}
def prompt(message)
  Kernel.puts("=>#{message}")
end

# Algorithm
# extract the key from the hash that equals to the my(player) choice converted to symbol
# extract the values belonging to this key
# ask if any of the above values are same like computer choice
# if any of the values is same, player(I) win
# else computer wins

def win?(h, my_choice, computer_choice)
  h.keys.any?(my_choice.to_sym) && h[my_choice.to_sym].any? { |elem| elem == computer_choice }
end

def display_result(h, player_choice, computer_choice)
  if player_choice == computer_choice
    prompt("It's a tie!")
  elsif win?(h, player_choice, computer_choice)
    prompt("You won!")
  else
    prompt("Computer won!")
  end
end

loop do
  my_choice = ""
  loop do
    prompt("Choose one: #{ VALID_CHOICES.join(', ') }.")
    my_choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(my_choice)
      break
    else
      prompt("This is not a valid choice!")
    end
  end
    computer_choice = VALID_CHOICES.sample
    Kernel.puts "You chose #{my_choice}, computer chose #{computer_choice}."
    display_result(h, my_choice, computer_choice)

  prompt("Do you want to play again? (y/n)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?("y")
end


prompt("Thank you for playing. Good bye.")
