require_relative 'board'
require_relative 'endresult'
require_relative 'ui'
require_relative 'ai'
require_relative "human"
require_relative "unbeatable"
require_relative "movevalidator"



class Motherclass
  
  PLAYER1 = 1
  PLAYER2 = 2
  
  def initialize
    @board = Board.new
    @ui = UserInterface.new
    @ai = AI.new
  end
  
  def game_init
    ui = UserInterface.new
    ui.gamestart_message
    ui.splash
    @uistyle = ui.choose_ui
    @player1 = what_player(ui.choose_player_type(PLAYER1))
    @player2 = what_player(ui.choose_player_type(PLAYER2))
    @p1mark = ui.choose_mark
    @p2mark = ui.choose_mark
    while @p1mark == @p2mark
      ui.invalid
      p2mark = ui.choose_mark
    end
    gameloop
  end
  
  def what_player(playertype)
    if playertype == 1
      return Human
    end
    if playertype == 2
      playertype = UserInterface.new.choose_computer 
      if playertype == 1
        return AI
      else
        return SuperAI
      end
    end
  end
  
  def gameloop
    player = PLAYER1
    playertype = @player1
    @ui.populate_board(@uistyle, @board.to_array, @p1mark, @p2mark )
    while end_game?(@board.to_array) == false
      move = playertype.new(player).make_move(@board.to_array)
      GC.start
      while(!valid?(move))
        @ui.invalid
        move = playertype.new(player).make_move(@board.to_array)
      end
      @ui.populate_board(@uistyle, board_setter(move, player, @board), @p1mark, @p2mark )
      if player == PLAYER1
        player = PLAYER2
      else
        player = PLAYER1
      end
      if playertype == @player2
        playertype = @player1 
      else
        playertype = @player2
      end
    end
  end
  
  def calculate_illegal(playermove, board, player)
    move = 0
    move = playermove
    while valid?(move) == false || cheater?(move)
      if valid?(move) == false
        puts "INVALID INPUT! Try Again:"
        continue = gets
        move = playertype.new(player).make_move(@board.to_array)
      else 
        puts "You are a cheater! You should be slapped."
        puts "Try Again:"
        move = playertype.new(player).make_move(@board.to_array)
      end
    end
    move
  end
 
  def valid?(spot)
    MoveValidator.validate(spot, @board.to_array)
  end

  
  def board_setter(spot, player, board)
    @boardarray = []
    @boardarray += board.set_value(spot, player)
      return @boardarray
  end
  
  def end_game?(input)
    EndResult.new.determine_win(input) != nil
  end

end
