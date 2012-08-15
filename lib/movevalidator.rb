require_relative 'board'

module MoveValidator
  
  def self.validate(move, board)
    is_valid_integer?(move, board) && is_empty_space?(move, board)
  end
  
  private
  
  def self.is_valid_integer?(move, board)
     indexes = []
     board.each_with_index do |value, index|
       indexes << index.to_s
     end
     move_string = move.to_s
     indexes.include?(move_string)
  end
  
  def self.is_empty_space?(move, board)
    board[move.to_i] == Board::EMPTY_SPACE
  end
  
end