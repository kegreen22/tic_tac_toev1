class Player
# attributes - move, name, icon, status
  attr_accessor :name, :icon, :status 
  
end

class Match
  attr_accessor :board, :game, :winner

  def turn(player)
    puts "Please make your move -- remember to choose a number between 0 and 8 (or q to quit)"
    action = gets.chomp
    if valid_move(action)   # check the validity of the player's move
    @board[action.to_i] = player.icon
    else
    turn(player)
    end   # end of if statement
  victory_check
  
  else
  return
  end   # end of if statement
  end   # end of turn method


  def valid_move(action)
  if action = "q"   # end the game via quitting
  @winner = "noone"
  @game = "over"

  elsif ((action.to_i > 8) || (action.to_i < 0))   # chosen number must be valid (0-8)
  puts "The number chosen must be between 0 and 8"
  return false

  elsif 
  @board[action.to_i] == "nil" # if the square is empty (nil) return true (it is a valid choice)
  return true
    
  else
  puts "The square chosen is not empty. Please make another choice."
  show_board
  return false

  end  # end of if statement

  end # end of valid_move method


  def victory_check
  player_victory = [player.icon, player.icon, player.icon]  # player's icon needs to appear consecutively 3 times

  victory_test = [@board[0,1,2], @board[3,4,5], @board[6,7,8], @board[0,3,6], @board[1,4,7], @board[2,5,8], @board[0,4,8], @board[2,4,6]]  # winning with 3 in a row based on the game board
 
  if victory_test.include?(player_victory)
  @winner = player.name
  @game = "over"
  else
  return 
  end # end of if statement
  end  # end of victory_check method


  def show_board   # show the game board
    puts @board[0..2]
    puts @board[3..5]
    puts @board[6..8]
  end   # end of method



end   # end of Match class

 
 
player1 = Player.new
player2 = Player.new
player1.icon = "X"
player2.icon = "O"
tic_tac = Match.new   # start new tic tac toe game
tic_tac.board = Array.new(9)   # create board with 9 empty squares set to "nil"
tic_tac.winner = "noone"   # noone wins the game until a winner is declared
game_turn = 1   # start from turn 1
 
# Get player names
puts "Please enter the first player's name"
player1.name = gets.chomp
puts "Please enter the second player's name"
player2.name = gets.chomp

 
while (tic_tac.game != "over" || @board.include?("nil")) # game is over when game is over or when all squares are taken without a winner (game over)
  tic_tac.show_board()
  tic_tac.turn(player1)
  tic_tac.show_board()
  tic_tac.turn(player2)
  game_turn+=1

end  # end of the while statement

puts "The game is over. The winner is #{tic_tac.winner}. Thanks for playing."







=begin
# the below is old code

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


def game_over?
# check conditions to see who won or lost and set Player.status to won or lost accordingly
 board_condition = [self.icon, self.icon, self.icon]  # player's icon needs to appear consecutively 3 times
 
 if board.full? || victory_test.include?(board_condition) return true  
 


# if all squares are taken then the game is also over, set both Player.status to drawn and return true
#  if !board.include?("empty")
#  Player1.status, Player2.status = "drawn"
#  return true
#  end # end of if statement
 
# end  # end of game_over method

# def get_move(turn)
#get player move based on whose turn it is, check that it is valid and, once valid, end turn go to the other player
#current_player

#if turn.even? current_player = Player2
#else current_player = Player1
#end
# puts "Please make your move #{current_player.name} -- remember to choose a number between 0 and 8."
#current_player.move = gets.chomp.to_i
#  if !move_valid?
#    puts "Please enter a number between 0 and 8 for an unocuppied square."
#    current_player.move = gets.chomp.to_i
# else board[current_player.move] = player.icon
# end 


# def advance_turn_counter
#turn += 1
#end
 
 
#def move_valid?(move, icon)
# check that move is between 0 to 8, otherwise enter a valid value
#  if move != 0..8 return false
 
  # check that move is to an empty index otherwise ask player to make another choice
#  elsif board[move] != "empty" return false
 
#  else
#  return true
#  end  # end of the if statement
 
#end # end of the method
 


 

/*
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
=end