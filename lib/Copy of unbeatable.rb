require_relative 'ai'
class SuperAI
  
  def main(board, player)
    opponent = 0
    if player == 1
      opponent = 2
    else
      opponent = 1
    end
    indexlist = []
    move = []
    indexlist << [0,1,2] << [3,4,5] << [6,7,8] << [0,3,6] << [1,4,7] << [2,5,8] << [0,4,8] << [2,4,6]
    indexlist.each do |indeces|
      move << win(indeces, player, board)
      move.compact!
    end
    if board.count(0) == 9
      move << [0,2,6,8]
    end
    if move.size == 0
      indexlist.each do |indeces|
        move << win(indeces, opponent, board)
        move.compact!
      end
      if move.size == 0
        indexlist.each do |indeces|
          move << advance(indeces, player, board)
          move.compact!
        end
      end
      if move.size == 0
        move << AI.new.make_move(board, 2, player) - 1
      end
    end
    move.flatten.sample
  end
  
  def win(indeces, player, board) #returns index of the move that should be taken
    line = []
    indeces.each do |index|
      line << board[index]
    end
    if board.count(0) == 8 && secondmove(board.index(1) || board.index(2)) != 0
      return secondmove(board.index(1) || board.index(2))
    elsif board.count(0) == 8 && board[4] == 0
      return 4
    elsif line.count(player) == 2 && line.count(0) == 1
      return indeces[line.index(0)]
    end
  end

  def secondmove(first)
    if first == 0
      [5,7].sample
    elsif first == 2
      [3,7].sample
    elsif first == 6
      [1,5].sample
    elsif first == 8
      [1,3].sample
    else 
      return 0
    end
  end

  def advance(indeces, player, board)
    line = []
    indeces.each do |index|
      line << board[index]
    end
    if line.count(player) == 1 && line.count(0) == 2
      numwithindex = {} 
      line.each_with_index do |number, index|
        if numwithindex[number] ||= []
          numwithindex[number] << index
        end
      end
      result = []
      numwithindex[0].each do |indexofzero|
        result << indeces[indexofzero]
      end
      result
    end 
  end

end