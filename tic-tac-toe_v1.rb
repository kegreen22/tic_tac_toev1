class Player
# attributes - move, name, icon, status
  attr_accessor :name, :icon, :status

end

class Match
  attr_accessor :board, :game_over, :winner

  def turn(player_name, player_icon)
    puts "Please make your move -- remember to choose a number between 0 and 8 (or q to quit)"
    action = gets.chomp
    if valid_move(action)   # check the validity of the player's move
    @board[action.to_i] = player_icon
    else
    turn(player_name, player_icon)
    end   # end of if statement

      victory_check(player_name, player_icon)   # check victory conditions at end of each player's turn
    return # return to execute the game's main while loop

  end   # end of turn method


  def valid_move(action)
    if action == "q"   # end the game via quitting
    @winner = "noone"
    @game_over = true
    # return, the game is over without a winner

    elsif ((action.to_i > 8) || (action.to_i < 0))   # chosen number must be valid (0-8)
    puts "The number chosen must be between 0 and 8"
    return false

    elsif
    @board[action.to_i] == "" # if the square is empty return true (it is a valid choice)
    return true

    else
    puts "The square chosen is not empty. Please make another choice."
    show_board
    return false

    end  # end of if statement

  end # end of valid_move method


  def victory_check(player_name, player_icon)
    player_victory = [player_icon, player_icon, player_icon]  # player's icon needs to appear consecutively 3 times


    victory_1 = @board[0,1,2]
    victory_2 = @board[3,4,5]
    victory_3 = @board[6,7,8]
    victory_4 = @board[0,3,6]
    victory_5 = @board[1,4,7]
    victory_6 = @board[2,5,8]
    victory_7 = @board[0,4,8]
    victory_8 = @board[2,4,6]

    if ((player_victory.eql?(victory_1)) || (player_victory.eql?(victory_2)) || (player_victory.eql?(victory_3)) || (player_victory.eql?(victory_4)) || (player_victory.eql?(victory_5)) ||
     (player_victory.eql?(victory_6)) || (player_victory.eql?(victory_7)) || (player_victory.eql?(victory_8)))
     @winner = player_name
      @game_over = true
    else
      return
    end

=begin
  # victory_test = [@board[0,1,2], @board[3,4,5], @board[6,7,8], @board[0,3,6], @board[1,4,7], @board[2,5,8], @board[0,4,8], @board[2,4,6]]  # winning with 3 in a row based on the game board

    i = 1
    while i < 9

      if victory_[i].include?(player_victory)
      @winner = player_name
      @game_over = true
      #else
      #return
      end # end of if statement
      i+=1
    end

    if @game_over != true
      return
    end # end of if statement

=end
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
tic_tac.board = Array.new(9, "")   # create board with 9 empty squares set to ""
tic_tac.game_over = false
tic_tac.winner = "noone"   # noone wins the game until a winner is declared
game_turn = 1   # start from turn 1

# Get player names
puts "Please enter the first player's name"
player1.name = gets.chomp
puts "Please enter the second player's name"
player2.name = gets.chomp


while (!tic_tac.game_over || tic_tac.board.include?("")) # game is over when game is over or when all squares are taken without a winner (game over)
  tic_tac.show_board
  tic_tac.turn(player1.name, player1.icon)
  tic_tac.show_board
  tic_tac.turn(player2.name, player2.icon)
  game_turn+=1

end  # end of the while statement

puts "The game is over. The winner is #{tic_tac.winner}. Thanks for playing."