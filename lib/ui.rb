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
      puts @p1mark
    end
    sleep($delay)
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
    puts @p2mark
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
    puts "Hit Enter to start"
    special = gets.to_i
    if special == 11
      puts "Welcome Nick! Choose delay time:"
      $delay = gets.to_i
    else
      $delay = 1
    end
    puts "Hello. Welcome to Nick Jean-Baptiste's"  
    sleep($delay)
    puts "  _____ _        _____            _____           " 
    sleep($delay)
    puts " |_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___  " 
    sleep($delay)
    puts "   | | | |/ __|   | |/ _` |/ __|   | |/ _ | / _ | "
    sleep($delay)
    puts "   | | | | (__    | | (_| | (__    | | (_) |  __/ "
    sleep($delay)  
    puts "   |_| |_||___|   |_||__,_||___|   |_||___/ |___| "
    sleep($delay)
    print "Hit Enter to continue"
    arbitrary = gets
    choose_player
    sleep($delay)
    player_mark
    sleep($delay)
    puts "Choose your board graphics options:"
    puts "(1) OG GRAPHICS 2000"
    puts "(2) Super Slick HD Graphical System 2.0(default)"
    @ui_style = 0
    @ui_style = gets.chomp.to_i
    puts "Here is the board:"
    puts new_board_graphics
    sleep($delay)
    puts "When it's your turn, just type the number of the square you want to mark. Then hit Enter."
    sleep($delay)
  end
  
  def choose_players
    
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
    sleep($delay)
    puts "Player 1 turn"
    sleep($delay)
    if @p1type == 1
      player1 = gets
    else 
      puts "Player 1 is calculating..."
      sleep(1)
      player1 = AI.new.make_move(board.to_array, @p1type, 1)
      puts player1
    end
    return player1.to_i
  end
 
  def game_play2(board)
    player2 = ""
    sleep($delay)
    puts "Player 2 turn"
    sleep($delay)
    if @p2type == 1
      player2 = gets
    else 
      puts "Player 2 is calculating..."
      sleep(1)
      player2 = AI.new.make_move(board.to_array, @p2type, 2)
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