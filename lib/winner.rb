class EndResult
  
  PLAYER1 = 1
  PLAYER2 = 2
  TIE = 3
  
  def sum(array, index1, index2, index3)
    if array[index1] != 0 && array[index2] != 0 && array[index3] != 0
    (array[index1] + array[index2] + array[index3])
    end
  end
  
  def determine_win(finalboard)
    if is_vertical_win?(finalboard) == PLAYER1 || is_horizontal_win?(finalboard) == PLAYER1 || is_diagonal_win?(finalboard) == PLAYER1
      PLAYER1
    elsif is_vertical_win?(finalboard) == PLAYER2 || is_horizontal_win?(finalboard) == PLAYER2 || is_diagonal_win?(finalboard) == PLAYER2
      PLAYER2
    elsif finalboard.count(0) == 0
      TIE
    else
      0
    end
  end
  
  def is_vertical_win?(array)
    winner = 0
    if sum(array,0,3,6) == 3*PLAYER1 || sum(array,1,4,7) == 3*PLAYER1 || sum(array,2,5,8) == PLAYER1
      PLAYER1
    elsif sum(array,0,3,6) == 3*PLAYER2 || sum(array,1,4,7) == 3*PLAYER2 || sum(array,2,5,8) == 3*PLAYER2
      PLAYER2
    end
  end
  
  def is_horizontal_win?(array)
    if sum(array,0,1,2) == 3*PLAYER1 || sum(array,3,4,5) == 3*PLAYER1 || sum(array,6,7,8) == 3*PLAYER1
      PLAYER1
    elsif sum(array,0,1,2) == 3*PLAYER2 || sum(array,3,4,5) == 3*PLAYER2 || sum(array,6,7,8) == 3*PLAYER2
      PLAYER2
    end
  end
  
  def is_diagonal_win?(array)
    if sum(array,0,4,8) == 3*PLAYER1 || sum(array,2,4,6) == 3*PLAYER1
      PLAYER1
    elsif sum(array,0,4,8) == 3*PLAYER2 || sum(array,2,4,6) == 3*PLAYER2
      PLAYER2
    end
  end
  
end 