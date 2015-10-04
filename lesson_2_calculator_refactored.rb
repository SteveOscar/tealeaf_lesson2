def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt "Welcome to the Calculator! Enter your name"

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure to use a valid name"
  else
    break
  end
end

prompt "Hi #{name}"

loop do # main loop
  number1 = ''
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp.to_i

    if valid_number?(number1)
      break
    else
      prompt "That doesn't look like a valid number"
    end
  end

  number2 = ''
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp.to_i

    if valid_number?(number2)
      break
    else
      prompt "That doesn't look like a valid number"
    end
  end

  operator_prompt = <<-HI
  What operation would you like to perform?
  1 = add
  2 = subtract
  3 = multiply
  4 = divide
  HI

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "You must choose a number, 1 through 4"
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when '1'
             result = number1 + number2
           when '2'
             result = number1 - number2
           when '3'
             result = number1 * number2
           when '4'
             result = number1 / number2
           end

  prompt "The result is #{result}"

  prompt "Do you want to go again? (Y to go again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for using the Calculator"
