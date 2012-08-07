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
  


  def populate_board(uistyle)
    if uistyle == REGULAR
      return "   |   |   \n"+"_"+letters[0]+"_|_"+letters[1]+"_|_"+letters[2]+"_\n"+"   |   |   \n"+"_"+letters[3]+"_|_"+letters[4]+"_|_"+letters[5]+"_\n"+"   |   |   \n"+"_"+letters[6]+"_|_"+letters[7]+"_|_"+letters[8]+"_"
    elsif uistyle == FANCY
      return "1    |2    |3    \n"+"  "+letters[0]+"  |  "+letters[1]+"  |  "+letters[2]+"  \n"+"_____|_____|_____\n"+"4    |5    |6    \n"+"  "+letters[3]+"  |  "+letters[4]+"  |  "+letters[5]+"  \n"+"_____|_____|_____\n"+
      "7    |8    |9    \n"+"  "+letters[6]+"  |  "+letters[7]+"  |  "+letters[8]+"  \n"+"     |     |     \n"
    end
  end 
  
  def gamestart_message
    puts "Hit Enter to start"
   
   
   
   
    # special = gets.to_i    # if special == 11      # puts "Welcome Nick! Choose delay time:"      # $delay = gets.to_i    # else      # $delay = 1    # end    # puts "Hello. Welcome to Nick Jean-Baptiste's"      # sleep($delay)    # puts "  _____ _        _____            _____           "     # sleep($delay)    # puts " |_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___  "     # sleep($delay)    # puts "   | | | |/ __|   | |/ _` |/ __|   | |/ _ | / _ | "    # sleep($delay)    # puts "   | | | | (__    | | (_| | (__    | | (_) |  __/ "    # sleep($delay)      # puts "   |_| |_||___|   |_||__,_||___|   |_||___/ |___| "    # sleep($delay)    # print "Hit Enter to continue"    # arbitrary = gets    # choose_player    # sleep($delay)    # player_mark    # sleep($delay)    # puts "Choose your board graphics options:"    # puts "(1) OG GRAPHICS 2000"    # puts "(2) Super Slick HD Graphical System 2.0(default)"    # @ui_style = 0    # @ui_style = gets.chomp.to_i    # puts "Here is the board:"    # puts new_board_graphics    # sleep($delay)    # puts "When it's your turn, just type the number of the square you want to mark. Then hit Enter."    # sleep($delay)
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