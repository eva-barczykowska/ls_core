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
DEFEATS = {:rock => ['scissors, lizard'], :paper => ['rock', 'spock'], :scissors => ['paper', 'lizard'],
                    :lizard => ['paper', 'spock'], :spock => ['rock']}
def prompt(message)
  Kernel.puts("=>#{message}")
end

def win?(first, second)
  first == "rock" && second == "scissors" ||
    first == "paper" && second == "rock" ||
    first == "scissors" && second == "paper"
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("This is not a valid choice!")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts "You chose #{choice}, computer chose #{computer_choice}."
  display_result(choice, computer_choice)

  prompt("Do you want to play again? (y/n)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for playing. Good bye.")
