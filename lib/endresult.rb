class EndResult
  
  PLAYER1 = 1
  PLAYER2 = 2
  TIE = 3
  
  def determine_win(finalboard)
    if is_vertical_win?(finalboard, PLAYER1) || is_horizontal_win?(finalboard, PLAYER1) || is_diagonal_win?(finalboard, PLAYER1)
      PLAYER1
    elsif is_vertical_win?(finalboard, PLAYER2) || is_horizontal_win?(finalboard, PLAYER2) || is_diagonal_win?(finalboard, PLAYER2)
      PLAYER2
    elsif finalboard.count(0) == 0
      TIE
    end
  end
  
  def is_vertical_win?(board, player)
   @player = player
   equal_to_player(board, [0,3,6]) || equal_to_player(board, [1,4,7]) || equal_to_player(board, [2,5,8])
  end
  
  def is_horizontal_win?(board, player)
    @player = player
    equal_to_player(board, [0,1,2]) || equal_to_player(board, [3,4,5]) || equal_to_player(board, [6,7,8])
  end
  
  def is_diagonal_win?(board, player)
    @player = player
    equal_to_player(board, [0,4,8]) || equal_to_player(board, [2,4,6])
  end
  
end

def equal_to_player(board, indeces)
  in_a_row = 0
  indeces.each do |index|
    in_a_row += 1 if board[index] == @player
  end
  in_a_row == 3
end
