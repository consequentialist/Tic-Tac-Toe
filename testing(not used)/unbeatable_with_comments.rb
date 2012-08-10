class SuperAI
  
  def main(board, player)
    opponent = 0
    if player == 1
      opponent = 2
    else
      opponent = 1
    end
    #htop << board[0] << board[1] << board[2]
    #hmid << board[3] << board[4] << board[5]
    #hbot << board[6] << board[7] << board[8]
    #vleft << board[0] << board[3] << board[6]
    #vmid << board[1] << board[4] << board[7]
    #vright << board[2] << board[5] << board[8]
    #dtopleft << board[0] << board[4] << board[8]
    #dtopright << board[2] << board[4] << board[6]
    
    #move += win(board[0..2]) + block(board[0..2])
    #move += win(board[3..5]) + block(board[3..5]) #+3
    #move += win(board[6..8]) + block(board[6..8]) +6
    #move += win(board[0], board[3], board[6]) + block(board[0], board[3], board[6]) #x3
    #move += win(board[1], board[4], board[7]) + block(board[1], board[4], board[7]) #x3 +1
    #move += win(board[2], board[5], board[8]) + block(board[2], board[5], board[7]) #x3 +2
    #move += win(board[0], board[4], board[8]) + block(board[0], board[4], board[8]) #x4
    #move += win(board[2], board[4], board[6]) + block(board[2], board[4], board[6]) #x2 +2
    
    #boardivided << board[0..2] << board[3..5] << board[6..8] << [board[0], board[3], board[6]]
    #boardivided << [board[1], board[4], board[7]] << [board[2], board[5], board[8]]
    #boardivided << [board[0], board[4], board[8]] << [board[2], board[4], board[6]]
    
    #boardivided.each do |line|
      #linenumber = 0
      #move = 0
      #while move == 0 
      #  move += win(line)
     # end
    #end
    indexlist = []
    move = []
    indexlist << [0..2] << [3..5] << [6..8] << [0,3,6] << [1,4,7] << [2,5,8] << [0,4,8] << [2,4,6]
    indexlist.each do |indexes|
      move << win(indexes, player, board)
    end
      #move << win(indexes, opponent, board)
  end
  
  def win(indexes, player, board) #returns index of the move that should be taken
    line = []
    indexes.each do |index|
      line << board[index]
    end
    if line.count(player) == 2 && line.count(0) == 1
      return indexes[line.index(0)]
    end
  end
  
  #def block(line, opponent)
    #if line.count(opponent) == 2 && line.count(0) == 1
     # return line.index(0)
    #end
  #end
  
  def advance(indexes, player, board)
    line = []
    indexes.each do |index|
      line << board[index]
    end
    if line.count(player) == 1 && line.count(0) == 2
      numwithindex = {} 
      line.each_with_index do |number, index|
        if numwithindex[number] ||= []
          numwithindex[number] << index
        end
      end
      return numwithindex[0]
    end
  end
  
  
  
end