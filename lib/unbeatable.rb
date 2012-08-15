require_relative "endresult"
class SuperAI
  
  def initialize(player)
     @player = player
  end
  
  def make_move(board, player=@player)
    @player = player
    final_max(board).each_with_index do |minimax, index|
      if minimax != board[index]
        return index
      end
    end
  end
  
  def final_max(board)
    get_children(board, @player).max_by do |child|
      minimax(child)
    end
  end
  
  def minimax(board, current_player=nil)
    current_player ||= @player
    
    return rate_result(board) if rate_result(board) != nil
    
    return max_results(current_player, board) if current_player == @player      
    
    min_results(current_player, board)

  end
  
  def max_results(current_player, board)
    max = -1000
    get_children(board, current_player).each do |child|
      max = [minimax(child, switch_player(current_player)), max].max
    end
    max
  end
  
  def min_results(current_player, board)
    min = 1000
    get_children(board, current_player).each do |child|
      min = [minimax(child, switch_player(current_player)), min].min
    end
    min
  end

  def rate_result(board)
    if EndResult.new.determine_win(board) == @player #win
      return 1
    elsif EndResult.new.determine_win(board) == EndResult::TIE #tie(fix this!)
      return 0
    elsif EndResult.new.determine_win(board) == nil #not any of those and not zero.
      return nil
    else
      return -1
    end
  end
  
  def get_children(board, current_player)
    children = []
    board.each_with_index do |spot, index|
      temp = board.clone
      if spot == 0
        temp[index] = current_player
        children << temp
      end
    end
    children
  end  
  
  def switch_player(current_player)
    current_player == 1 ? 2 : 1
  end

end