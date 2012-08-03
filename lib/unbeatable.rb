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
    if board.count(0) == 8 && board[4] == opponent
      move << [0,2,6,8].sample
    elsif board.count(0) == 8 && board[4] == 0
      move << 4
    end
    indexlist.each do |indeces|
      puts "this is opponent split check"
      puts opponent_advance(indeces, opponent, board)
      if opponent_advance(indeces, opponent, board) != nil && across(board, opponent) == false
        move << opponent_advance(indeces, opponent, board)
      elsif board.count(0) == 6 && across?(board, opponent)
        move << [1,3,5,7].sample
      elsif board.count(0) == 6 && board[4] == player
        puts "making advance"
        move << advance(indeces, player, board)
      end
      puts "this is move"
      puts move
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
    puts "this is move before flatten"
    puts move
    puts "after"
    puts move.flatten.sample
    return move.flatten.sample
    
  end
  
  def opponent_advance(indeces, opponent, board)
    opponentadvance = []
    opponentadvance << advance(indeces, opponent, board)
    if opponentadvance.group_by {|n| n}.max_by {|k,v| v.size}.last.size > 1
      opponentadvance.group_by {|n| n}.max_by {|k,v| v.size}.first
    end
  end
  
  def across?(board, opponent)
    board[0] + board[8] == opponent*2 || board[2] + board[6] == opponent*2
  end
  
  def win(indeces, player, board) #returns index of the move that should be taken
    line = []
    indeces.each do |index|
      line << board[index]
    end
    if line.count(player) == 2 && line.count(0) == 1
      return indeces[line.index(0)]
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