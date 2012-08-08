#class Test
  
 # puts "hello"
  
  #def guess
   # charlie = ""
    #puts "test is good. type in some shit:"
    #charlie = gets
    #sleep(2)
    #print "calculating"
    #sleep(1)
    #print "."
    #sleep(1)
    #print "."
    #sleep(1)
    #print ".\n"
    #puts charlie
  #end
  
  #Test.new.guess
  
  
  
#end
class Board
  
  #def initialize
    
  #end
  
  def to_array
    @board
  end
  
  def initialize
    @board = []
    9.times do
    @board << 0
    end
    @board
    #puts @board
  end
  
  def set_value(spot, player) #x is from left, y is from top
    #puts @board
    @board[spot_to_index(spot)] = player
    @board
  end
  
  def spot_to_index(spot)
    index = 0
    index = spot - 1
    index
  end
  
end

module Winner
  
  def self.sum(array, index1, index2, index3)
    sum = 0
    if array[index1] != 0 && array[index2] != 0 && array[index3] != 0
    sum += (array[index1] + array[index2] + array[index3])
    end
    sum
  end
  
  def self.determine_win(finalboard)
    win = 0 # 1=player1, 2=player2, 3=tie
    #puts "this is determine win player1"
    #puts is_vertical_win?(finalboard)
    #puts is_horizontal_win?(finalboard)
    #puts is_diagonal_win?(finalboard)
    if is_vertical_win?(finalboard) == 1 || is_horizontal_win?(finalboard) == 1 || is_diagonal_win?(finalboard) == 1
      win +=  1
    elsif is_vertical_win?(finalboard) == 2 || is_horizontal_win?(finalboard) == 2 || is_diagonal_win?(finalboard) == 2
      win +=  2
    elsif finalboard.count(0) == 0
      win += 3
    end
    win
  end
  
  def self.is_vertical_win?(array)
    winner = 0
    if sum(array,0,3,6) == 3 || sum(array,1,4,7) == 3 || sum(array,2,5,8) == 3
      winner += 1
    elsif sum(array,0,3,6) == 6 || sum(array,1,4,7) == 6 || sum(array,2,5,8) == 6
      winner += 2
    end
    return winner
  end
  
  def self.is_horizontal_win?(array)
    winner = 0
    if sum(array,0,1,2) == 3 || sum(array,3,4,5) == 3 || sum(array,6,7,8) == 3
      winner += 1
    elsif sum(array,0,1,2) == 6 || sum(array,3,4,5) == 6 || sum(array,6,7,8) == 6
      winner += 2
    end
    return winner
  end
  
  def self.is_diagonal_win?(array)
    winner = 0
    if sum(array,0,4,8) == 3 || sum(array,2,4,6) == 3
      winner += 1
    elsif sum(array,0,4,8) == 6 || sum(array,2,4,6) == 6
      winner += 2
    end
    return winner
  end
  
  
end 

class UserInterface
  
  def player1
    spot = 0
    spot = gets.to_i
    spot
  end
  
 def player2
    spot = 0
    spot = gets.to_i
    spot
  end
  
  def new_board_graphics
  puts "   |   |   "
  puts "_1_|_2_|_3_"
  puts "   |   |   "
  puts "_4_|_5_|_6_"
  puts "   |   |   "
  puts "_7_|_8_|_9_"
  end
  
  def populate_board(array)
  letters = ""
  number = 1
  array.each do |check|
    if check == 1
      letters << "X"
      number += 1
    elsif check == 2
      letters << "O"
      number += 1
    else
      letters << number.to_s
      number += 1
    end
  end
  return "   |   |   \n"+
         "_"+letters[0]+"_|_"+letters[1]+"_|_"+letters[2]+"_\n"+"   |   |   \n"+"_"+letters[3]+"_|_"+letters[4]+"_|_"+letters[5]+"_\n"+"   |   |   \n"+"_"+letters[6]+"_|_"+letters[7]+"_|_"+letters[8]+"_"
  end
  
  def gamestart_message
    puts "Hello. Welcome to Nick Jean-Baptiste's"  
    sleep(1)
    puts "  _____ _        _____            _____           " 
    sleep(1)
    puts " |_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___  " 
    sleep(1)
    puts "   | | | |/ __|   | |/ _` |/ __|   | |/ _ | / _ | "
    sleep(1)
    puts "   | | | | (__    | | (_| | (__    | | (_) |  __/ "
    sleep(1)  
    puts "   |_| |_||___|   |_||__,_||___|   |_||___/ |___| "
    sleep(1)
    print "Hit Enter to continue"
    enter = gets
    puts "Player 1 type = Human"
    sleep(1)
    #puts "Choose Player 2 type..."
    #sleep(1)
    puts "Here is the board:"
    puts new_board_graphics
    sleep(1)
    puts "When it's your turn, just type the number of the square you want to mark. Then hit Enter."
    sleep(1)
  end
  
  def game_play1
    player1 = ""
    puts "Player 1 turn"
    sleep(1)
    player1 = gets
    return player1.to_i
  end
 
  def game_play2
    player2 = ""
    puts "Player 2 turn"
    sleep(1)
    player2 = gets
    return player2.to_i
  end
  
  def announce_end(number)
    if number == 1
      return "Player 1 wins!"
    elsif number == 2
      return "Player 2 wins!"
    else
      return "It's a tie!"
    end
  end
 
  #populate_board((Interface.new.player1, 1))
