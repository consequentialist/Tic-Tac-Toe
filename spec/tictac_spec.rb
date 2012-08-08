require "rspec"
require "tictactoe"
require "winner"
require "board"
require "ui"
require "unbeatable"

describe "board" do
  
  before(:each) do
    @board = Board.new
  end
  
  it "can create a new board" do
    @board.to_array.should == [0,0,0,0,0,0,0,0,0]
  end
  
  it "can put an x in the top left corner" do
    @board.set_value(1,1).should == [1,0,0,0,0,0,0,0,0]
  end
  
  it "can put an o in the bottom right corner" do
    @board.set_value(9,2).should == [0,0,0,0,0,0,0,0,2]
  end
  
  it "can put an x in the center" do
    @board.set_value(5,1).should == [0,0,0,0,1,0,0,0,0]
  end
  
  it "can calculate an index" do
    @board.spot_to_index(7).should == 6
  end
end
  
  
describe "graphics" do
  
  before(:each) do
    @board = Board.new
  end
  
  #it "can create a new board" do
   # interface.new_board_graphics.should =="   |   |   
#_1_|_2_|_3_
#   |   |   
#_4_|_5_|_6_
#   |   |   
#_7_|_8_|_9_"
#  end
  
  #it "can accurately populate the board" do
 #   interface.populate_board([1,0,0,0,1,0,0,0,2]).should == "   |   |   
#_X_|_2_|_3_
#   |   |   
#_4_|_X_|_6_
 #  |   |   
#_7_|_8_|_O_"
  #end
  
  #it "can populate a board through [fake] user input" do
   # interface.populate_board(@board.set_value(5,1)).should == "   |   |   
#_1_|_2_|_3_
 #  |   |   
#_4_|_X_|_6_
  # |   |   
#_7_|_8_|_9_"
 # end
  
  
end

describe "game logic" do
 
  before(:each) do
    @end = EndResult.new
  end
 
  it "can determine a vertical win" do
    @end.is_vertical_win?([1,2,2,1,2,2,1,1,1]).should == 1
    @end.is_vertical_win?([2,1,1,2,1,1,2,2,2]).should == 2
  end
  
  it "can determine a horizontal win" do 
    @end.is_horizontal_win?([2,2,2,1,1,2,1,2,1]).should == 2
  end
  
  it "can determine a diagonal win" do
    @end.is_diagonal_win?([1,1,2,2,1,2,2,1,1]).should == 1
    @end.is_diagonal_win?([2,2,1,1,2,1,1,2,2]).should == 2
  end
  
  it "can determine the coutcome of any final board" do
    @end.determine_win([1,2,2,1,2,2,1,1,1]).should == 1
    @end.determine_win([2,2,1,1,1,2,2,1,1]).should == 3
  end
  
  
end

describe "mother" do
  
  before(:each) do
    @mother = Motherclass.new
  end
  
  it "can return a win from a set of moves or return the board" do
    board = Board.new
    @mother.board_setter(1,1,board).should == [1,0,0,0,0,0,0,0,0]
    @mother.board_setter(3,2,board).should == [1,0,2,0,0,0,0,0,0]
    @mother.board_setter(2,2,board).should == [1,2,2,0,0,0,0,0,0]
    @mother.board_setter(7,2,board).should == [1,2,2,0,0,0,2,0,0]
    @mother.board_setter(5,1,board).should == [1,2,2,0,1,0,2,0,0]
    @mother.board_setter(6,1,board).should == [1,2,2,0,1,1,2,0,0]
    @mother.board_setter(9,1,board).should == [1, 2, 2, 0, 1, 1, 2, 0, 1] 
  end
  
  it "can tell if the game is over or not" do
    board = Board.new
    @mother.end_game?(@mother.board_setter(1,1,board)).should == false
    @mother.end_game?(@mother.board_setter(2,2,board)).should == false
    @mother.end_game?(@mother.board_setter(3,1,board)).should == false
    @mother.end_game?(@mother.board_setter(4,2,board)).should == false
    @mother.end_game?(@mother.board_setter(5,1,board)).should == false
    @mother.end_game?(@mother.board_setter(6,2,board)).should == false
    @mother.end_game?(@mother.board_setter(7,1,board)).should == true
  end
  
  it "can determine illegal moves" do
    @mother.illegal?("sdf".to_i).should == true
    @mother.illegal?(15).should == true
    @mother.illegal?(3).should == false
  end
  
  it "can determine cheating moves" do
    @mother.cheater?([1,0,0,0,0,0,0,2,1], 8).should == true
    @mother.cheater?([0,2,2,1,2,1,1,2,1], 1).should == false
  end
