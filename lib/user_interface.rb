require_relative 'ai'

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
    if @ui_style == 1
      return "   |   |   \n" + "_1_|_2_|_3_\n" + "   |   |   \n" + "_4_|_5_|_6_\n" + "   |   |   \n" + "_7_|_8_|_9_" 
    elsif @ui_style == 2
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
  
  def player_mark
    if @p1type == 1
      puts "Player 1, choose your mark:"
      @p1mark = gets.chomp
    #puts @p1mark
    else 
      puts "Player 1 mark:"
      @p1mark = AI.new.choose_mark
    end
    sleep(1)
    if @p2type == 1
      puts "Player 2, choose your mark:"
      @p2mark = gets.chomp
    #puts @p2mark
    else 
      puts "Player 2 mark:"
      @p2mark = AI.new.choose_mark
    end
    while @p2mark == @p1mark
      if @p1type == 1
        puts "This mark is already being used by Player 1. Please choose another one:"
        @p2mark = gets.chomp
    #puts @p1mark
      else 
        @p2mark = AI.new.choose_mark
      end
    end
  end
  
  def populate_board(array)
  letters = ""
  number = 1
    array.each do |mark|
      #puts "here's the mark:"
      #puts $p1mark
      if mark == 1
        letters << @p1mark
        number += 1
      elsif mark == 2
        letters << @p2mark
        number += 1
      elsif @ui_style == 2
        letters << " "
      end
      if @ui_style == 1
        letters << number.to_s
        number += 1
      end
    end
    if @ui_style == 1
      return "   |   |   \n"+"_"+letters[0]+"_|_"+letters[1]+"_|_"+letters[2]+"_\n"+"   |   |   \n"+"_"+letters[3]+"_|_"+letters[4]+"_|_"+letters[5]+"_\n"+"   |   |   \n"+"_"+letters[6]+"_|_"+letters[7]+"_|_"+letters[8]+"_"
    else
      return "1    |2    |3    \n"+"  "+letters[0]+"  |  "+letters[1]+"  |  "+letters[2]+"  \n"+"_____|_____|_____\n"+"4    |5    |6    \n"+"  "+letters[3]+"  |  "+letters[4]+"  |  "+letters[5]+"  \n"+"_____|_____|_____\n"+
      "7    |8    |9    \n"+"  "+letters[6]+"  |  "+letters[7]+"  |  "+letters[8]+"  \n"+"     |     |     \n"
    end
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
    choose_player
    sleep(1)
    player_mark
    sleep(1)
    puts "Choose your board graphics options:"
    puts "(1) OG GRAPHICS 2000"
    puts "(2) Super Slick HD Graphical System 2.0(default)"
    @ui_style = 0
    @ui_style = gets.chomp.to_i
    puts @ui_style
    puts "Here is the board:"
    puts new_board_graphics
    sleep(1)
    puts "When it's your turn, just type the number of the square you want to mark. Then hit Enter."
    sleep(1)
  end
  
  def choose_player
    @p1type = 0
    @p2type = 0
    puts "Choose Player 1 Type:"
    puts "(H) Human"
    puts "(C) Computer"
    choice = gets.chomp
    @p1type = determine_choice(choice)
    sleep(1)
    puts "Choose Player 2 Type:"
    puts "(H) Human"
    puts "(C) Computer"
    choice = gets.chomp
    @p2type = determine_choice(choice)
    sleep(1)
    puts "Your Choices:"
    sleep(1)
    if @p1type == 1
      puts "Player 1 = Human"
    else
      puts "Player 1 = Computer"
    end
    sleep(1)
    if @p2type == 1
      puts "Player 2 = Human"
    else
      puts "Player 2 = Computer"
    end
  end
  
  def determine_choice(choice)
    ptype = 0
    if ["h","H"].include?(choice)
      ptype = 1
    elsif ["c","C"].include?(choice)
      ptype = 2
    else
      while ["h","H","c","C"].include?(choice) == false
      puts "Invalid input! Try Again:"
      choice = gets.chomp
      end
    end
    ptype
  end
  
  def game_play1(board)
    player1 = ""
    puts "Player 1 turn"
    sleep(1)
    if @p1type == 1
      player1 = gets
    else 
      puts "Player 1 is calculating..."
      sleep(2)
      player1 = AI.new.make_move(board.to_array)
      puts player1
    end
    return player1.to_i
  end
 
  def game_play2(board)
    player2 = ""
    puts "Player 2 turn"
    sleep(1)
    if @p2type == 1
      puts "p2 is human?"
      player2 = gets
    else 
      puts "Player 2 is calculating..."
      sleep(2)
      player2 = AI.new.make_move(board.to_array)
      puts player2
    end
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

end