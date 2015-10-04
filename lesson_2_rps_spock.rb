# Rock Paper Scissors Lizard Spock
CHOICES = %w(rock paper scissors lizard spock)
human_tally = 0
computer_tally = 0

def prompt(message)
  puts ">> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt 'You win the hand!'
    $human_score = '1'
  elsif win?(computer, player)
    prompt 'You lose the hand!'
    $computer_score = '1'
  else
    prompt 'Tie game...'
  end
end

prompt 'Welcome to the game, first to 5 wins...'
puts      
loop do
  user_choice = ''
  loop do
    puts
    prompt "Choose one: #{CHOICES.join(', ')}"
    user_choice = gets.chomp.downcase
    
    if user_choice[0, 1] == 's'
      prompt 'Do you mean Spock or Scissors?'
    else
      CHOICES.each do |word|
        if user_choice[0, 1] == word[0, 1]
          user_choice = word
        end
      end
    end

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

  if $human_score == '1'
    human_tally += 1
  elsif $computer_score == '1'
    computer_tally += 1
  end

  prompt "The score is you: #{human_tally} to computer: #{computer_tally}"

  break if human_tally > 4 || computer_tally > 4
end

puts
if human_tally > computer_tally
  prompt 'YOU WIN THE MATCH!'
else
  prompt 'Sorry, you lose...'
end
prompt 'Thanks for playing'
puts
