require_relative 'ai'

class UserInterface
  
  PLAYER1 = 1
  PLAYER2 = 2
  REGULAR = 1
  FANCY = 2
  
  def new_board_graphics(uistyle)
    if uistyle == REGULAR
      return "   |   |   \n" + "_1_|_2_|_3_\n" + "   |   |   \n" + "_4_|_5_|_6_\n" + "   |   |   \n" + "_7_|_8_|_9_" 
    elsif uistyle == FANCY
      return "1    |2    |3    \n"+
   "     |     |     \n"+
   "_____|_____|_____\n"+
   "4    |5    |6    \n"+
   "     |     |     \n"+
   "_____|_____|_____\n"+
   "7    |8    |9    \n"+
   "     |     |     \n"+
   "     |     |     \n"
    end
  end
  


  def populate_board(uistyle, board, playermark)
    letters = []
    board.each do |mark|
      if mark = PLAYER1
        letters << player
      end
    end
    if uistyle == REGULAR
      return "   |   |   \n"+"_"+letters[0]+"_|_"+letters[1]+"_|_"+letters[2]+"_\n"+"   |   |   \n"+"_"+letters[3]+"_|_"+letters[4]+"_|_"+letters[5]+"_\n"+"   |   |   \n"+"_"+letters[6]+"_|_"+letters[7]+"_|_"+letters[8]+"_"
    elsif uistyle == FANCY
      return "1    |2    |3    \n"+"  "+letters[0]+"  |  "+letters[1]+"  |  "+letters[2]+"  \n"+"_____|_____|_____\n"+"4    |5    |6    \n"+"  "+letters[3]+"  |  "+letters[4]+"  |  "+letters[5]+"  \n"+"_____|_____|_____\n"+
      "7    |8    |9    \n"+"  "+letters[6]+"  |  "+letters[7]+"  |  "+letters[8]+"  \n"+"     |     |     \n"
    end
  end 
  
  def splash
     puts "  _____ _        _____            _____           " 
     sleep($delay)
     puts " |_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___  " 
     sleep($delay)
     puts "   | | | |/ __|   | |/ _` |/ __|   | |/ _ | / _ | "
     sleep($delay)
     puts "   | | | | (__    | | (_| | (__    | | (_) |  __/ "
     sleep($delay)  
     puts "   |_| |_||___|   |_||__,_||___|   |_||___/ |___| "
  end
  
  def gamestart_message
    puts "Hit Enter to start"
    if gets.to_i == 11
       $delay = gets.to_i
    else
      $delay = 1
    end
  end
  
  def make_move(player)
    puts "Player "+player.to_s+" turn"
    gets.to_i
  end
  
  def invalid
    puts "Invalid input. Try again:"
  end
  
  def choose_mark
    puts "Choose Your Mark:"
    gets.to_s
  end
  
  def choose_player_type(player)
    puts "Choose Player "+player.to_s+" Type:"
    puts "(1) Human"
    puts "(2) Computer"
    gets.to_i
  end
  
  def choose_computer
    puts "Choose Computer Type:"
    puts "(1) Dumb Computer"
    puts "(2) Smart Computer"
    gets.to_i
  end

  def choose_ui
    puts "Choose User Interface Type:"
    puts "(1) SD User Interface"
    puts "(2) HD User Interface"
    gets.to_i
  end
  
  def announce_end(winner)
    if winner == PLAYER1
      return "Player 1 wins!"
    elsif winner == PLAYER2
      return "Player 2 wins!"
    else
      return "It's a tie!"
    end
  end

end