end

describe "AI" do
  
   before(:each) do
    @ai = AI.new
  end
  
  it "can get available indexes" do
    @ai.get_available_indexes([1,0,0,2,0,2,1,0,0]).should == [1,2,4,7,8]
  end
  
  it "can make a random move" do
    @ai.make_move([1,0,0,2,0,2,1,0,0],2).should_not == 1 || 4 || 6 || 7
  end
  
  it "can choose a mark" do
    @ai.choose_mark.should satisfy {|mark| ["A", "B"].include?(mark)}
  end
  
end

describe "ui" do 
  
  before(:each) do
    @ui = UserInterface.new
  end
  
  it "can notify user of game end" do
    @ui.announce_end(1).should == "Player 1 wins!"
    @ui.announce_end(2).should == "Player 2 wins!"
    @ui.announce_end(3).should == "It's a tie!"
  end
  
end

describe "motherclass" do
  
  before(:each) do
    @mother = Motherclass.new
  end
  
  it "should call the gamestart message" do
    UserInterface.should_receive(:gamestart_message) { "Hit Enter to Start\n" }
    UserInterface.should_receive(:choose_mark) { "Choose Your Mark:\n" }
    UserInterface.should_receive(:invalid) { "Invalid input. Try again\n" }
    UserInterface.should_receive(:choose_ui) {"Choose User Interface Type:\n" +
                                              "(1) SD User Interface\n" +
                                              "(2) HD User Interface" }
    UserInterface.should_receive(:choose_player_type) { "Choose Player Type:\n" +
                                                   "(1) Human\n" +
                                                   "(2) Computer"}
    UserInterface.should_receive(:splash) { "  _____ _        _____            _____           \n" +
                                            " |_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___  \n" +
                                            "   | | | |/ __|   | |/ _` |/ __|   | |/ _ | / _ | \n" +
                                            "   | | | | (__    | | (_| | (__    | | (_) |  __/ \n" +
                                            "   |_| |_||___|   |_||__,_||___|   |_||___/ |___| \n"}
    @mother.game_init
  end

end

describe "unbeatable ai" do
  
  before(:each) do
    @ai = SuperAI.new
  end
  
  #it "can determine a winning index" do
   # @ai.win([1,1,0], 1).should == 2
   # @ai.win([2,0,2], 2).should == 1
  #end
  
 # it "can determine where to block" do
  #  @ai.block([1,1,0], 1).should == 2
   # @ai.block([2,0,2], 2).should == 1
  #end
  
 # it "can make a winning move based on a board" do
  #  @ai.main([1,2,0,2,0,2,1,0,1], 1).should satisfy {|move| [7,4].include?(move)}
  #end
  
 # it "can make a  winning move based on a board" do
  #  @ai.main([1,2,0,2,0,2,1,1,0], 1).should == 8
  #end
  
  #it "can make a block based on a board" do
   # @ai.main([2,1,1,2,0,0,1,0,0], 2).should == 4
  #end
  
 # it "can make an advance based on a board" do
  #  @ai.main([1,2,1,1,1,2,2,0,0], 2).should satisfy {|move| [7,8].include?(move)}
  #end
  
  #it "can make a correct first move" do
   # @ai.main([0,0,0,0,0,0,0,0,0], 1).should satisfy {|move| [0,2,6,8,4].include?(move)}
  #end
  
  #it "can make a correct second move" do
   # @ai.main([2,0,0,0,0,0,0,0,0], 1).should == 5
 # end
  
  #it "can move correctly in a special scenario" do
    #@ai.main([1,0,0,0,2,0,0,0,1], 2).should satisfy {|move| [1,3,5,7].include?(move)}
  #end
  
end

