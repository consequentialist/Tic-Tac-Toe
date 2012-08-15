require_relative "ui"
class Human
  
  def initialize(player=nil)
    @player = player
  end
  
  def make_move(board)
    UserInterface.new.make_move(@player)
  end
  
end