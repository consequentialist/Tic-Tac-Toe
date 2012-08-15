class AI
  
  def choose_mark
    marks = ["A", "B"]
    choice = marks.sample
    choice
  end
  
  def get_available_indexes(board)
    available = []
    board.each_with_index do |spot, index|
      if spot == 0
        available << index
      end
    end
    available
  end
  
  def make_move(board, player)
     get_available_indexes(board).sample + 1
  end
  
end
