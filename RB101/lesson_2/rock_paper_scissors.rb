VALID_CHOICES = %w[rock paper scissors]

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
