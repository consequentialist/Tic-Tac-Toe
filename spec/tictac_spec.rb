require "rspec"
require "tictactoe"
require "endresult"
require "board"
require "ui"
require "unbeatable"
require "movevalidator"

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
    @end.is_vertical_win?([1,2,2,1,2,2,1,1,1], 1).should == true
    @end.is_vertical_win?([2,1,1,2,1,1,2,2,2], 2).should == true
    @end.is_vertical_win?([2,1,1,2,1,1,1,2,2], 2).should == false
  end
  
  it "can determine a horizontal win" do 
    @end.is_horizontal_win?([2,2,2,1,1,2,1,2,1], 2).should == true
  end
  
  it "can determine a diagonal win" do
    @end.is_diagonal_win?([1,1,2,2,1,2,2,1,1], 1).should == true
    @end.is_diagonal_win?([2,2,1,1,2,1,1,2,2], 2).should == true
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
    
    @mother.valid?("sdf").should == false
    @mother.valid?(15).should == false
    @mother.valid?(3).should == true
  end
  
  it "can determine cheating moves" do
    @mother.valid?(8).should == true
    @mother.valid?(1).should == true
  end
  
  it "can determine the player type" do
    @mother.what_player(1).should == Human
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
    @test_ui = mock(UserInterface, :new => true, :gamestart_message => true, :choose_mark => "x" , :invalid => true, :choose_ui => true, :choose_player_type => true, :splash => true)
    @mother.stub(:gameloop)
    UserInterface.stub(:new).and_return(@test_ui)
  end
  
  it "should call the gamestart message" do
    @test_ui.should_receive(:gamestart_message)
    @test_ui.should_receive(:choose_mark)
    #@test_ui.should_receive(:invalid)
    @test_ui.stub(:choose_mark).and_return("o")
    @test_ui.should_receive(:choose_ui)
    @test_ui.should_receive(:choose_player_type).exactly(2)
    @test_ui.should_receive(:splash)
    @mother.game_init
  end
  
end

describe "move validator" do
   let(:board) { Array.new(9, Board::EMPTY_SPACE) }
  
  it "knows when a negative move is out of bounds" do
    move = -1
    MoveValidator.validate(move, board).should be_false
  end
  
  it "knows when a positive number is out of bounds" do
    move = 29
    MoveValidator.validate(move, board).should == false
  end
  
  it "knows when a positive number is in bounds" do
    move = 2
    MoveValidator.validate(move, board).should == true
  end
  
  it "knows when a space is taken" do
    move = 2
    board[move] = "not empty"
    MoveValidator.validate(move, board).should == false
  end
  
  it "handles string input" do
    move = "2"
    MoveValidator.validate(move, board).should == true
  end
  
  it "throws out non-integer strings" do
    move = "garbage"
    MoveValidator.validate(move, board).should be_false
  end
end

describe "unbeatable ai" do
  
  before(:each) do
    @ai = SuperAI.new(1)
  end
    
  it "can devide the board into children" do
    board = [1,2,0,1,0,1,0,2,2]
    @ai.get_children(board, 1).should == [[1,2,1,1,0,1,0,2,2],[1,2,0,1,1,1,0,2,2],[1,2,0,1,0,1,1,2,2]]
  end 
  
  it "can rate an endgame win" do
    board = [1,2,2,1,1,2,2,1,1]
    @ai.rate_result(board).should == 1
  end
  
  it "can rate an endgame loss" do
    board = [1,1,2,2,2,2,1,2,1]
    @ai.rate_result(board).should == -1
  end
  
  it "can rate an endgame tie" do
    board = [1,2,2,2,1,1,1,2,2]
    @ai.rate_result(board).should == 0
  end
  
  it "can retun nil if a game is over" do
    board = [1,2,2,2,0,1,1,2,2]
    @ai.rate_result(board).should == nil
  end
  
  it "can retun 0 if a game is over" do
    board = [1, 2, 2, 2, 1, 1, 1, 1, 2]
    @ai.rate_result(board).should == 0
  end
  
  it "can return the highest rating" do
    p "THIS IS MINIMAX"
    board = [1,2,2,0,0,1,1,0,2]
    @ai.minimax(board).should == 1
  end
  
  it "can get the correct scenario" do
    board = [1,2,2,0,0,1,1,0,2]
    @ai.final_max(board).should == [1,2,2,1,0,1,1,0,2]
  end
  
  it "can make the correct move" do
    board = [1,2,2,0,0,1,1,0,2]
    @ai.make_move(board).should == 3
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

