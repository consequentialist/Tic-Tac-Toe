require_relative 'board'
require_relative 'winner'
require_relative 'ui'
require_relative 'ai'


class Motherclass
  
  def start
    @board = Board.new
    @ui = UserInterface.new
    @ai = AI.new
  end
  
  def user_interface
     #here boy
    ui.gamestart_message
    p1 = ui.game_play1(board)
    p2 = 0
    while illegal?(p1)
    puts "INVALID INPUT! Try Again:"
    p1 = ui.game_play1(board)
    end 
    puts "this is delay"
    puts $delay
    while end_game?(board_setter(p1, 1, board)) == false
      puts ui.populate_board(board_setter(p1, 1, board))
      p2 = calculate_illegal(ui.game_play2(board), board, 2, ui)
      if end_game?(board_setter(p2, 2, board)) == false
      puts ui.populate_board(board_setter(p2, 2, board))
      p1 = calculate_illegal(ui.game_play1(board), board, 1, ui)
      end
    end
    if end_game?(board_setter(p1, 1, board)) == true
      puts ui.populate_board(@boardarray)
      puts ui.announce_end(board_setter(p1, 1, board))
    end
  end
  
  #def calculate_illegal(playermove, board, player, chosenmove)
   # move = 0
    #move = playermove
     # while illegal?(move) || cheater?(move)
      #  if illegal?(move)
       #   puts "INVALID INPUT! Try Again:"
        #  if player == 1
         #   move = ui.game_play1(board)
          #else
          #  move = ui.game_play2(board)
          #end
        #else
         # puts "You are a cheater! You should be slapped."
          #puts "Try Again:"
          #if player == 1
           # move = ui.game_play1(board)
          #else
           # move = ui.game_play2(board)
          #end
        #end
      #end
      #move
  #end
 
  def illegal?(spot)
    spot > 9 || spot < 1
  end
  
  def cheater?(board, spot)
    board[spot - 1] > 0 #&& @boardarray.count(0) !=9
  end
  
  def board_setter(spot, player, board)
    @boardarray = []
    @boardarray += board.set_value(spot, player)
      return @boardarray
  end
  
  def end_game?(input)
    EndResult.new.determine_win(input) != 0
  end

end