end

class Motherclass
  
  def initialize
    puts "GO!"
  end
  
  def user_interface
    board = Board.new
    #puts "the following is a test:"
    #puts UserInterface.new.populate_board(board_setter(UserInterface.new.game_play1, 2, board))
    UserInterface.new.gamestart_message
    #puts "For now, P1 has to type their choice two times. sorry,"
    p1 = UserInterface.new.game_play1
    p2 = 0
    while is_illegal?(p1)
    puts "INVALID INPUT! Try Again:"
    p1 = UserInterface.new.game_play1
    end
    while end_game?(board_setter(p1, 1, board)) == false
      #puts board_setter(UserInterface.new.game_play1, 1, board)
      while is_illegal?(p1)
        puts "INVALID INPUT! Try Again:"
        p1 = UserInterface.new.game_play1
      end
      puts UserInterface.new.populate_board(board_setter(p1, 1, board))
      puts "Player 1 has gone"
      p2 = UserInterface.new.game_play2
      while is_illegal?(p2) || is_cheater?(p2)
        if is_illegal?(p2)
          puts "INVALID INPUT! Try Again:"
          p2 = UserInterface.new.game_play2
        else
          puts "Player 2 is a cheater! They should be slapped."
          sleep(3)
          puts "Try Again:"
          p2 = UserInterface.new.game_play2
        end
      end
      if end_game?(board_setter(p2, 2, board)) == false
      puts UserInterface.new.populate_board(board_setter(p2, 2, board))
      puts "Player 2 has gone"
      p1 = UserInterface.new.game_play1
      while is_illegal?(p1) || is_cheater?(p1)
        if is_illegal?(p1)
          puts "INVALID INPUT! Try Again:"
          p1 = UserInterface.new.game_play1
        else
          puts "Player 1 is a cheater! They should be slapped."
          sleep(3)
          puts "Try Again:"
          p1 = UserInterface.new.game_play1
        end
      end
      end
    end
    if end_game?(board_setter(p1, 1, board)) == true
    puts UserInterface.new.announce_end(board_setter(p1, 1, board))
    end
  end
  
  def end_game?(input)
    currentboard = input
    [1, 2, 3].include?(currentboard) #currentboard == 1 || currentboard == 2 || currentboard == 3
  end
  
  def is_illegal?(spot)
    spot > 9 || spot < 1
  end
  
  
  
  def board_setter(spot, player, board)
    @boardarray = []
    @boardarray += board.set_value(spot, player)  
   # puts "this is boardarray:"
    #puts board.set_value(spot, player)
    #puts "this is determine winner"
    #puts Winner.determine_win(boardarray)
    if Winner.determine_win(@boardarray) == 0 
      return @boardarray
    else 
      return Winner.determine_win(@boardarray)
    end
  end
  
  def is_cheater?(spot)
    @boardarray[spot - 1] != 0
  end
  #GameInterface.new.board_setter(player1, 1, )
end



#class GameInterface
  
 # def board_setter(spot, player, board) #Sends stuff/gets stuff. Then checks to see if it's complete. If not, asks for more stuff. If yes, sends stuff to 'Game' class
  #  boardarray = []
   # boardarray += board.set_value(spot, player)
    #if boardarray.include?(0)
     # return "more stuff please"
    #else 
     # return Winner.determine_win(boardarray)
    #end
  #end  

#end






