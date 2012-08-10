require_relative 'board'
require_relative 'winner'
require_relative 'ui'
require_relative 'ai'


class Motherclass
  
  PLAYER1 = 1
  PLAYER2 = 2
  
  def start
    @board = Board.new
    @ui = UserInterface.new
    @ai = AI.new
  end
  
  def game_init
    ui = UserInterface
    ui.gamestart_message
    ui.splash
    uistyle = ui.choose_ui
    player1 = ui.choose_player_type
    player2 = ui.choose_player_type
    p1mark = ui.choose_mark
    p2mark = ui.choose_mark
    while player1 == player2
      ui.invalid
      player2 = ui.choose_mark
    end
    board = Board.new
    #gameloop(board)
   
  end
  
  def gameloop(board)
    move = @ui.make_move(PLAYER1)
    while illegal?(move)
      puts "INVALID INPUT! Try Again:"
      move = @ui.make_move(PLAYER1)
    end
    while end_game?(board_setter(move, PLAYER1, board)) == false
      puts @ui.populate_board(board_setter(move, PLAYER1, board))
      move = calculate_illegal(@ui.make_move(PLAYER2), board, PLAYER2, ui)
      if end_game?(board_setter(move, PLAYER2, board)) == false
      puts @ui.populate_board(board_setter(move, PLAYER2, board))
      move = calculate_illegal(@ui.make_move(PLAYER1), board, PLAYER1, ui)
      end
    end
    if end_game?(board_setter(move, PLAYER1, board)) == true
      puts @ui.populate_board(@boardarray)
      puts @ui.announce_end(board_setter(move, PLAYER2, board))
    end
  end
  
  def calculate_illegal(playermove, board, player)
    move = 0
    move = playermove
    while illegal?(move) || cheater?(move)
      if illegal?(move)
        puts "INVALID INPUT! Try Again:"
        move = @ui.make_move(player)
      else
        puts "You are a cheater! You should be slapped."
        puts "Try Again:"
        move = @ui.make_move(player)
      end
    end
    move
  end
 
  def illegal?(spot)
    spot > 9 || spot < 1
  end
  
  def cheater?(board, spot)
    board[spot - 1] > 0
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
