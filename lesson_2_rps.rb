# Rock Paper Scissors
CHOICES = %w(rock paper scissors)

def prompt(message)
  puts ">> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt 'You win!'
  elsif win?(computer, player)
    prompt 'You lose...'
  else
    prompt 'Tie game...'
  end
end

loop do
  user_choice = ''
  loop do
    prompt "Choose one: #{CHOICES.join(', ')}"
    user_choice = gets.chomp.downcase

    if CHOICES.include?(user_choice)
      break
    else
      prompt "That's not a valid choice, try again..."
    end
  end

  computer_choice = CHOICES.sample

  prompt "You chose: #{user_choice.upcase}, the computer chose: #{computer_choice.upcase}"
  puts

  display_results(user_choice, computer_choice)

  prompt 'Do you want to play again?'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts
prompt 'Thanks for playing'
puts
