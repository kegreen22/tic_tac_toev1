class Player
# attributes - move, name, icon, status
  attr_accessor :move, :name, :icon, :status 
  
end
 
 
def game_over?
# check conditions to see who won or lost and set Player.status to won or lost accordingly
 
 
 
# if all squares are taken then the game is also over, set both Player.status to drawn and return true
  if !board.include?("empty")
  Player1.status, Player2.status = "drawn"
  return true
  end # end of if statement
 
end  # end of game_over method

def get_move(turn)
#get player move based on whose turn it is, check that it is valid and, once valid, end turn go to the other player
current_player

if turn.even? current_player = Player2
else current_player = Player1
end
 puts "Please make your move #{current_player.name} -- remember to choose a number between 0 and 8."
current_player.move = gets.chomp.to_i
  if !move_valid?
    puts "Please enter a number between 0 and 8 for an unocuppied square."
    current_player.move = gets.chomp.to_i
else board[current_player.move] = player.icon
end 


def advance_turn_counter
turn += 1
end
 
 
def move_valid?(move, icon)
# check that move is between 0 to 8, otherwise enter a valid value
  if move != 0..8 return false
 
  # check that move is to an empty index otherwise ask player to make another choice
  elsif board[move] != "empty" return false
 
  else
  return true
  end  # end of the if statement
 
end # end of the method
 
def show_board
  puts board[0..2]
  puts board[3..5]
  puts board[6..8]
end
 
 
 
player1 = Player.new
player2 = Player.new
Player1.icon = "X"
Player2.icon = "O"
board = Array.new["empty", 8]
turn = 1
 
# Get player names
puts "Please enter the first player's name"
Player1.name = gets.chomp
puts "Please enter the second player's name"
Player2.name = gets.chomp

 
while !game_over?  # start loop to play until the game is over
  # Player 1 gets to move & pass turns back and forth via a turn token??
  while turn < 10 do
  show_board    # show the board to the player before they make their move
  get_move(turn) # including error-checking and confirming that it is valid
  advance_turn_counter # other player gets to move
  end
end # end of while loop

# say who won the game

  puts "Please make your move #{Player1.name} -- remember to choose a number between 0 and 8"

 


  Player1.move = gets.chomp.to_i
  while !move_valid?(Player1.move, Player1.icon)
    puts "Please enter a valid choice"
    Player1.move = gets.chomp.to_i
    end
  
  board[Player1.move] = Player1.icon
  # Player 2 gets to move
  show_board   # show the board to the player before they make their move
  puts "Please make your move #{Player2.name} -- remember to choose a number between 0 and 8"
  Player2.move = gets.chomp.to_i
  while !move_valid?(Player2.move, Player2.icon)
    puts "Please enter a valid choice"
    Player2.move = gets.chomp.to_i
    end
  board[Player2.move] = Player2.icon
  end
 
puts "The game is over. #{Player1.name} has #{Player1.status}. #{Player2.name} has #{Player2.status}. Thanks for playing #{Player1.name} and #{Player2.name}"