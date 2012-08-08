
def drawboard(array)
  letters = ""
  array.each do |check|
    if check == 1
      letters << "x"
    elsif check == 2
      letters << "o"
    else
      letters << "_"
    end
  end
  puts "   |   |   "
  puts "_"+letters[0]+"_|_"+letters[1]+"_|_"+letters[2]+"_"
  puts "   |   |"
  puts "_"+letters[3]+"_|_"+letters[4]+"_|_"+letters[5]+"_"
  puts "   |   |   "
  puts "_"+letters[6]+"_|_"+letters[7]+"_|_"+letters[8]+"_"
end
