require_relative 'unbeatable'
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
  
  def make_move(board, playertype, playernumber)
    move = 0
    if playertype != 3
      move = get_available_indexes(board).sample
    else
      move = SuperAI.new.main(board, playernumber)
    end
    move += 1
    move
  end
  
end