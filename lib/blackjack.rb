def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(total_bust)
  puts "Sorry, you hit #{total_bust}. Thanks for playing!"
end

def initial_round
  first_card = deal_card
  second_card = deal_card
  sum = first_card + second_card
  display_card_total(sum)
  return sum
end

def hit?(total)
  prompt_user
  user_input = get_user_input
    if user_input == "h"
      new_card = deal_card
      new_total = new_card + total
      return new_total
    elsif user_input == "s"
      return total
    else
      invalid_command
      prompt_user
      get_user_input
    end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  total = initial_round
  new_total = hit?(total)
  display_card_total(new_total)
  loop do
    if new_total <= 21
      new_total = hit?(new_total)
      display_card_total(new_total)
    else
      end_game(new_total)
      break
    end
  end
end
