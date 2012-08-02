class Board

  def to_array
    @board
  end
  
  def initialize
    @board = []
    9.times do
    @board << 0
    end
    @board
  end
  
  def set_value(spot, player)
    @board[spot_to_index(spot)] = player
    @board
  end
  
  def spot_to_index(spot)
    index = 0
    index = spot - 1
    index
  end
   
end