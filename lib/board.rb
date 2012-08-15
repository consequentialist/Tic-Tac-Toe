class Board

  EMPTY_SPACE = 0
  
  def to_array
    @board
  end
  
  def initialize
    @board = []
    9.times do
      @board << EMPTY_SPACE 
    end
    @board
  end
  
  def set_value(spot, playermark)
    @board[spot_to_index(spot)] = playermark
    @board
  end
  
  def spot_to_index(spot)
    index = 0
    index = spot - 1
    index
  end
   
end