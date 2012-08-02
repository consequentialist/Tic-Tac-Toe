class Winner
  
  def sum(array, index1, index2, index3)
    sum = 0
    if array[index1] != 0 && array[index2] != 0 && array[index3] != 0
    sum += (array[index1] + array[index2] + array[index3])
    end
    sum
  end
  
  def determine_win(finalboard)
    win = 0
    if is_vertical_win?(finalboard) == 1 || is_horizontal_win?(finalboard) == 1 || is_diagonal_win?(finalboard) == 1
      win +=  1
    elsif is_vertical_win?(finalboard) == 2 || is_horizontal_win?(finalboard) == 2 || is_diagonal_win?(finalboard) == 2
      win +=  2
    elsif finalboard.count(0) == 0
      win += 3
    end
    win
  end
  
  def is_vertical_win?(array)
    winner = 0
    if sum(array,0,3,6) == 3 || sum(array,1,4,7) == 3 || sum(array,2,5,8) == 3
      winner += 1
    elsif sum(array,0,3,6) == 6 || sum(array,1,4,7) == 6 || sum(array,2,5,8) == 6
      winner += 2
    end
    return winner
  end
  
  def is_horizontal_win?(array)
    winner = 0
    if sum(array,0,1,2) == 3 || sum(array,3,4,5) == 3 || sum(array,6,7,8) == 3
      winner += 1
    elsif sum(array,0,1,2) == 6 || sum(array,3,4,5) == 6 || sum(array,6,7,8) == 6
      winner += 2
    end
    return winner
  end
  
  def is_diagonal_win?(array)
    winner = 0
    if sum(array,0,4,8) == 3 || sum(array,2,4,6) == 3
      winner += 1
    elsif sum(array,0,4,8) == 6 || sum(array,2,4,6) == 6
      winner += 2
    end
    return winner
  end
  
end 