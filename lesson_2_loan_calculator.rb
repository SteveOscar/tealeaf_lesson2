def prompt(message)
  puts "=> #{message}"
end

puts
prompt "Welcome to the loan calculator..."

loop do
  prompt 'Enter LOAN AMOUNT:'

  l = ''
  loop do
    l = gets.chomp.to_i

    if l.to_f() <= 0
      prompt 'Must enter positive number.'
    else
      break
    end
  end

  prompt "Enter APR % ('6' for 6%, etc):"

  c = ''
  loop do
    c = (gets.chomp.to_f)
    if c > 100
      prompt 'Enter a value between 0 and 100'
    else
      c = ((c / 100) / 12)
      break
    end
  end

  prompt 'Enter LOAN DURATION (in years):'

  n = ''
  loop do
    n = gets.chomp.to_i
    if n <= 0
      prompt 'Please enter a valid number of years'
    else
      n *= 12
      break
    end
  end

  monthly_payment = l * (c / (1 - (1 + c)**-n))

  puts
  prompt "Monthly Payment: $#{format('%02.2f', monthly_payment)}"

  prompt 'Another calculation?'
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end

prompt 'Thanks for using the calculator'
puts
