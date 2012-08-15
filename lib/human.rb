require_relative "ui"
class Human
  
def make_move(board, player)
  UserInterface.new.make_move(player)
end
  
end